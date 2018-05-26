/******************************************
 * Verilog source constraint example
 * Node Preservation / Synplicity synthesis
 *    2/05/2001 
 * Lattice Semiconductor Corporation 
 ******************************************/

//// The syntax of Verilog Synplicity Node Preservation

//   wire [NodeName] /* synthesis syn_keep=1 opt="keep"*/;


module preserve(inA,inB,inC,inD,out);

input	inA,inB,inC,inD;
output	out;	

wire	nodeA /* synthesis syn_keep=1 opt="keep"*/;
wire	nodeB /* synthesis syn_keep=1 opt="keep"*/;

assign nodeA 	=  inA & inB;
assign nodeB 	=  inC & inD;

assign out 	=  nodeA & nodeB;

endmodule


