// PREP Benchmark 5, Arithmetic Circuit

/* PREP5 contains a multiplier and accumulator

Copyright (c) 1994 Synplicity, Inc.*/	


module prep5(Q,dummy,CLK, MAC, RST, A, B);
output [7:0] Q;
output [1:0] dummy;	//remove warning message in DPM process

input CLK, MAC, RST;
input [3:0] A, B;
reg [7:0] Q;

assign dummy[1] = 1;	//remove warning message in DPM process
assign dummy[0] = 0;	//remove warning message in DPM process

// multiplier
wire [7:0]  multiply_output = A * B;
// adder:
wire [7:0] adder_output = MAC ?   multiply_output + Q : multiply_output;

// register with asynchronous reset
always @(posedge CLK  or posedge RST)
begin
	if (RST)
		Q = 0;
	else
		Q = adder_output;
end
 
endmodule
