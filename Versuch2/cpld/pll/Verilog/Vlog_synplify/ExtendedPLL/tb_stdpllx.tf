`timescale 100ps / 10ps


module tb_stdpllx ();

`include "extendedpll.tfi"

initial
begin
	clk = 1'b0;
	rst = 1'b1;
	pllrst = 1'b1;
	clken = 1'b0;
        # 400
	pllrst = 1'b0;
        # 500
	clken = 1'b1;
        # 50
	rst = 1'b0;
	#20000 $finish;
end

always
begin
	#50 clk = 1'b0;
	#50 clk = 1'b1;
end
always
begin
	#50 pllfbk = 1'b0;
	#50 pllfbk = 1'b1;
end
endmodule
