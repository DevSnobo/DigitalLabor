`timescale 1ns / 100ps

module tb_test_cam128x48 ();

`include "test_cam128x48.tfi"

integer   test_out, index;
parameter width =62, patterns =23, step = 95;

reg [1:width] mem [1: patterns];

initial 
begin

	test_out = $fopen("test_out");

	$readmemb ("test.in", mem);

	for (index = 1; index <= patterns ; index = index + 1)
	begin
	#5 {Reset,We,ClockEn,Clock,EnMask,WrMask,WrDc,Wad,Data} = mem[index];

	#step $fdisplay (test_out, "%b %b %b",  Address,Match, MulMatch);
	end
end
endmodule
