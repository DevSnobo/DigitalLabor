`timescale 1 ns / 100 ps
module  l_fifodcx_lpm_fifo_dcx_2_4_13_ (Data0, Data1, WrClock, WrEn, RdClock, RdEn, Reset, RPReset, Q0, Q1, Q2, Q3,
        Full, Empty, AlmostFull, AlmostEmpty);

input   Data0, Data1, WrClock, WrEn, RdClock, RdEn, Reset, RPReset;
output  Q0, Q1, Q2, Q3, Full, Empty, AlmostFull, AlmostEmpty;
wire    Full, WrEn, RdEn, RdClock, Empty0, WrClock, VCC_SIG, Reset, Empty, GND_SIG, RPReset, Full0;

BUFF BufEInst0(.O(Empty0_SIG), .I0(Empty0));
VCC I000000(.X(VCC_SIG));
GND I000001(.X(GND_SIG));
BUFF BufFInst0(.O(Full0_SIG), .I0(Full0));
BUFF BufWCInst(.O(WrClock), .I0(WrClock_SIG));
BUFF BufRPRInst(.O(RPReset), .I0(RPReset_SIG));
BUFF BufWEInst(.O(WrEn), .I0(WrEn_SIG));
BUFF BufRSTInst(.O(Reset), .I0(Reset_SIG));
BUFF BufRCInst(.O(RdClock), .I0(RdClock_SIG));
RAMBFIFO16KA_WX2_RX4 RamBaseBlockInst0(.EMPTYOUT(), .FULLOUT(), .AMEMPTY(AlmostEmpty), .EMPTY(Empty0), .AMFULL(AlmostFull), .FULL(Full0), 
        .DO3(Q3), .DO2(Q2), .DO1(Q1), .DO0(Q0), .DI1(Data1), .DI0(Data0), 
        .RPRST(RPReset), .RST(Reset), .EMPTYIN(VCC_SIG), .FULLIN(GND_SIG), .RCLK(RdClock), .RE(RdEn), 
        .WCLK(WrClock), .WE(WrEn));
BUFF BufREInst(.O(RdEn), .I0(RdEn_SIG));

endmodule

