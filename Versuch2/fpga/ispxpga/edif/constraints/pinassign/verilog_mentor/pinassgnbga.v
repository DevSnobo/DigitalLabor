/**************************************
 * Verilog source constraint example
 *    Pin Assignment for BGA Pkg.
 *    2/01/2001 K.Lee
 * Lattice Applications Engineering
 **************************************

 */

module pinassgn(inA10,inA11,inAA5,oF8A9B4);

// The syntax of Verilog Exemplar pin assignment
// exemplar attribute [SigName] loc [Pin#]

input	inA10;		//exemplar attribute inA10 loc A10
input	inA11;		//exemplar attribute inA11 loc A11
input	inAA5;		//exemplar attribute inAA5 loc AA5
output	[0:2] oF8A9B4;	//exemplar attribute oF8A9B4 loc F8,A9,B4

assign oF8A9B4[0] =  inA10 & inA11;
assign oF8A9B4[1] =  inA11 & inAA5;
assign oF8A9B4[2] =  inA10 & inAA5;

endmodule

