`timescale 1ns / 1ns

module tb_vlg();

// Inputs
    reg refclk;
    reg [9:0] TxD;

// Outputs
    wire cslock;
    wire sout_p;
    wire sout_n;
//    integer cnt=0 ;
    integer i=0;

// Instantiate the UUT
    tx_10b12b_vlog uut (
        .refclk(refclk), 
        .TxD(TxD), 
        .sout_p(sout_p), 
        .sout_n(sout_n), 
        .cslock(cslock)
        );
        
// `ifdef auto_init

initial begin
	refclk = 0;
	TxD = 10'b0000000000;
	end
	

always #2 refclk = ~ refclk;

always @ (negedge refclk)
	begin
	   if (i < 10) 
		begin 
		TxD = 10'b1111100000; i = i + 1;
		end
	else
	   if (i==10) 
		begin 
		i = i + 1; 
		TxD = 10'b0000000000; 
		end
	   else
//	   cnt = (cnt + 1) % 12;
//	   if (cnt == 0)
           TxD = TxD + 1;
	end

endmodule
