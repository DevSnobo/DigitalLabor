// 
// Testbench template
// You may need to edit it to meet your needs
// 
`timescale 1 ns / 100 ps
module test_top;
   wire Data(15)_w, Data(14)_w, Data(13)_w, Data(12)_w, Data(11)_w, Data(10)_w;
   wire Data(9)_w, Data(8)_w, Data(7)_w, Data(6)_w, Data(5)_w, Data(4)_w;
   wire Data(3)_w, Data(2)_w, Data(1)_w, Data(0)_w, Clock_w, Cnt_En_w;
   wire UpDown_w, Sclr_w, Q(15)_w, Q(14)_w, Q(13)_w, Q(12)_w;
   wire Q(11)_w, Q(10)_w, Q(9)_w, Q(8)_w, Q(7)_w, Q(6)_w;
   wire Q(5)_w, Q(4)_w, Q(3)_w, Q(2)_w, Q(1)_w, Q(0)_w;

   integer result_file;

   test  test_Tb(.Data(15)(Data(15)_w), .Data(14)(Data(14)_w), .Data(13)(Data(13)_w),
        .Data(12)(Data(12)_w), .Data(11)(Data(11)_w), .Data(10)(Data(10)_w),
        .Data(9)(Data(9)_w), .Data(8)(Data(8)_w), .Data(7)(Data(7)_w),
        .Data(6)(Data(6)_w), .Data(5)(Data(5)_w), .Data(4)(Data(4)_w),
        .Data(3)(Data(3)_w), .Data(2)(Data(2)_w), .Data(1)(Data(1)_w),
        .Data(0)(Data(0)_w), .Clock(Clock_w), .Cnt_En(Cnt_En_w),
        .UpDown(UpDown_w), .Sclr(Sclr_w), .Q(15)(Q(15)_w),
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