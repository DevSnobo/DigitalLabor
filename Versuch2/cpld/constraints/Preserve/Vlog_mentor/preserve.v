/****************************************
 * Verilog source constraint example
 * Node Preservation / Mentor synthesis
 *    		2/05/2001
 * Lattice Semiconductor Corporation 
 ****************************************/

/*** The syntax of Verilog Mentor Node Preservation ***/
  /*** For synthesizer node preservation ***/
   //exemplar attribute [NodeName] preserve_signal true

  /*** For the device fitter node preservation ***/
   //exemplar attribute [NodeName] opt keep

module preserve(inA,inB,inC,inD,out);

input	inA,inB,inC,inD;
output	out;	
wire	nodeA, nodeB;

/**** Node preservation for nodeA **************/
//exemplar attribute nodeA preserve_signal true
//exemplar attribute nodeA opt keep

/**** The following comment form also works ****/
/*exemplar attribute nodeB preserve_signal true
  exemplar attribute nodeB opt keep*/

assign nodeA 	=  inA & inB;
assign nodeB 	=  inC & inD;

assign out 	=  nodeA & nodeB;

endmodule

