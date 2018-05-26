`timescale 1ns / 100ps
module tb_test_ramdp8kx2x2 ();

`include "test_ramdp8kx2x2.tfi"

integer   test_out, index;
parameter width = 38, patterns = 25, step = 95;
reg [1:width] mem [1: patterns];

initial
begin
      test_out = $fopen("test_out");

      $readmemb("test.in", mem);

      for (index = 1; index <= patterns; index = index + 1)
      begin
      #5 {ResetA,WrA,ClockEnA,ClockA,AddressA,DataInA,ResetB,WrB,ClockEnB,ClockB,AddressB,DataInB} = mem[index];
      #step $fdisplay (test_out, "%b %b", QA, QB);
      end
end
endmodule
