`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module mux4to1_t(); 
parameter bus_width = 16;

reg [1:0] s;   //input
reg [bus_width - 1:0] in0, in1, in2, in3;      //input
wire [bus_width - 1:0] o;      //output

// call mux4to1-16 module

mux4to1_16 UUT ( .sel(s), .a(in0), .b(in1), .c(in2), .d(in3), .out(o) );

    initial begin   // 's'
        s = 2'b00;
        #80 s = 2'b01; 
        #80 s = 2'b10; 
        #80 s = 2'b11; 
        #80 s = 2'b00; 
        #80 s = 2'b01; 
        #80 s = 2'b10; 
        #80 s = 2'b11; 
    end  // 's'

    initial begin  // 'in0'
        in0 = 16'b0000000000000100;
    end // 'in0'

    initial begin  // 'in1'
        in1 = 16'b0000000000001000;
    end // 'in1'

    initial begin  // 'in2'
        in2 = 16'b0000000000010000;
    end // 'in2'

    initial begin  // 'in3'
        in3 = 16'b0000000000100000;
    end // 'in3'

endmodule // mux4to1_t
