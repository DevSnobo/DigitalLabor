// Verilog Stimulus Data from the Waveform Editing Tool
// File: a2b_exch - 1/4/01 10:14:34 AM

`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module a2b_exch();

    reg oe0;
    wire [15:0] busa;
    wire [15:0] busb;

    a2bexch UUT (
        .busa(busa), 
        .busb(busb), 
        .oe0(oe0)
        );

    `ifdef auto_init

        initial begin
            oe0 = 0;
        end

    `endif

reg [15:0] busa_reg;
assign busa = busa_reg;
reg [15:0] busb_reg;
assign busb = busb_reg;

// Code for all top level Inputs and BiDirs

  initial begin   // 'oe0'
    #0   oe0 = 0;
    #200 oe0 = 1;
    #200 oe0 = 0;
    #100 oe0 = 1;
    #100 oe0 = 0;
  end  // oe0

  initial begin   // 'busa'
    busa_reg = 16'bZ;
    #0     busa_reg = 16 'h 1243;
    #100   busa_reg = 16 'h ABCD;
    #100   busa_reg = 16 'h ZZZZ;
    #100   busa_reg = 16 'h ZZZZ;
    #100   busa_reg = 16 'h 1F2D;
    #100   busa_reg = 16 'h ZZZZ;
    #100   busa_reg = 16 'h 8CD7;
  end  // busa

  initial begin   // 'busb'
    busb_reg = 16'bZ;
    #0     busb_reg = 16 'h ZZZZ;
    #100   busb_reg = 16 'h ZZZZ;
    #100   busb_reg = 16 'h 9876;
    #100   busb_reg = 16 'h 2468;
    #100   busb_reg = 16 'h ZZZZ;
    #100   busb_reg = 16 'h EF54;
    #100   busb_reg = 16 'h ZZZZ;
  end  // busb

endmodule // t
