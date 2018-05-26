`timescale 1ns / 1ns

module ver_sim;    

`include "biabel.tfi"

reg bidir1_reg;   //  Define a register outside of the Unit Under Test
assign bidir1 = bidir1_reg;  //  Continuous Assignment of the register to the wire

//
// bidir1 is the tristate bidirectional bus from your design
//
// bidir1_reg is an external register we defined outside of your design
// we have connected the the output bidir1 to the external register bidir1_reg
// via an assign statement 

initial begin
// To DRIVE the tristate output from INSIDE your design, set:
	bidir1_reg = 1'bZ;
// Assign the register High Impedance while cntrl is high
// This tristates the register bidir1_reg outside of the Unit Under Test  so that
// you can monitor the output bidir1 
	ctrl = 1'b1;
	in1 = 1'b0; 	     
	#10 in1 = 1'b1; ctrl = 1'b1;
// To DRIVE your circuit design from OUTSIDE your design, set:
	#10 bidir1_reg = 1'b0;
// Assign the register a value (0) when the cntrl is low
	in1 = 1'b1; ctrl = 1'b0;   
	#10 in1 = 1'b1; ctrl = 1'b0;  bidir1_reg = 1'b1;
	#10 in1 = 1'b0; ctrl = 1'b0; 
	#10 in1 = 1'b0; ctrl = 1'b1;  bidir1_reg = 1'bZ;
	#10 in1 = 1'b1; ctrl = 1'b1;
    
end


endmodule


