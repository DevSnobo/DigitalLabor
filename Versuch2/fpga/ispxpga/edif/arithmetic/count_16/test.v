`timescale 1 ns / 100 ps
module  test (Q, Data,
        Clock, Cnt_En, UpDown, Sclr); // synthesis syn_black_box

input   Clock, Cnt_En, UpDown, Sclr;
input   [15:0]  Data;
output  [15:0]  Q;


endmodule

