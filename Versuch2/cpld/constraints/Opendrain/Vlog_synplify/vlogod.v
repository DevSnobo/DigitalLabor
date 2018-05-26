/**************************************
 * Verilog source constraint example
 *   Open Drain Output for Synplicity
 *           2/08/2001 
 * Lattice Semiconductor Corporation 
"**************************************/

/** Verilog Synplicity syntax for Open Drain output
    Note: There is no dedicated attribute of Opendrain in Verilog.
          The IO_TYPES attibute can be used to assign Opendrain to a pin. */
//   output [PinName] /* synthesis IO_TYPES="LVCMOS33_OD,[DriveCurrent]" */; 
//   output [PinName] /* synthesis IO_TYPES="LVCMOS25_OD,[DriveCurrent]" */; 
//   output [PinName] /* synthesis IO_TYPES="LVCMOS18_OD,[DriveCurrent]" */; 

/*   
     DriveCurrent(mA) = 20, 16, 12, 8, 5, 4 or NONE;

****************************************************************************/


module vlogod(inA,inB,outA_OD,outB_OD,outC_OD);

input	[3:0] inA;
input	[3:0] inB;
output 	[3:0] outA_OD /* synthesis IO_TYPES="LVCMOS33_OD,-,LVCMOS33_OD,-,LVCMOS33_OD,-,LVCMOS33_OD,-"*/;
output 	[3:0] outB_OD /* synthesis IO_TYPES="LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-,LVCMOS25_OD,-"*/;
output 	[3:0] outC_OD /* synthesis IO_TYPES="LVCMOS18_OD,-,LVCMOS18_OD,-,LVCMOS18_OD,-,LVCMOS18_OD,-"*/;

/*** Open Drain constraints on output pins ***/

assign outA_OD = inA & inB;
assign outB_OD = !inA & inB;
assign outC_OD = inA & !inB;

endmodule


