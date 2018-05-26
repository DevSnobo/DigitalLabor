/****************************************
 * Verilog source constraint example
 *    Pin PULL Control for Synplicity
 *    2/05/2001 K.Lee
 * Lattice Applications Engineering
 ****************************************/


/*** The syntax of Verilog Synplicity Pin PULL control ***/
 // [PinType] [PinName] /* synthesis PULL="TYPE" */;
   // PinType: either input or output 
   // TYPE can be either UP, DOWN, HOLD or OFF */


module vlogpull(A,B,C,YUP,YDN,YHD,YOF);

	input A  /* synthesis PULL="UP" */;
	input B  /* synthesis PULL="DOWN" */;
	input C  /* synthesis PULL="HOLD" */;

	output YUP /* synthesis PULL="UP" */;
	output YDN /* synthesis PULL="DOWN" */;
	output YHD /* synthesis PULL="HOLD" */;
	output YOF /* synthesis PULL="OFF" */;

	assign YUP = !A & B & C;
	assign YDN = A & !B & C;
	assign YHD = A & B & !C;
	assign YOF = !A & !B & !C;

endmodule


