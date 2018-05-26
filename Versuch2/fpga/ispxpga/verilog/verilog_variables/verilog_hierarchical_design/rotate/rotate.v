`timescale 1 ns / 1 ns
module rotate(q, data, clk, r_l, rst); // rotates bits or loads
output [(`data_width-1):0] q;
input [(`data_width-1):0] data;
input clk, r_l, rst;
reg [(`data_width-1):0] q;

// when r_l is high, it rotates; if low, it loads data
always @(posedge clk or posedge rst)
begin
	if (rst)
		q = 8'b0;
	else if (r_l)
		q = {q[(`data_width-2):0], q[(`data_width-1)]};
	else
		q = data;
end
endmodule



