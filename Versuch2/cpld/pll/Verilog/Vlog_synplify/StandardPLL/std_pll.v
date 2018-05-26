/********************************************
 * Verilog source constraint example
 * Standard PLL configuration for Synplicity
 * Lattice Semiconductor Corporation 
 ********************************************/

/** The following steps are required to use PLL functions in Verilog.
   Step 1. PLL parameter definition
   Step 2. PLL block instantiation
   Step 3. Use of PLL outputs **/


module standardpll(clk,rst,clken,qa);

input 		clk,rst,clken;
output 	[3:0] 	qa;

reg	[3:0]	counta;
wire 		pllclk;	// PLL clock out
wire 		lock;   // PLL lock out
reg 		scken;


/** Step 1: PLL parameter definition **/
defparam I1.in_freq = "100.0000",
         I1.mult    = "8",
         I1.div     = "5",
         I1.post    = "1",
         I1.pll_dly = "2";


/** Step 2: PLL block instantiation **/
STDPLL I1 (.CLK_IN(clk),
           .CLK_OUT(pllclk),
	   .PLL_LOCK(lock));



/** Step 3: Use of PLL outputs **/
always@(posedge pllclk)

    scken <= lock & clken; // synchronized clock enable using PLL lock


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


