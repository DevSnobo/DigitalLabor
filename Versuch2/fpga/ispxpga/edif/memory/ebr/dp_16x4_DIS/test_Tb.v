// 
// Testbench template
// You may need to edit it to meet your needs
// 
`timescale 1 ns / 100 ps
module test_top;
   wire EDI(0)_w, Data(3)_w, Data(2)_w, Data(1)_w, Data(0)_w, WrAddress(3)_w;
   wire WrAddress(2)_w, WrAddress(1)_w, WrAddress(0)_w, RdAddress(3)_w, RdAddress(2)_w, RdAddress(1)_w;
   wire RdAddress(0)_w, RdClock_w, WrClock_w, RdEn_w, WrEn_w, EDO(0)_w;
   wire Q(3)_w, Q(2)_w, Q(1)_w, Q(0)_w;

   integer result_file;

   test  test_Tb(.EDI(0)(EDI(0)_w), .Data(3)(Data(3)_w), .Data(2)(Data(2)_w),
        .Data(1)(Data(1)_w), .Data(0)(Data(0)_w), .WrAddress(3)(WrAddress(3)_w),
        .WrAddress(2)(WrAddress(2)_w), .WrAddress(1)(WrAddress(1)_w), .WrAddress(0)(WrAddress(0)_w),
        .RdAddress(3)(RdAddress(3)_w), .RdAddress(2)(RdAddress(2)_w), .RdAddress(1)(RdAddress(1)_w),
        .RdAddress(0)(RdAddress(0)_w), .RdClock(RdClock_w), .WrClock(WrClock_w),
        .RdEn(RdEn_w), .WrEn(WrEn_w), .EDO(0)(EDO(0)_w),
        .Q(3)(Q(3)_w), .Q(2)(Q(2)_w), .Q(1)(Q(1)_w),
        .Q(0)(Q(0)_w));


  `include "testVector.v"

  `include "runVector.v"

  `ifdef VCD
    initial
      begin
        $dumpfile("test_Ver.dump");
        $dumpvars;
      end
  `endif
endmodule