`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module swapper_t();

    reg oe0;
    reg clk0;
    reg [31:0] lowa;
    reg [31:0] higha;

    wire [31:0] lowb;
    wire [31:0] highb;

    swapper UUT (
        .oe0(oe0), 
        .clk0(clk0), 
        .lowa(lowa), 
        .higha(higha), 
        .lowb(lowb), 
        .highb(highb)
        );

    `ifdef auto_init

        initial begin
            oe0 = 0;
            clk0 = 0;
            lowa = 0;
            higha = 0;
        end

    `endif


  initial begin   // 'oe0'
    #0   oe0 = 0;
    #150 oe0 = 1;
    #300 oe0 = 0;
    #200 oe0 = 1;
    #100 oe0 = 0;
    #200 oe0 = 1;
    #200 oe0 = 0;
    #200 oe0 = 1;
  end  // oe0

  initial begin   // 'clk0'
    #0   clk0 = 0;
    #50 clk0 = 1;
    #50 clk0 = 0;
    #150 clk0 = 1;
    #50 clk0 = 0;
    #250 clk0 = 1;
    #50 clk0 = 0;
    #250 clk0 = 1;
    #50 clk0 = 0;
    #200 clk0 = 1;
  end  // clk0

  initial begin   // 'lowa'
    #0     lowa = 32 'h 22222222;
    #100   lowa = 32 'h 33333333;
    #100   lowa = 32 'h 44444444;
    #100   lowa = 32 'h 55555555;
    #100   lowa = 32 'h 66666666;
    #100   lowa = 32 'h 77777777;
    #100   lowa = 32 'h 88888888;
    #100   lowa = 32 'h 99999999;
    #100   lowa = 32 'h AAAAAAAA;
    #100   lowa = 32 'h BBBBBBBB;
  end  // lowa

  initial begin   // 'higha'
    #0     higha = 32 'h FFFFFFFF;
    #100   higha = 32 'h EEEEEEEE;
    #100   higha = 32 'h DDDDDDDD;
    #100   higha = 32 'h CCCCCCCC;
    #100   higha = 32 'h BBBBBBBB;
    #100   higha = 32 'h AAAAAAAA;
    #100   higha = 32 'h 99999999;
    #100   higha = 32 'h 88888888;
    #100   higha = 32 'h 77777777;
    #100   higha = 32 'h 66666666;
  end  // higha

endmodule // t
