/****************************************
 * Verilog source constraint example
 *    Pin PULL Control for Mentor
 *    2/05/2001
 * Lattice Semiconductor Corporation 
 ****************************************/


/*** The syntax of Verilog Mentor Pin PULL control ***/
 //exemplar attribute [PinName] PULL [TYPE]
  /* TYPE can be either UP, DOWN, HOLD or OFF */


module vlogpull(A,B,C,YUP,YDN,YHD,YOF);

	input A,B,C;	//exemplar attribute A PULL UP
			//exemplar attribute B PULL DOWN
			//exemplar attribute C PULL HOLD
	output YUP; 	//exemplar attribute YUP PULL UP
	output YDN; 	//exemplar attribute YDN PULL DOWN
	output YHD; 	//exemplar attribute YHD PULL HOLD
	output YOF; 	//exemplar attribute YOF PULL OFF

	assign YUP = !A & B & C;
	assign YDN = A & !B & C;
	assign YHD = A & B & !C;
	assign YOF = !A & !B & !C;

endmodule


