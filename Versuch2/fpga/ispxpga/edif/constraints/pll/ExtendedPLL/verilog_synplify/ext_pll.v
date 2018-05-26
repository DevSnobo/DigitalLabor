`timescale 100ps / 10ps
/*******************************************
 * Verilog source constraint example
 * Extended PLL configuration for Synplicity
 * Lattice Semiconductor Corporation 
 *******************************************/

/** The following steps are required to use PLL functions in Verilog.
   Step 1. PLL hardcore block declaration (stdpllx)
   Step 2. PLL parameter definition
   Step 3. PLL block instantiation
   Step 4. Use of PLL outputs **/


/** Step 1: PLL hardcore block declaration **/
/* 
// Module STDPLLX is not needed in ispLEVER
module STDPLLX(CLK_IN,PLL_FBK,PLL_RST,PLL_LOCK,SEC_OUT,CLK_OUT); //synthesis syn_black_box 

parameter in_freq 	= "1";
parameter mult 		= "1";
parameter div 		= "1";
parameter post 		= "1";
parameter pll_dly 	= "1";
parameter secdiv 	= "2";
parameter pll_fbk_attribute = "CLKTREE";

input  CLK_IN;	
input  PLL_FBK;		// extended PLL feedback 
input  PLL_RST;		// primary PLL reset
output CLK_OUT;
output PLL_LOCK;
output SEC_OUT;

endmodule
*/


module extendedpll(clk,rst,pllfbk,pllrst,clken,qa,qb);

input 		clk,rst,clken;
input           pllfbk;
input 		pllrst;  // primary PLL reset
output 	[3:0] 	qa;
output 	[3:0] 	qb;

reg	[3:0]	counta;
reg	[3:0]	countb;
wire 		ppclk;	// primary PLL clock
wire 		spclk;  // secondary PLL clock
wire 		lock;   // PLL lock out
reg 		scken;

wire  tst_rst;


/** Step 2: PLL parameter definition **/
defparam I1.in_freq = "100.0000",
         I1.mult    = "8",
         I1.div     = "5",
         I1.post    = "2",
         I1.pll_dly = "1",
         I1.secdiv  = "2",
         I1.pll_fbk_attribute = "CLKTREE";


/** Step 3: PLL block instantiation **/
STDPLLX I1 (.CLK_IN(clk),
            .PLL_FBK(pllfbk),
            .PLL_RST(),
            .CLK_OUT(ppclk),
	    .PLL_LOCK(lock),
	    .SEC_OUT(spclk));


assign tst_rst = 0;

/** Step 4: Use of PLL outputs **/
always@(posedge ppclk or posedge rst)
    if (rst)
        scken <= 1'b0;
    else
        scken <= clken; // synchronized clock enable using PLL lock

always@(posedge ppclk or posedge rst) 

    if(rst)
	counta <= "0000";
    else
	if (scken)
	    counta <= counta + 1 ;
	else
	    counta <= counta;


always@(posedge spclk or posedge rst)

    if(rst)
	countb <= "0000";
    else 
	countb <= countb + 1 ;

assign qa = counta;
assign qb = countb;

endmodule
