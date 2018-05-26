/*******************************************
 * Verilog source constraint example
 *   Extended PLL configuration for Mentor
 * Lattice Semiconductor Corporation 
 *******************************************/

/** The following steps are required to use PLL functions in Verilog.
   Step 1. PLL parameter definition
   Step 2. PLL block instantiation
   Step 3. PLL parameters configuration using Mentor attribute syntax
   Step 4. Use of PLL outputs **/


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


/** Step 1: PLL parameter definition **/
defparam I1.in_freq = "100.0",
         I1.mult    = "8",
         I1.div     = "5",
         I1.post    = "1",
         I1.pll_dly = "2",
         I1.secdiv  = "2";


/** Step 2: PLL block instantiation **/
STDPLLX I1 (.CLK_IN(clk),
            .PLL_FBK(pllfbk),
            .PLL_RST(pllrst),
            .CLK_OUT(ppclk),
	    .PLL_LOCK(lock),
	    .SEC_OUT(spclk));

/** Step 3: PLL parameter configuration **/
// exemplar attribute I1 in_freq 100.0000
// exemplar attribute I1 mult    8
// exemplar attribute I1 div     5
// exemplar attribute I1 post    1
// exemplar attribute I1 pll_dly 2
// exemplar attribute I1 secdiv  2
// exemplar attribute I1 clk_out_to_pin OFF


/** Step 4: Use of PLL outputs **/
always@(posedge ppclk)

    scken <= lock & clken; // synchronized clock enable using PLL lock


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
