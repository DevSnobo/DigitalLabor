`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module dexch();

    reg oe0;
    reg oe1;

    wire [31:0] busAdata;
    wire [31:0] busBdata;
    wire [31:0] busCdata;
    wire [31:0] busDdata;

    dataexch UUT (
        .busAdata(busAdata), 
        .busBdata(busBdata), 
        .busCdata(busCdata), 
        .busDdata(busDdata), 
        .oe0(oe0), 
        .oe1(oe1)
        );

    `ifdef auto_init

        initial begin
            oe0 = 0;
            oe1 = 0;
        end

    `endif

reg [31:0] busa_reg;
assign busAdata = busa_reg;
reg [31:0] busb_reg;
assign busBdata = busb_reg;
reg [31:0] busc_reg;
assign busCdata = busc_reg;
reg [31:0] busd_reg;
assign busDdata = busd_reg;

// Code for all top level Inputs and BiDirs

  initial begin   // 'oe0'
    #0   oe0 = 0;
    #200 oe0 = 1;
    #200 oe0 = 0;
    #100 oe0 = 1;
    #100 oe0 = 0;
  end  // oe0

  initial begin   // 'oe1'
    #0   oe1 = 1;
    #200 oe1 = 0;
    #200 oe1 = 1;
    #100 oe1 = 0;
    #100 oe1 = 1;
  end  // oe1

  initial begin   // 'busA'
    busa_reg = 32'bZ;
    #0     busa_reg = 32 'h 12435678;
    #100   busa_reg = 32 'h ABCD1234;
    #100   busa_reg = 32 'h ZZZZZZZZ;
    #100   busa_reg = 32 'h ZZZZZZZZ;
    #100   busa_reg = 32 'h 76543210;
    #100   busa_reg = 32 'h ZZZZZZZZ;
    #100   busa_reg = 32 'h CDEF5678;
  end  // busA

  initial begin   // 'busB'
    busb_reg = 32'bZ;
    #0     busb_reg = 32 'h ZZZZZZZZ;
    #100   busb_reg = 32 'h ZZZZZZZZ;
    #100   busb_reg = 32 'h 98765432;
    #100   busb_reg = 32 'h 02468ACE;
    #100   busb_reg = 32 'h ZZZZZZZZ;
    #100   busb_reg = 32 'h 5432FEDC;
    #100   busb_reg = 32 'h ZZZZZZZZ;
  end  // busB

  initial begin   // 'busC'
    busb_reg = 32'bZ;
    #0     busc_reg = 32 'h ZZZZZZZZ;
    #100   busc_reg = 32 'h ZZZZZZZZ;
    #100   busc_reg = 32 'h 23456789;
    #100   busc_reg = 32 'h ECA86420;
    #100   busc_reg = 32 'h ZZZZZZZZ;
    #100   busc_reg = 32 'h CDEF2345;
    #100   busc_reg = 32 'h ZZZZZZZZ;
  end  // busC

  initial begin   // 'busD'
    busa_reg = 32'bZ;
    #0     busd_reg = 32 'h 87654321;
    #100   busd_reg = 32 'h 4321DCBA;
    #100   busd_reg = 32 'h ZZZZZZZZ;
    #100   busd_reg = 32 'h ZZZZZZZZ;
    #100   busd_reg = 32 'h 01234567;
    #100   busd_reg = 32 'h ZZZZZZZZ;
    #100   busd_reg = 32 'h 8765FEDC;
  end  // busD

endmodule // t
