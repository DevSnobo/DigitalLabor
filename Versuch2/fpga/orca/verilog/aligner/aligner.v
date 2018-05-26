module aligner(
	//data from RX gearbox
	unalign_data_66b,
	//descrambler interface
	align_data_64b,
	sync_bits,
	slip,
	//clock inputs
	clk_156mhz,
	//misc control
	frm_lock,
	hi_ber,
	channel_rdy,
	sys_reset_z
	  );

//data from RX gearbox
input	[65:0]	unalign_data_66b;//33-bit data from RX gearbox
//descrambler interface
output	[63:0]	align_data_64b;	//scrambled data
output	[1:0]	sync_bits;
output		slip;		//not align and force slip and try again
//misc control
input		clk_156mhz;	//~156MHz clock output
output		frm_lock;	//frame lock status
output		hi_ber;		// BER monitor hi_ber indicates output
input		channel_rdy;	//indicates that opto module is ready
input		sys_reset_z;	//system reset

//parameters
parameter  MAX_CHK_CNT = 63;

//alignment state machine
parameter 
	IDLE        = 'h1,
	CHK_SYNC    = 'h2,
	FRAME_LOCK  = 'h4;

//internal variables
reg 	[131:0] 	reg_132b;
wire 	[5:0] 	sync_det_map;
reg 	[5:0] 	sync_det_reg /* synthesis syn_maxfan=100 */;

reg 		idle;
reg 		chk_sync;
reg 		frame_lock;
reg 	[5:0] 	chk_cnt;
reg 		chk_cnt63;


wire 	[6:0] 	and1; 
reg 	[1:0] 	and1f; 
reg	 all_carrys; 
reg	 sum_all; 
reg	 no_align_found; 
reg 	[3:0] 	cnt_16;		// timer is used to wait for slip to be completed 

reg 	[1:0] 	sync_bits;
wire 	[1:0] 	sync0_bits;
wire 	[1:0] 	sync1_bits;
wire 	[1:0] 	sync2_bits;
wire 	[1:0] 	sync3_bits;
wire 	[1:0] 	sync4_bits;
wire 	[1:0] 	sync5_bits;
reg 		slip;
reg 	[63:0] 	align_data_64b;
wire 	[63:0] 	align0_data_64b;
wire 	[63:0] 	align1_data_64b;
wire 	[63:0] 	align2_data_64b;
wire 	[63:0] 	align3_data_64b;
wire 	[63:0] 	align4_data_64b;
wire 	[63:0] 	align5_data_64b;
reg 	[6:0] 	frame_cnt, i;
reg 	[4:0] 	sh_invalid_cnt;
reg 	[4:0] 	ber_cnt;
reg 	 	hi_ber;
wire 	 	clr_frame_cnt;
reg 	[14:0] 	cnt_125us;
reg 	 	cnt256;
reg 	 	cnth4c30;
reg 	 	cnt_125us_done;
reg 	 	sync_err;

//////////////////////////////////////////////////////////////

// put incoming 66b words into a 132b holding reg
always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) 
    reg_132b <= #1 132'd0;
  else begin
    reg_132b <= #1 {unalign_data_66b, reg_132b[131:66] };
  end // else
end //always

//////////////////////////////////////////////////////////////

//  Detect sync pattern somewhere within the first 8 bits of the 66b word
assign 
 sync_det_map[0] = ^reg_132b[1:0],
 sync_det_map[1] = ^reg_132b[2:1],
 sync_det_map[2] = ^reg_132b[3:2],
 sync_det_map[3] = ^reg_132b[4:3],
 sync_det_map[4] = ^reg_132b[5:4],
 sync_det_map[5] = ^reg_132b[6:5];

always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
     sync_det_reg <= #1 6'hff;
     cnt_16 <= #1 4'h0;
  end //if

  else if (idle == 1) begin	// IDLE state
     sync_det_reg <= #1 6'hff;
     cnt_16 <= #1 cnt_16 + 1'b1;
  
  end // else if 

  else if (chk_sync == 1) begin	// CHK_SYNC state
     cnt_16 <= #1 4'h0;
    for(i=0; i<6; i=i+1) begin
      if(~sync_det_map[i])
        sync_det_reg[i] <= #1 1'b0;
      else
        sync_det_reg[i] <= #1 sync_det_reg[i];
    end //for
  end //else if

end //always


//////////////////////////////////////////////////////////////

