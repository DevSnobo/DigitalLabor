module test_fifo16kx2 (Q,Full,Empty,AlmostFull,AlmostEmpty,Data,WrClock,WrEn,RdClock,RdEn,Aclr,PRReset);
output [1:0] Q;
output Full,Empty,AlmostFull,AlmostEmpty;
input [1:0] Data;
input WrClock,WrEn,RdClock,RdEn,Aclr,PRReset;
                 
fifo16kx2 U0(.Q(Q),.Full(Full),.Empty(Empty),.AlmostFull(AlmostFull),.AlmostEmpty(AlmostEmpty),.Data(Data),.WrClock(WrClock),.WrEn(WrEn),.RdClock(RdClock),.RdEn(RdEn),.Aclr(Aclr),.PRReset(PRReset));
                 
defparam U0.lpm_width=2;
defparam U0.lpm_widthu=14;
defparam U0.lpm_numwords=16384;
    
endmodule
    
    
module fifo16kx2(Q,Full,Empty,AlmostFull,AlmostEmpty,Data,WrClock,WrEn,RdClock,RdEn,Aclr,PRReset) ;

	parameter lpm_type = "LPM_FIFO_DC";
	parameter lpm_width  = 1;
	parameter lpm_widthu  = 1;
	parameter lpm_numwords = 2;
	parameter lpm_hint = "UNUSED";

	output [lpm_width-1:0] Q;
	output Full;
	output Empty;
	output AlmostFull;
	output AlmostEmpty;
	input  [lpm_width-1:0] Data;
	input  WrClock;
	input  WrEn;
	input  RdClock;
	input  RdEn;
	input  Aclr;
	input  PRReset;

endmodule // lpm_fifo
