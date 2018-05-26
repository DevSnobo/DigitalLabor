// PREP Benchmark 6, Sixteen Bit Accumulator

/* PREP6 contains a sixteen bit accumulator

Copyright (c) 1994 Synplicity, Inc.*/	


module prep6(Q,dummy, CLK, RST, D);
output [15:0] Q;
output [1:0] dummy;	//remove warning message in DPM process

input CLK, RST;
input [15:0] D;
reg [15:0] Q;

assign dummy[1] = 1;	//remove warning message in DPM process
assign dummy[0] = 0;	//remove warning message in DPM process

always  @(posedge CLK or posedge RST)
begin
	if (RST)	Q = 0;	 // reset logic
	else Q = Q + D; // accumulate
end

endmodule
