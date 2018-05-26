module counter16 ( Sclr, Cnt_En, UpDown, Q,  Clock );
input Clock, UpDown, Cnt_En, Sclr;
output [15:0] Q;

test U0 ( .Sclr(Sclr), .Cnt_En(Cnt_En), .UpDown(UpDown), .Q(Q), .Clock(Clock) );
    defparam U0.lpm_type = "LPM_COUNTER";
    defparam U0.lpm_width = 16;
    defparam U0.lpm_direction = "UNUSED";

endmodule


module test ( Q, Data, Clock, Clk_En, Cnt_En, UpDown, Sclr );  /* synthesis syn_black_box */ 


	parameter lpm_type = "LPM_COUNTER";
	parameter lpm_width = 16;
	parameter lpm_direction = "UNUSED";

	output [lpm_width-1:0] Q;
	input  [lpm_width-1:0] Data;
	input  Clock, Clk_En, Cnt_En, UpDown;
	input  Sclr;

endmodule // lpm_counter
