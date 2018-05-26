`timescale 1 ns / 100 ps
module  test_LPM_FIFO_4_8_256_1_OFF_EMB (EDI, EDO, Data, Q, UsedW,
        Clock, WrReq, RdReq, Aclr, Full, Empty); // synthesis syn_black_box

input   Clock, WrReq, RdReq, Aclr;
input   [0:0]  EDI;
input   [3:0]  Data;
output  Full, Empty;
output  [0:0]  EDO;
output  [3:0]  Q;
output  [7:0]  UsedW;


endmodule

