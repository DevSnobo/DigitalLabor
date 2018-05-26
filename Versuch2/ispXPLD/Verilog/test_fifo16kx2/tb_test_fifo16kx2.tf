`timescale 1ns / 100ps
module tb_test_fifo16kx2 ();

`include "test_fifo16kx2.tfi"

integer   test_out, index;
parameter width = 8, patterns = 25, step = 95;

reg [1:width] mem [1: patterns];

initial
begin
      test_out = $fopen("test_out");
      $readmemb("test.in", mem);
      for (index = 1; index <= patterns; index = index + 1)
      begin
      #5 {Reset,RPReset,WrEn,WrClock,RdEn,RdClock,Data} = mem[index];
      #step $fdisplay (test_out, "%b %b %b %b %b",  Q,Full,Empty,AlmostFull,AlmostEmpty);
      end
end
endmodule
