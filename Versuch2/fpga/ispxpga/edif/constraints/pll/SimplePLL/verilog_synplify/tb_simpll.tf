`timescale 100ps/1ps


module tb_simpll ();

reg clk;
reg rst;
wire [3:0] qout;

simplepll UUT(.clk(clk),.rst(rst),.qout(qout));

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
	#50 clk = 1'b0;
	#50 clk = 1'b1;
end

endmodule