//--- check no 3 or more bits set
assign 
     and1[0] = sync_det_reg[0] & sync_det_reg[1],
     and1[1] = sync_det_reg[0] & sync_det_reg[2],
     and1[2] = sync_det_reg[0] & sync_det_reg[3],
     and1[3] = sync_det_reg[1] & sync_det_reg[2],
     and1[4] = sync_det_reg[1] & sync_det_reg[3],
     and1[5] = sync_det_reg[2] & sync_det_reg[3],
     and1[6] = sync_det_reg[4] & sync_det_reg[5];

// XOR all bits Note this does not completely determine
// if there is only one bit set --  may be 3 or 5 

always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin 
	sum_all <= #1 1'b0;
	and1f <= #1 2'b00;
	all_carrys <= #1 1'b0; 
	no_align_found <= #1 1'b0;
  end //if
  else begin
	and1f[0] <= #1 (|and1[3:0]);
	and1f[1] <= #1 (|and1[6:4]);
	sum_all <= #1 ^sync_det_reg[5:0];
	all_carrys <= #1 (|and1f[1:0]); 
	no_align_found <= #1 (sync_det_reg[5:0] == 6'h00);
  end //else 
end //always

//////////////////////////////////////////////////////////////

// State Machine - indicates whether we're aligned or not
always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
	slip <= #1 1'b0;
	idle <= #1 1'b1;
	chk_sync <= #1 1'b0;
	frame_lock <= #1 1'b0;
  end //if
  else if(idle == 1) begin // IDLE state
	if (cnt_16 == 3) begin
		slip <= #1 1'b0;
	end 
	if (channel_rdy && (cnt_16 == 12)) begin     // channel_rdy and slip_done
		chk_sync <= #1 1'b1;
		idle <= #1 1'b0;
	end // if
/*
	else
		idle <= #1 1'b1;
*/
  end //IDLE state
  else if(chk_sync == 1) begin // CHK_SYNC state
    // When sum_all = 1 and all_carrys = 0, then only 1 bit is
    // set in the sync_det_reg.  We want to make sure that we don't
    // get false alignments due to multiple sync detects
	if (chk_cnt63 && sum_all && ~all_carrys) begin
		chk_sync <= #1 1'b0;
		frame_lock <= #1 1'b1;
	end // if
	else if (no_align_found) begin
		slip <= #1 1'b1;
		idle <= #1 1'b1;
		chk_sync <= #1 1'b0;
	end  // else if
/*
	else
		chk_sync <= #1 1'b1;
*/
  end //CHK_SYNC state
  else if(frame_lock == 1) begin // FRAME_LOCK state
	if (sh_invalid_cnt[4]) begin
		idle <= #1 1'b1;
		frame_lock <= #1 1'b0;
	end // if
/*
	else
		frame_lock <= #1 1'b1;
*/
  end //FRAME_LOCK state
end //always

// Sync check counter
always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
    chk_cnt <= #1 6'h00;
    chk_cnt63 <= #1 1'b0;
  end //if
  else if (idle == 1) begin	// IDLE state
    chk_cnt <= #1 6'h00;
    chk_cnt63 <= #1 1'b0;
  end // else if
  else if (chk_sync == 1) begin	//CHK_SYNC state
    chk_cnt <= #1 chk_cnt + 1'b1;
      if (chk_cnt == 62)
	chk_cnt63 <= #1 1'b1;
      else
	chk_cnt63 <= #1 1'b0;
  end // else if

end //always

//////////////////////////////////////////////////////////////

// assign frame lock state to the module output port frm_lock 
wire frm_lock = (frame_lock == 1);	// FRAME_LOCK state

// barrel shift out data based upon final value in sync_det_reg
always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
    align_data_64b <= #1 64'h0000_0000_0000_0000;
    sync_bits <= #1 2'b00;
  end //if

  //NOTE: all bits in sync_det_reg are mutually exclusive
  else  begin
	align_data_64b[63:0] <= #1 align0_data_64b[63:0] | align1_data_64b[63:0]
	| align2_data_64b[63:0] | align3_data_64b[63:0] | align4_data_64b[63:0]
	| align5_data_64b[63:0]; 

	sync_bits[1:0] <= #1 sync0_bits[1:0] | sync1_bits[1:0] | sync2_bits[1:0]
		| sync3_bits[1:0] | sync4_bits[1:0] | sync5_bits[1:0];
  end //else 
end //always

