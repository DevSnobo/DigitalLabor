/**************************************
 * Verilog source constraint example
 *   Open Drain Output for Mentor
 * Lattice Semiconductor Corporation 
"**************************************/

/** Verilog Mentor syntax for Open Drain output
    Note: There is no dedicated attribute of Opendrain in Verilog.
          The IO_TYPES attibute can be used to assign Opendrain to a pin.

 //exemplar attribute [Pin_name] IO_TYPES LVCMOS33_OD,[DriveCurrent]; or
 //exemplar attribute [Pin_name] IO_TYPES LVCMOS25_OD,[DriveCurrent]; or
 //exemplar attribute [Pin_name] IO_TYPES LVCMOS18_OD,[DriveCurrent];

   DriveCurrent(mA) = 20, 16, 12, 8, 5, 4 or NONE;

**/


module vlogod(inA,inB,outA_OD,outB_OD,outC_OD);

input	[3:0] inA;
input	[3:0] inB;
output 	[3:0] outA_OD;
output 	[3:0] outB_OD;
output 	[3:0] outC_OD;

/*** Open Drain constraints on output pins ***/
//exemplar attribute outA_OD IO_TYPES LVCMOS33_OD,-,LVCMOS33_OD,-,LVCMOS33_OD,-,LVCMOS33_OD,-;
//exemplar attribute outB_OD IO_TYPES LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-;
//exemplar attribute outC_OD IO_TYPES LVCMOS18_OD,-,LVCMOS18_OD,-,LVCMOS18_OD,-,LVCMOS18_OD,-;

assign outA_OD = inA & inB;
assign outB_OD = !inA & inB;
assign outC_OD = inA & !inB;

endmodule

