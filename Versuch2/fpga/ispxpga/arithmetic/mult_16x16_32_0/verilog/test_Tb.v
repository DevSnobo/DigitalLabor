// 
// Testbench template
// You may need to edit it to meet your needs
// 
`timescale 1 ns / 100 ps
module test_top;
   wire DataA_(15)_w, DataA_(14)_w, DataA_(13)_w, DataA_(12)_w, DataA_(11)_w, DataA_(10)_w;
   wire DataA_(9)_w, DataA_(8)_w, DataA_(7)_w, DataA_(6)_w, DataA_(5)_w, DataA_(4)_w;
   wire DataA_(3)_w, DataA_(2)_w, DataA_(1)_w, DataA_(0)_w, DataB_(15)_w, DataB_(14)_w;
   wire DataB_(13)_w, DataB_(12)_w, DataB_(11)_w, DataB_(10)_w, DataB_(9)_w, DataB_(8)_w;
   wire DataB_(7)_w, DataB_(6)_w, DataB_(5)_w, DataB_(4)_w, DataB_(3)_w, DataB_(2)_w;
   wire DataB_(1)_w, DataB_(0)_w, Result(31)_w, Result(30)_w, Result(29)_w, Result(28)_w;
   wire Result(27)_w, Result(26)_w, Result(25)_w, Result(24)_w, Result(23)_w, Result(22)_w;
   wire Result(21)_w, Result(20)_w, Result(19)_w, Result(18)_w, Result(17)_w, Result(16)_w;
   wire Result(15)_w, Result(14)_w, Result(13)_w, Result(12)_w, Result(11)_w, Result(10)_w;
   wire Result(9)_w, Result(8)_w, Result(7)_w, Result(6)_w, Result(5)_w, Result(4)_w;
   wire Result(3)_w, Result(2)_w, Result(1)_w, Result(0)_w;

   integer result_file;

   test  test_Tb(.DataA_(15)(DataA_(15)_w), .DataA_(14)(DataA_(14)_w), .DataA_(13)(DataA_(13)_w),
        .DataA_(12)(DataA_(12)_w), .DataA_(11)(DataA_(11)_w), .DataA_(10)(DataA_(10)_w),
        .DataA_(9)(DataA_(9)_w), .DataA_(8)(DataA_(8)_w), .DataA_(7)(DataA_(7)_w),
        .DataA_(6)(DataA_(6)_w), .DataA_(5)(DataA_(5)_w), .DataA_(4)(DataA_(4)_w),
        .DataA_(3)(DataA_(3)_w), .DataA_(2)(DataA_(2)_w), .DataA_(1)(DataA_(1)_w),
        .DataA_(0)(DataA_(0)_w), .DataB_(15)(DataB_(15)_w), .DataB_(14)(DataB_(14)_w),
        .DataB_(13)(DataB_(13)_w), .DataB_(12)(DataB_(12)_w), .DataB_(11)(DataB_(11)_w),
        .DataB_(10)(DataB_(10)_w), .DataB_(9)(DataB_(9)_w), .DataB_(8)(DataB_(8)_w),
        .DataB_(7)(DataB_(7)_w), .DataB_(6)(DataB_(6)_w), .DataB_(5)(DataB_(5)_w),
        .DataB_(4)(DataB_(4)_w), .DataB_(3)(DataB_(3)_w), .DataB_(2)(DataB_(2)_w),
        .DataB_(1)(DataB_(1)_w), .DataB_(0)(DataB_(0)_w), .Result(31)(Result(31)_w),
        .Result(30)(Result(30)_w), .Result(29)(Result(29)_w), .Result(28)(Result(28)_w),
        .Result(27)(Result(27)_w), .Result(26)(Result(26)_w), .Result(25)(Result(25)_w),
        .Result(24)(Result(24)_w), .Result(23)(Result(23)_w), .Result(22)(Result(22)_w),
        .Result(21)(Result(21)_w), .Result(20)(Result(20)_w), .Result(19)(Result(19)_w),
        .Result(18)(Result(18)_w), .Result(17)(Result(17)_w), .Result(16)(Result(16)_w),
        .Result(15)(Result(15)_w), .Result(14)(Result(14)_w), .Result(13)(Result(13)_w),
        .Result(12)(Result(12)_w), .Result(11)(Result(11)_w), .Result(10)(Result(10)_w),
        .Result(9)(Result(9)_w), .Result(8)(Result(8)_w), .Result(7)(Result(7)_w),
        .Result(6)(Result(6)_w), .Result(5)(Result(5)_w), .Result(4)(Result(4)_w),
        .Result(3)(Result(3)_w), .Result(2)(Result(2)_w), .Result(1)(Result(1)_w),
        .Result(0)(Result(0)_w));


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