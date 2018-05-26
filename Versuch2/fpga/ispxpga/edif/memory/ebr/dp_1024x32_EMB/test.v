`timescale 1 ns / 100 ps
module  test (EDI, EDO, Q, Data, WrAddress, RdAddress,
        RdClock, WrClock, RdEn, WrEn); // synthesis syn_black_box

input   RdClock, WrClock, RdEn, WrEn;
input   [3:0]  EDI;
input   [31:0]  Data;
input   [9:0]  WrAddress;
input   [9:0]  RdAddress;
output  [3:0]  EDO;
output  [31:0]  Q;


endmodule

