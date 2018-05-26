`timescale 1ns / 100ps


module tb_stdpllx2 ();

reg clk;
reg rst;
reg clken;
reg pllrst1;
reg pllrst2;
wire [3:0] qaout;
wire [3:0] qbout;
wire [3:0] qcout;
wire [3:0] qdout;


extendedpll UUT(.clk1(clk),.clk2(clk),.rst(rst),.pllfbk(clk),.pllrst1(pllrst1),.pllrst2(pllrst2),.clken1(clken),.clken2(clken),.qa(qaout), .qb(qbout),.qc(qcout), .qd(qdout));

initial
begin
	clk = 1'b0;
	rst = 1'b1;
	pllrst1 = 1'b1;
	pllrst2 = 1'b1;
	clken = 1'b0;
        # 400
	rst = 1'b0;
	pllrst1 = 1'b0;
	pllrst2 = 1'b0;
	clken = 1'b1;
	#20000 $finish;
end

always
begin
	#50 clk = 1'b0;
	#50 clk = 1'b1;
end

endmodule
