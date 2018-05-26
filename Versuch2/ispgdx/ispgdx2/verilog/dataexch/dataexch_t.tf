`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module dataexch_t();

    reg oe0;
    reg oe1;

    wire [63:0] busAdata;
    wire [63:0] busBdata;
    wire [63:0] busCdata;
    wire [63:0] busDdata;

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

reg [63:0] busa_reg;
assign busAdata = busa_reg;
reg [63:0] busb_reg;
assign busBdata = busb_reg;
reg [63:0] busc_reg;
assign busCdata = busc_reg;
reg [63:0] busd_reg;
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
    busa_reg = 64'bZ;
    #0     busa_reg = 64 'h 1243567812435678;
    #100   busa_reg = 64 'h ABCD1234ABCD1234;
    #100   busa_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busa_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busa_reg = 64 'h 7654321076543210;
    #100   busa_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busa_reg = 64 'h CDEF5678CDEF5678;
  end  // busA

  initial begin   // 'busB'
    busb_reg = 64'bZ;
    #0     busb_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busb_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busb_reg = 64 'h 9876543298765432;
    #100   busb_reg = 64 'h 02468ACE98765432;
    #100   busb_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busb_reg = 64 'h 5432FEDC5432FEDC;
    #100   busb_reg = 64 'h ZZZZZZZZZZZZZZZZ;
  end  // busB

  initial begin   // 'busC'
    busb_reg = 64'bZ;
    #0     busc_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busc_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busc_reg = 64 'h 2345678923456789;
    #100   busc_reg = 64 'h ECA8642023456789;
    #100   busc_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busc_reg = 64 'h CDEF2345CDEF2345;
    #100   busc_reg = 64 'h ZZZZZZZZZZZZZZZZ;
  end  // busC

  initial begin   // 'busD'
    busa_reg = 64'bZ;
    #0     busd_reg = 64 'h 8765432187654321;
    #100   busd_reg = 64 'h 4321DCBA4321DCBA;
    #100   busd_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busd_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busd_reg = 64 'h 0123456701234567;
    #100   busd_reg = 64 'h ZZZZZZZZZZZZZZZZ;
    #100   busd_reg = 64 'h 8765FEDC8765FEDC;
  end  // busD

endmodule // t
