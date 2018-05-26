module STDPLLX(CLK_IN, PLL_FBK, PLL_RST, PLL_LOCK, SEC_OUT, CLK_OUT);


parameter IN_FREQ = "1";
parameter MULT = "1";
parameter DIV = "1";
parameter POST = "1";
parameter PLL_DLY = "1";
parameter SECDIV = "1";
parameter CLK_OUT_TO_PIN = "ON";
parameter WAKE_ON_LOCK = "OFF";


input CLK_IN;
input PLL_FBK;
input PLL_RST;
output CLK_OUT;
output PLL_LOCK;
output SEC_OUT;


endmodule
