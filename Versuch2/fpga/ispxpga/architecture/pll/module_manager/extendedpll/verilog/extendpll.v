module extendpll(clk_in, pll_fbk, pll_rst, clk_out, pll_lock);


input clk_in;
input pll_fbk;
input pll_rst;
output clk_out;
output pll_lock;
wire sec_out;


defparam	I1.in_freq = "100.000",
		I1.mult = "8",
		I1.div = "5",
		I1.post = "2",
		I1.pll_dly = "0",
		I1.secdiv = "2",
		I1.clk_out_to_pin = "OFF",
		I1.wake_on_lock = "OFF";


STDPLLX I1 (.CLK_IN(clk_in),  .PLL_FBK(pll_fbk), .PLL_RST(pll_rst), .CLK_OUT(clk_out), .PLL_LOCK(pll_lock), .SEC_OUT(sec_out));


// exemplar attribute I1 in_freq 100.000
// exemplar attribute I1 mult 8
// exemplar attribute I1 div 5
// exemplar attribute I1 post 2
// exemplar attribute I1 pll_dly 0
// exemplar attribute I1 secdiv 2
// exemplar attribute I1 clk_out_to_pin OFF
// exemplar attribute I1 wake_on_lock OFF


endmodule
