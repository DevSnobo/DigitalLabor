`timescale 1ns / 100ps
module tb_test_ramdps16kwx2rx2 ();
`include "test_ramdps16kwx2rx2.tfi"

integer   test_out, index;
parameter width = 36, patterns = 23, step = 95;
reg [1:width] mem [1: patterns];

initial
begin
      test_out = $fopen("test_out");

      $readmemb("test.in", mem);

      for (index = 1; index <= patterns; index = index + 1)
      begin
      #5 {Reset,WE,WrClockEn,WrClock,WrAddress,Data,RdClockEn,RdClock,RdAddress} = mem[index];
      #step $fdisplay (test_out, "%b", Q);
      end
end
endmodule
