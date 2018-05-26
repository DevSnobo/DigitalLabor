// 
// Testbench template
// You may need to edit it to meet your needs
// 
`timescale 1 ns / 100 ps
module l_fifodcx_lpm_fifo_dcx_2_4_13__top;
   wire Data0_w, Data1_w, WrClock_w, WrEn_w, RdClock_w, RdEn_w;
   wire Reset_w, RPReset_w, Q0_w, Q1_w, Q2_w, Q3_w;
   wire Full_w, Empty_w, AlmostFull_w, AlmostEmpty_w;

   integer result_file;

   l_fifodcx_lpm_fifo_dcx_2_4_13_  l_fifodcx_lpm_fifo_dcx_2_4_13__Tb(.Data0(Data0_w), .Data1(Data1_w), .WrClock(WrClock_w),
        .WrEn(WrEn_w), .RdClock(RdClock_w), .RdEn(RdEn_w),
        .Reset(Reset_w), .RPReset(RPReset_w), .Q0(Q0_w),
        .Q1(Q1_w), .Q2(Q2_w), .Q3(Q3_w),
        .Full(Full_w), .Empty(Empty_w), .AlmostFull(AlmostFull_w),
        .AlmostEmpty(AlmostEmpty_w));


  `include "testVector.v"

  `include "runVector.v"

  `ifdef VCD
    initial
      begin
        $dumpfile("l_fifodcx_lpm_fifo_dcx_2_4_13__Ver.dump");
        $dumpvars;
      end
  `endif
endmodule