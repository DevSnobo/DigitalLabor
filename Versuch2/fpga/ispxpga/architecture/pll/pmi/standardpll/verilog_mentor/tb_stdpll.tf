`timescale 100ps / 10ps


module tb_stdpll ();

reg clk;
reg rst;
reg clken;
wire [3:0] qaout;

standardpll UUT(.clk(clk),.rst(rst),.clken(clken),.qa(qaout));

initial
begin
	clk = 1'b0;
	rst = 1'b1;
	clken = 1'b0;
        # 400
	rst = 1'b0;
	clken = 1'b1;
	#20000 $finish;
end

always
begin
	#50 clk = 1'b0;
	#50 clk = 1'b1;
end

endmodule
