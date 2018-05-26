`timescale 1 ns / 1 ns
module reg8(q, data, clk, rst); // eight bit register
output [`data_width-1:0] q;
input [`data_width-1:0] data;
input clk, rst;
reg [`data_width-1:0] q;

always @(posedge clk or posedge rst)
begin
	if (rst)
		q = 0;
	else
		q = data;
end
endmodule


