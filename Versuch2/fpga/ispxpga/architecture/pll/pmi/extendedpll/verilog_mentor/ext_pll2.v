/*******************************************
 * Verilog source constraint example
 *   Extended PLL configuration for Exemplar
 * Lattice Semiconductor Corporation 
 *******************************************/

/** The following steps are required to use PLL functions in Verilog.
   Step 1. PLL hardcore block declaration (stdpllx)
   Step 2. PLL parameter definition
   Step 3. PLL block instantiation
   Step 4. PLL parameters configuration using Exemplar attribute syntax
   Step 5. Use of PLL outputs **/


/** Step 1: PLL hardcore block declaration **/
`timescale 100ps/10ps
/*
//Module STDPLLX declaration is not needed in ispLEVER
module STDPLLX(CLK_IN,PLL_FBK,PLL_RST,PLL_LOCK,SEC_OUT,CLK_OUT);

parameter in_freq 	= "1";
parameter mult 		= "1";
parameter div 		= "1";
parameter post 		= "1";
parameter pll_dly 	= "1";
parameter secdiv 	= "1";
parameter clk_out_to_pin =  "On";
parameter wake_on_lock = "Off";
parameter pll_fbk_attribute = "CLKTREE";


input  CLK_IN;	
input  PLL_FBK;		// extended PLL feedback 
input  PLL_RST;		// primary PLL reset
output CLK_OUT;
output PLL_LOCK;
output SEC_OUT;

endmodule
*/

module extendedpll(clk1,clk2,rst,pllfbk,pllrst1,pllrst2,clken1,clken2,qa,qb,qc,qd);

input 		clk1,clk2,rst,clken1,clken2;
input           pllfbk;
input 		pllrst1;  // primary PLL1 reset
input 		pllrst2;  // primary PLL2 reset
output 	[3:0] 	qa;
output 	[3:0] 	qb;
output 	[3:0] 	qc;
output 	[3:0] 	qd;

reg	[3:0]	counta;
reg	[3:0]	countb;
reg	[3:0]	countc;
reg	[3:0]	countd;
wire 		ppclk1;	// primary PLL clock
wire 		spclk1;  // secondary PLL clock
wire 		ppclk2;	// primary PLL clock
wire 		spclk2;  // secondary PLL clock
wire 		lock1;   // PLL lock out
wire 		lock2;   // PLL lock out
reg 		scken1;
reg 		scken2;


/** Step 2: PLL parameter definition **/
defparam I1.in_freq = "100.0",
         I1.mult    = "8",
         I1.div     = "5",
         I1.post    = "2",
         I1.pll_dly = "1",
         I1.secdiv  = "2",
         I1.pll_fbk_attribute = "clktree";

/** Step 3: PLL block instantiation **/
STDPLLX I1 (.CLK_IN(clk1),
            .PLL_FBK(pllfbk),
            .PLL_RST(pllrst1),
            .CLK_OUT(ppclk1),
	    .PLL_LOCK(lock1),
	    .SEC_OUT(spclk1));

defparam I2.in_freq = "80.0",
         I2.mult    = "2",
         I2.div     = "1",
         I2.post    = "2",
         I2.pll_dly = "1",
         I2.secdiv  = "2",
         I2.pll_fbk_attribute = "clktree";

STDPLLX I2 (.CLK_IN(clk2),
            .PLL_FBK(),
            .PLL_RST(pllrst2),
            .CLK_OUT(ppclk2),
	    .PLL_LOCK(lock2),
	    .SEC_OUT(spclk2));

/** Step 4: PLL parameter configuration **/
// exemplar attribute I1 in_freq 100.0000
// exemplar attribute I1 mult    8
// exemplar attribute I1 div     5
// exemplar attribute I1 post    2
// exemplar attribute I1 pll_dly 1
// exemplar attribute I1 secdiv  2
// exemplar attribute I1 clk_out_to_pin ON
// exemplar attribute I1 pll_fbk_attribute CLKTREE

// exemplar attribute I2 in_freq 80.0000
// exemplar attribute I2 mult    2
// exemplar attribute I2 div     1
// exemplar attribute I2 post    2
// exemplar attribute I2 pll_dly 1
// exemplar attribute I2 secdiv  2
// exemplar attribute I2 clk_out_to_pin ON
// exemplar attribute I2 pll_fbk_attribute ROUTE


/** Step 5: Use of PLL outputs **/
always@(posedge ppclk1 or posedge rst)
    if (rst)
        scken1 <= 1'b0;
    else
        scken1 <= clken1; // synchronized clock enable using PLL lock

always@(posedge ppclk1 or posedge rst) 

    if(rst)
	counta <= "0000";
    else
	if (scken1)
	    counta <= counta + 1 ;
	else
	    counta <= counta;


always@(posedge spclk1 or posedge rst)

    if(rst)
	countb <= "0000";
    else 
	countb <= countb + 1 ;

assign qa = counta;
assign qb = countb;

always@(posedge ppclk2 or posedge rst)
    if (rst)
        scken2 <= 1'b0;
    else
        scken2 <= clken2; // synchronized clock enable using PLL lock

always@(posedge ppclk2 or posedge rst) 

    if(rst)
	countc <= "0000";
    else
	if (scken2)
	    countc <= countc + 1 ;
	else
	    countc <= countc;


always@(posedge spclk2 or posedge rst)

    if(rst)
	countd <= "0000";
    else 
	countd <= countd + 1 ;

assign qc = countc;
assign qd = countd;


endmodule