assign 
	align0_data_64b[63:0] = sync_det_reg[0] ? reg_132b[65:2] : 64'h0000000000000000,
	align1_data_64b[63:0] = sync_det_reg[1] ? reg_132b[66:3] : 64'h0000000000000000,
	align2_data_64b[63:0] = sync_det_reg[2] ? reg_132b[67:4] : 64'h0000000000000000,
	align3_data_64b[63:0] = sync_det_reg[3] ? reg_132b[68:5] : 64'h0000000000000000,
	align4_data_64b[63:0] = sync_det_reg[4] ? reg_132b[69:6] : 64'h0000000000000000,
	align5_data_64b[63:0] = sync_det_reg[5] ? reg_132b[70:7] : 64'h0000000000000000;

assign 
	sync0_bits[1:0] =  sync_det_reg[0] ? reg_132b[1:0] : 2'b00,
	sync1_bits[1:0] =  sync_det_reg[1] ? reg_132b[2:1] : 2'b00,
	sync2_bits[1:0] =  sync_det_reg[2] ? reg_132b[3:2] : 2'b00,
	sync3_bits[1:0] =  sync_det_reg[3] ? reg_132b[4:3] : 2'b00,
	sync4_bits[1:0] =  sync_det_reg[4] ? reg_132b[5:4] : 2'b00,
	sync5_bits[1:0] =  sync_det_reg[5] ? reg_132b[6:5] : 2'b00;

//////////////////////////////////////////////////////////////

// Check for 16 out of 64 frames
// with sync bits of 1,1 or 0,0.  This condition is only
// checked when we're in the FRAME_LOCK state
always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z)
    frame_cnt <= #1 7'h00;
  else if (idle == 1 || clr_frame_cnt)	// IDLE state
    frame_cnt <= #1 7'h00;
  else if (frame_lock == 1)	// FRAME_LOCK state
    frame_cnt <= #1 frame_cnt + 1'b1;
end //always

always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z)
    sh_invalid_cnt <= #1 5'h00;
  else if (idle == 1 || clr_frame_cnt)	// IDLE state
    sh_invalid_cnt <= #1 5'h00;
  else if ((frame_lock == 1) && (~frame_cnt[6]) && sync_err)  // FRAME_LOCK state
    sh_invalid_cnt <= #1 sh_invalid_cnt + 1'b1;
end //always

assign clr_frame_cnt = (~sh_invalid_cnt[4]) & frame_cnt[6];

//////////////////////////////////////////////////////////////

// Check for the high BER condition - 16 errors in 125usec.
// This condition is only checked when we're in
// the FRAME_LOCK state
always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
    cnt_125us <= #1 15'h0000;
    cnt256 <= #1 1'b0;
    cnth4c30 <= #1 1'b0;
    ber_cnt <= #1 5'h0;
  end // if
//	clear 125us counter if not in FRAME_LOCK state or cnt_125us_done or ber_cnt[4] is true
  else if (frame_lock == 0 || cnt_125us_done || ber_cnt[4]) begin
    cnt_125us <= #1 15'h0000;
    cnth4c30 <= #1 1'b0;
    ber_cnt <= #1 5'h0;
  end // else if
  else begin	// FRAME_LOCK state
// generate a 15 bit cnt_125us counter for run in speed
    cnt_125us[7:0] <= #1 cnt_125us[7:0] + 1'b1;
	if(cnt_125us[7:0] == 8'hfe)
		cnt256 <= #1 1'b1;
	else
		cnt256 <= #1 1'b0;
	if(cnt256)
    		cnt_125us[14:8] <= #1 cnt_125us[14:8] + 1'b1;

	if(cnt_125us ==15'h4c2f)
		cnth4c30 <= #1 1'b1;
  	if (sync_err) begin	// sync bits error
    		ber_cnt <= #1 ber_cnt + 1'b1;
	end  // if
  end //else if
end //always

always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
	sync_err <= #1 1'b0;
  end // if
  else if(sync_bits[0] == sync_bits[1])
	sync_err <= #1 1'b1;
  else 
	sync_err <= #1 1'b0;
end //always

always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
	cnt_125us_done <= #1 1'b0;
  end // if
  else 
	cnt_125us_done <= #1 cnth4c30;
end //always


always @(posedge clk_156mhz or negedge sys_reset_z) begin
  if(~sys_reset_z) begin
	hi_ber <= #1 1'b0;
  end // if
  else if(ber_cnt[4] == 1)
	hi_ber <= #1 1'b1;
  else if(cnt_125us_done == 1)
	hi_ber <= #1 1'b0;
end //always

//exemplar begin
//exemplar attribute aligner PGROUP aligner
//exemplar end

endmodule
