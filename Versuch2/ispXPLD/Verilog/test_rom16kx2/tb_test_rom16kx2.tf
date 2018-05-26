`timescale 1ns / 100ps

module tb_test_rom16kx2 ();

`include "test_rom16kx2.tfi"

integer   test_out, index;
parameter width =18, patterns =15, step = 95;
reg [1:width] mem [1: patterns];

initial 
begin

	test_out = $fopen("test_out");

	$readmemb ("test.in", mem);

	for (index = 1; index <= patterns ; index = index + 1)
	begin
	#5 {Reset,OutClockEn,OutClock,Address} = mem[index];

	#step $fdisplay (test_out, "%b",  Q);
	end
end
endmodule
