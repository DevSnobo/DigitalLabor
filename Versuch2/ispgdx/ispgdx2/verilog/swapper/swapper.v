module swapper(oe0, clk0, lowa, higha, lowb, highb);
input oe0, clk0;
input [31:0] lowa, higha;
output [31:0] lowb, highb;
reg [31:0] reg_low, reg_high;

assign highb = oe0 ? reg_high : 32'bz;
assign lowb = oe0 ? reg_low : 32'bz;

always @(posedge clk0)
    begin
        reg_low = higha;
        reg_high = lowa;
    end

endmodule
