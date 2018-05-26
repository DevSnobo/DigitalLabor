`timescale 100ps / 10ps


module tb ();

reg clk;
reg rst;
reg clken;
reg pllrst;
wire [3:0] qaout;
wire [3:0] qbout;

extendedpll uut(clk,rst,pllfbk,pllrst,clken,qaout,qbout);

initial
begin
	clk = 1'b0;
	rst = 1'b1;
	pllrst = 1'b1;
	clken = 1'b0;
        # 400
	rst = 1'b0;
	pllrst = 1'b0;
	clken = 1'b1;
	#20000 $finish;
end

always
begin
	#200 clk = 1'b0;
	#200 clk = 1'b1;
end

endmodule
