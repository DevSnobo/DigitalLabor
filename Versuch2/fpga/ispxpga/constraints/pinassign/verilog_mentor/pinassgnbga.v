/**************************************
 * Verilog source constraint example
 *    Pin Assignment for BGA Pkg.
 *    2/01/2001 K.Lee
 * Lattice Applications Engineering
 **************************************

 */

module pinassgn(inA10,inA11,inA6,oF4A9B4);

// The syntax of Verilog Exemplar pin assignment
// exemplar attribute [SigName] loc [Pin#]

input	inA10;		//exemplar attribute inA10 loc A10
input	inA11;		//exemplar attribute inA11 loc A11
input	inA6;		//exemplar attribute inA6 loc A6
output	[0:2] oF4A9B4;	//exemplar attribute oF4A9B4 loc F4,A9,B4

assign oF4A9B4[0] =  inA10 & inA11;
assign oF4A9B4[1] =  inA11 & inA6;
assign oF4A9B4[2] =  inA10 & inA6;

endmodule

