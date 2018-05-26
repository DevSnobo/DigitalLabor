/**************************************
 * Verilog source constraint example
 *    Pin Assignment for PLCC/QFP Pkg.
 *         2/01/2001
 * Lattice Semiconductor Corporation 
 **************************************

 Target device = LC4256ZE-5TN100C
 For BGA type syntax, see pinassgnBGA.syn*/

module pinassgnqfp(in5,in8,in10,o);

// The syntax of Verilog Synplicity pin assignment
// The following syntax must be included in each pin declaration line BEFORE the semicomlon. 
// synthesis loc="P[Pin#]"

input	in5 		/*synthesis loc="P5"*/;
input	in8 		/*synthesis loc="P8"*/;
input	in10 		/*synthesis loc="P10"*/;
output	[11:13] o 	/*synthesis loc="P11P22P55"*/;

assign o[11] =  in5 & in8;
assign o[12] =  in8 & in10;
assign o[13] =  in5 & in10;

endmodule

