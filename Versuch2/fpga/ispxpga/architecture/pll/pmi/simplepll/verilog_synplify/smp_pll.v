/*****************************************
 * Verilog source constraint example
 * Simple PLL configuration for Synplicity
 *
 * Lattice Semiconductor Corporation 
 *****************************************/

/** The following steps are required to use PLL functions in Verilog.
   Step 1. PLL hardcore block declaration
   Step 2. PLL parameter definition  
   Step 3. PLL block instantiation
   Step 4. Use of PLL output **/


/** Step 1: PLL hardcore block declaration **/

`timescale 100 ps / 10 ps
/*
// Module SPLL is not needed in ispLEVER
module SPLL(CLK_IN,CLK_OUT); //synthesis syn_black_box

parameter in_freq = "16.0";

input  CLK_IN;
output CLK_OUT;

endmodule
*/

module simplepll(clk,rst,qout);

input 		clk, rst;
output 	[3:0] 	qout;

reg	[3:0]	count;
wire 		pllclk;

/** Step 2: PLL parameter definition **/
defparam I1.in_freq = "160.0";


/** Step 3: PLL block instantiation **/
SPLL I1 (.CLK_IN(clk),
         .CLK_OUT(pllclk));


/** Step 4: Use of PLL output **/
always@(posedge pllclk or posedge rst)

    if(rst)
	count <= "0000";
    else 
	count <= count + 1 ;

    assign qout = count;

endmodule
