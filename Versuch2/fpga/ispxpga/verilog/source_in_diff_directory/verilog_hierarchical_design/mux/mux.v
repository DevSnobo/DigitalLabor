// Example of a hierarchical design
// ------------------------------------------------------
// First define the lower level modules: mux, reg8, & rotate
// ------------------------------------------------------
`timescale 1 ns / 1 ns
module mux(out, a, b, sel); // mux
output [`data_width-1:0] out;

input [`data_width-1:0] a, b;
input sel;

assign out = sel ? a : b;
endmodule


