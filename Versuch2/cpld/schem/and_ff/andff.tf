`timescale 1 ns / 1 ns
module t;
    
    `include "andff.tfi"
 
    initial begin

        #0  Clk = 0;
            input_1 = 0;
            input_2 = 0;

        #20 Clk = 1;
        #20 Clk = 0;

        #10 input_1 = 0;
            input_2 = 1;

        #10 Clk = 1;
        #20 Clk = 0;

        #10 input_1 = 1;
            input_2 = 1;

        #10 Clk = 1;
        #20 Clk = 0;

     end

endmodule
