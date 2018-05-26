//This design can be synthesized by Synplify and LeonardoSpectrum.
//It contains attributes for both synthesis tools.

module cdrx8b10b (refclk,cdrrst,rxd_p,rxd_n, rxd0,rxd1,rxd2,rxd3,rxd4,rxd5,rxd6,rxd7,rxd8,rxd9,recclk,cslock,sydt);


input refclk,cdrrst,rxd_p,rxd_n;
output rxd0,rxd1,rxd2,rxd3,rxd4,rxd5,rxd6,rxd7,rxd8,rxd9,recclk,cslock,sydt;
wire sin;
LVDSIN I1 (.P_IN(rxd_p), .N_IN(rxd_n), .O(sin));
defparam I3.in_freq = "40.00";
defparam I3.sympat = "11000001010011111010";
CDRX_8B10B I3 (
.SIN(sin),
.REFCLK(refclk),
.CDRRST(cdrrst),
.RXD0(rxd0),
.RXD1(rxd1),
.RXD2(rxd2),
.RXD3(rxd3),
.RXD4(rxd4),
.RXD5(rxd5),
.RXD6(rxd6),
.RXD7(rxd7),
.RXD8(rxd8),
.RXD9(rxd9),
.RECCLK(recclk),
.CSLOCK(cslock),
.SYDT(sydt)
);
// exemplar attribute I3 in_freq 40.00
// exemplar attribute I3 sympat 11000001010011111010


endmodule
