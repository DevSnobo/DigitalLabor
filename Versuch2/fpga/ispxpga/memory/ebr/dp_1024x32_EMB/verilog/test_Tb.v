// 
// Testbench template
// You may need to edit it to meet your needs
// 
`timescale 1 ns / 100 ps
module test_top;
   wire EDI(3)_w, EDI(2)_w, EDI(1)_w, EDI(0)_w, Data(31)_w, Data(30)_w;
   wire Data(29)_w, Data(28)_w, Data(27)_w, Data(26)_w, Data(25)_w, Data(24)_w;
   wire Data(23)_w, Data(22)_w, Data(21)_w, Data(20)_w, Data(19)_w, Data(18)_w;
   wire Data(17)_w, Data(16)_w, Data(15)_w, Data(14)_w, Data(13)_w, Data(12)_w;
   wire Data(11)_w, Data(10)_w, Data(9)_w, Data(8)_w, Data(7)_w, Data(6)_w;
   wire Data(5)_w, Data(4)_w, Data(3)_w, Data(2)_w, Data(1)_w, Data(0)_w;
   wire WrAddress(9)_w, WrAddress(8)_w, WrAddress(7)_w, WrAddress(6)_w, WrAddress(5)_w, WrAddress(4)_w;
   wire WrAddress(3)_w, WrAddress(2)_w, WrAddress(1)_w, WrAddress(0)_w, RdAddress(9)_w, RdAddress(8)_w;
   wire RdAddress(7)_w, RdAddress(6)_w, RdAddress(5)_w, RdAddress(4)_w, RdAddress(3)_w, RdAddress(2)_w;
   wire RdAddress(1)_w, RdAddress(0)_w, RdClock_w, WrClock_w, RdEn_w, WrEn_w;
   wire EDO(3)_w, EDO(2)_w, EDO(1)_w, EDO(0)_w, Q(31)_w, Q(30)_w;
   wire Q(29)_w, Q(28)_w, Q(27)_w, Q(26)_w, Q(25)_w, Q(24)_w;
   wire Q(23)_w, Q(22)_w, Q(21)_w, Q(20)_w, Q(19)_w, Q(18)_w;
   wire Q(17)_w, Q(16)_w, Q(15)_w, Q(14)_w, Q(13)_w, Q(12)_w;
   wire Q(11)_w, Q(10)_w, Q(9)_w, Q(8)_w, Q(7)_w, Q(6)_w;
   wire Q(5)_w, Q(4)_w, Q(3)_w, Q(2)_w, Q(1)_w, Q(0)_w;

   integer result_file;

   test  test_Tb(.EDI(3)(EDI(3)_w), .EDI(2)(EDI(2)_w), .EDI(1)(EDI(1)_w),
        .EDI(0)(EDI(0)_w), .Data(31)(Data(31)_w), .Data(30)(Data(30)_w),
        .Data(29)(Data(29)_w), .Data(28)(Data(28)_w), .Data(27)(Data(27)_w),
        .Data(26)(Data(26)_w), .Data(25)(Data(25)_w), .Data(24)(Data(24)_w),
        .Data(23)(Data(23)_w), .Data(22)(Data(22)_w), .Data(21)(Data(21)_w),
        .Data(20)(Data(20)_w), .Data(19)(Data(19)_w), .Data(18)(Data(18)_w),
        .Data(17)(Data(17)_w), .Data(16)(Data(16)_w), .Data(15)(Data(15)_w),
        .Data(14)(Data(14)_w), .Data(13)(Data(13)_w), .Data(12)(Data(12)_w),
        .Data(11)(Data(11)_w), .Data(10)(Data(10)_w), .Data(9)(Data(9)_w),
        .Data(8)(Data(8)_w), .Data(7)(Data(7)_w), .Data(6)(Data(6)_w),
        .Data(5)(Data(5)_w), .Data(4)(Data(4)_w), .Data(3)(Data(3)_w),
        .Data(2)(Data(2)_w), .Data(1)(Data(1)_w), .Data(0)(Data(0)_w),
        .WrAddress(9)(WrAddress(9)_w), .WrAddress(8)(WrAddress(8)_w), .WrAddress(7)(WrAddress(7)_w),
        .WrAddress(6)(WrAddress(6)_w), .WrAddress(5)(WrAddress(5)_w), .WrAddress(4)(WrAddress(4)_w),
        .WrAddress(3)(WrAddress(3)_w), .WrAddress(2)(WrAddress(2)_w), .WrAddress(1)(WrAddress(1)_w),
        .WrAddress(0)(WrAddress(0)_w), .RdAddress(9)(RdAddress(9)_w), .RdAddress(8)(RdAddress(8)_w),
        .RdAddress(7)(RdAddress(7)_w), .RdAddress(6)(RdAddress(6)_w), .RdAddress(5)(RdAddress(5)_w),
        .RdAddress(4)(RdAddress(4)_w), .RdAddress(3)(RdAddress(3)_w), .RdAddress(2)(RdAddress(2)_w),
        .RdAddress(1)(RdAddress(1)_w), .RdAddress(0)(RdAddress(0)_w), .RdClock(RdClock_w),
        .WrClock(WrClock_w), .RdEn(RdEn_w), .WrEn(WrEn_w),
        .EDO(3)(EDO(3)_w), .EDO(2)(EDO(2)_w), .EDO(1)(EDO(1)_w),
        .EDO(0)(EDO(0)_w), .Q(31)(Q(31)_w), .Q(30)(Q(30)_w),
        .Q(29)(Q(29)_w), .Q(28)(Q(28)_w), .Q(27)(Q(27)_w),
        .Q(26)(Q(26)_w), .Q(25)(Q(25)_w), .Q(24)(Q(24)_w),
        .Q(23)(Q(23)_w), .Q(22)(Q(22)_w), .Q(21)(Q(21)_w),
        .Q(20)(Q(20)_w), .Q(19)(Q(19)_w), .Q(18)(Q(18)_w),
        .Q(17)(Q(17)_w), .Q(16)(Q(16)_w), .Q(15)(Q(15)_w),
        .Q(14)(Q(14)_w), .Q(13)(Q(13)_w), .Q(12)(Q(12)_w),
        .Q(11)(Q(11)_w), .Q(10)(Q(10)_w), .Q(9)(Q(9)_w),
        .Q(8)(Q(8)_w), .Q(7)(Q(7)_w), .Q(6)(Q(6)_w),
        .Q(5)(Q(5)_w), .Q(4)(Q(4)_w), .Q(3)(Q(3)_w),
        .Q(2)(Q(2)_w), .Q(1)(Q(1)_w), .Q(0)(Q(0)_w));


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