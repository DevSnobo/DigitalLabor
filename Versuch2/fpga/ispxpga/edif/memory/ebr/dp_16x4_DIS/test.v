`timescale 1 ns / 100 ps
module  test (EDI, EDO, Q, Data, WrAddress, RdAddress,
        RdClock, WrClock, RdEn, WrEn); // synthesis syn_black_box

input   RdClock, WrClock, RdEn, WrEn;
input   [0:0]  EDI;
input   [3:0]  Data;
input   [3:0]  WrAddress;
input   [3:0]  RdAddress;
output  [0:0]  EDO;
output  [3:0]  Q;


endmodule

