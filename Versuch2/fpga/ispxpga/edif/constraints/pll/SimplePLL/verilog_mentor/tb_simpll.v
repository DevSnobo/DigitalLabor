`timescale 100ps/1ps


module tb ();

reg clk;
reg rst;
wire [3:0] qout;

simplepll uut(clk,rst,qout);

initial
begin
	clk = 1'b0;
	rst = 1'b1;
        # 400
	rst = 1'b0;
	#20000 $finish;
end

always
begin
	#200 clk = 1'b0;
	#200 clk = 1'b1;
end

endmodule
