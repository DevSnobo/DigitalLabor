module top (top_refclk,top_cdrrst,top_rxd_p,top_rxd_n, top_rxd0,top_rxd1,top_rxd2,top_rxd3,top_rxd4,top_rxd5,top_rxd6,top_rxd7,top_rxd8,top_rxd9,top_recclk,top_cslock,top_sydt);


input top_refclk,top_cdrrst,top_rxd_p,top_rxd_n;
output top_rxd0,top_rxd1,top_rxd2,top_rxd3,top_rxd4,top_rxd5,top_rxd6,top_rxd7,top_rxd8,top_rxd9,top_recclk,top_cslock,top_sydt;

cdrx8b10b C1 (.refclk(top_refclk), .cdrrst(top_cdrrst), .rxd_p(top_rxd_p), .rxd_n(top_rxd_n), .rxd0(top_rxd0), .rxd1(top_rxd1), .rxd2(top_rxd2), .rxd3(top_rxd3), .rxd4(top_rxd4), .rxd5(top_rxd5), .rxd6(top_rxd6), .rxd7(top_rxd7), .rxd8(top_rxd8), .rxd9(top_rxd9), .recclk(top_recclk), .cslock(top_cslock), .sydt(top_sydt));

endmodule
