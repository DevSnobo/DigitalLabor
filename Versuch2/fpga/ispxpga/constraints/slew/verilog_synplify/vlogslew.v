/****************************************
 * Verilog source constraint example
 *    Slew Rate Control for Synplicity
 *    2/05/2001 K.Lee
 * Lattice Applications Engineering
 ****************************************/


// -- The syntax of Verilog Synplicity Slew control --
// output [PinName] /* synthesis SLEW="TYPE" */;
// TYPE can be either SLOW or FAST

module slewvlog(inA,inB,inC,slewS,slewF);

//declarations
input inA,inB,inC;

//---------- Constraining Slew ------------------- 
output slewS /* synthesis SLEW="SLOW" */;

output slewF /* synthesis SLEW="FAST" */;

//equations
assign slewS = !inA & inB & inC;

assign slewF = inA & !inB & inC;

endmodule


