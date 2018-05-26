// 16-bit bus 4 to 1 MUX

module mux4to1_16(sel, a, b, c, d, out);
// bus_width can be 16, 32, 48, ...
parameter bus_width = 16;

output [bus_width - 1:0] out;
input [1:0] sel;
input [bus_width - 1:0] a;
input [bus_width - 1:0] b;
input [bus_width - 1:0] c;
input [bus_width - 1:0] d;
reg [bus_width - 1:0] out;

always @(sel or a or b or c or d)
    begin
        case (sel)
            2'b00: out = a;
            2'b01: out = b;
            2'b10: out = c;
            2'b11: out = d;
            default: out = 'bx;
        endcase
    end

endmodule
