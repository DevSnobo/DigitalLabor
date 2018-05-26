`timescale 1 ns / 100 ps
module  test (Q, Data,
        Clock, Enable, Aclr, ShiftIn, Load, ShiftOut); // synthesis syn_black_box

input   Clock, Enable, Aclr, ShiftIn, Load;
input   [15:0]  Data;
output  ShiftOut;
output  [15:0]  Q;


endmodule

