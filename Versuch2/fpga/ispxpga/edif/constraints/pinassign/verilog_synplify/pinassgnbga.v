/**************************************
 * Verilog source constraint example
 *    Pin Assignment for BGA Pkg.
 *    2/01/2001 K.Lee
 * Lattice Applications Engineering
 **************************************

 */

module pinassgn(inA11,inAA5,inAA26,oF8A9B4);

// The syntax of Verilog Synplicity pin assignment
// The following syntax must be included in each pin declaration line BEFORE the semicomlon. 
// synthesis loc="[Pin#]"

input	inA11		/*synthesis loc="A11"*/;
input	inAA5		/*synthesis loc="AA5"*/;
input	inAA26		/*synthesis loc="AA26"*/;
output	[0:2] oF8A9B4	/*synthesis loc="F8 A9 B4"*/;

assign oF8A9B4[0] =  inA11 & inAA5;
assign oF8A9B4[1] =  inAA5 & inAA26;
assign oF8A9B4[2] =  inA11 & inAA26;

endmodule

