/**************************************
 * Verilog source constraint example
 *    Pin Assignment for BGA Pkg.
 *            2/01/2001
 * Lattice Semiconductor Corporation 
 **************************************

 Target device = LC4256ZE-5MN144C
 For QFP type syntax, see pinassgnQFP.syn */

module pinassgn(inA3,inB4,inC5,oF10A2B3);

// The syntax of Verilog Mentor pin assignment
// exemplar attribute [SigName] loc P[Pin#]

input	inA3;		//exemplar attribute inA3 loc PA3
input	inB4;		//exemplar attribute inB4 loc PB4
input	inC5;		//exemplar attribute inC5 loc PC5
output	[0:2] oF10A2B3;	//exemplar attribute oF8A2B3 loc PF10PA4PB3

assign oF10A2B3[0] =  inA3 & inB4;
assign oF10A2B3[1] =  inB4 & inC5;
assign oF10A2B3[2] =  inA3 & inC5;

endmodule

