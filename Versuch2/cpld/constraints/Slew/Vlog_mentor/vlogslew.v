/****************************************
 * Verilog source constraint example
 *    Slew Rate Control for Mentor
 *    2/05/2001
 * Lattice Semiconductor Corporation 
 ****************************************/


/*** The syntax of Verilog Mentor Slew control ***/
 //exemplar attribute [NodeName] SLEW [TYPE]
  /* TYPE can be either SLOW or FAST */


module slewvlog(inA,inB,inC,slewS,slewF);

//declarations
input inA,inB,inC;

//---------- Constraining Slew ------------------- 
output slewS; //exemplar attribute slewS SLEW SLOW

output slewF; //exemplar attribute slewF SLEW FAST

//equations
assign slewS = !inA & inB & inC;

assign slewF = inA & !inB & inC;

endmodule


