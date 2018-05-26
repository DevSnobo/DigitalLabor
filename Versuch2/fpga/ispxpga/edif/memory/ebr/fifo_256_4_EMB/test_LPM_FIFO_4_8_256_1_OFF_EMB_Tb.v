// 
// Testbench template
// You may need to edit it to meet your needs
// 
`timescale 1 ns / 100 ps
module test_LPM_FIFO_4_8_256_1_OFF_EMB_top;
   wire EDI(0)_w, Data(3)_w, Data(2)_w, Data(1)_w, Data(0)_w, Clock_w;
   wire WrReq_w, RdReq_w, Aclr_w, EDO(0)_w, Q(3)_w, Q(2)_w;
   wire Q(1)_w, Q(0)_w, UsedW(7)_w, UsedW(6)_w, UsedW(5)_w, UsedW(4)_w;
   wire UsedW(3)_w, UsedW(2)_w, UsedW(1)_w, UsedW(0)_w, Full_w, Empty_w;

   integer result_file;

   test_LPM_FIFO_4_8_256_1_OFF_EMB  test_LPM_FIFO_4_8_256_1_OFF_EMB_Tb(.EDI(0)(EDI(0)_w), .Data(3)(Data(3)_w), .Data(2)(Data(2)_w),
        .Data(1)(Data(1)_w), .Data(0)(Data(0)_w), .Clock(Clock_w),
        .WrReq(WrReq_w), .RdReq(RdReq_w), .Aclr(Aclr_w),
        .EDO(0)(EDO(0)_w), .Q(3)(Q(3)_w), .Q(2)(Q(2)_w),
        .Q(1)(Q(1)_w), .Q(0)(Q(0)_w), .UsedW(7)(UsedW(7)_w),
        .UsedW(6)(UsedW(6)_w), .UsedW(5)(UsedW(5)_w), .UsedW(4)(UsedW(4)_w),
        .UsedW(3)(UsedW(3)_w), .UsedW(2)(UsedW(2)_w), .UsedW(1)(UsedW(1)_w),
        .UsedW(0)(UsedW(0)_w), .Full(Full_w), .Empty(Empty_w));


  `include "testVector.v"

  `include "runVector.v"

  `ifdef VCD
    initial
      begin
        $dumpfile("test_LPM_FIFO_4_8_256_1_OFF_EMB_Ver.dump");
        $dumpvars;
      end
  `endif
endmodule