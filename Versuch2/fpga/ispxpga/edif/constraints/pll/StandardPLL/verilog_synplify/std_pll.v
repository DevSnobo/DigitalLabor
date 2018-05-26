/********************************************
 * Verilog source constraint example
 * Standard PLL configuration for Synplicity
 * Lattice Semiconductor Corporation 
 ********************************************/

/** The following steps are required to use PLL functions in Verilog.
   Step 1. PLL hardcore block declaration (stdpll)
   Step 2. PLL parameter definition
   Step 3. PLL block instantiation
   Step 4. Use of PLL outputs **/


/** Step 1: PLL hardcore block declaration **/
/*
// Module STDPLL is not needed in ispLEVER
module STDPLL(CLK_IN,CLK_OUT,PLL_LOCK); //synthesis syn_black_box

parameter in_freq = "1";
parameter mult = "1";
parameter div = "1";
parameter post = "1";
parameter pll_dly = "1";

input  CLK_IN;
output CLK_OUT;
output PLL_LOCK;

endmodule
*/


module standardpll(clk,rst,clken,qa);

input 		clk,rst,clken;
output 	[3:0] 	qa;

reg	[3:0]	counta;
wire 		pllclk;	// PLL clock out
wire 		lock;   // PLL lock out
reg 		scken;


/** Step 2: PLL parameter definition **/
defparam I1.in_freq = "100.0000",
         I1.mult    = "8",
         I1.div     = "5",
         I1.post    = "2",
         I1.pll_dly = "6";


/** Step 3: PLL block instantiation **/
STDPLL I1 (.CLK_IN(clk),
           .CLK_OUT(pllclk),
	   .PLL_LOCK(lock));



/** Step 4: Use of PLL outputs **/
always@(posedge pllclk or posedge rst)
    if (rst)
        scken <= 1'b0;
    else
        scken <= clken; // synchronized clock enable using PLL lock

always@(posedge pllclk or posedge rst) 

    if(rst)
	counta <= "0000";
    else
	if (scken)
	    counta <= counta + 1 ;
	else
	    counta <= counta;


assign qa = counta;

endmodule


