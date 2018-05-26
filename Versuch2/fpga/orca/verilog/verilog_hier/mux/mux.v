// Example of a hierarchical design
// ------------------------------------------------------
// First define the lower level modules: mux, reg8, & rotate
// ------------------------------------------------------

module mux(out, a, b, sel); // mux
output [7:0] out;

input [7:0] a, b;
input sel;

assign out = sel ? a : b;
endmodule


