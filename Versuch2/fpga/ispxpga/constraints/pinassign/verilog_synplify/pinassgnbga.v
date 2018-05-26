/**************************************
 * Verilog source constraint example
 *    Pin Assignment for BGA Pkg.
 *    2/01/2001 K.Lee
 * Lattice Applications Engineering
 **************************************

 */

module pinassgn(inA11,inA5,inA6,oF4A9B4);

// The syntax of Verilog Synplicity pin assignment
// The following syntax must be included in each pin declaration line BEFORE the semicomlon. 
// synthesis loc="[Pin#]"

input	inA11		/*synthesis loc="A11"*/;
input	inA5		/*synthesis loc="A5"*/;
input	inA6		/*synthesis loc="A6"*/;
output	[0:2] oF4A9B4	/*synthesis loc="F4 A9 B4"*/;

assign oF4A9B4[0] =  inA11 & inA5;
assign oF4A9B4[1] =  inA5 & inA6;
assign oF4A9B4[2] =  inA11 & inA6;

endmodule

