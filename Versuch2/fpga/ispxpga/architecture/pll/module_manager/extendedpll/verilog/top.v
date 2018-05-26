module top(top_clk_in, top_pll_fbk, top_pll_rst, top_clk_out, top_pll_lock);

input top_clk_in;
input top_pll_fbk;
input top_pll_rst;
output top_clk_out;
output top_pll_lock;

extendpll E1 (.clk_in(top_clk_in),  .pll_fbk(top_pll_fbk), .pll_rst(top_pll_rst), .clk_out(top_clk_out), .pll_lock(top_pll_lock));

endmodule
