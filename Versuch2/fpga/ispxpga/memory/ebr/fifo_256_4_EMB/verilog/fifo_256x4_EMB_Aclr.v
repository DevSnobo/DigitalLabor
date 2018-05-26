module fifo_256x4_EMB_Aclr (EDI, EDO, WrReq,RdReq,Clock,Aclr,Full,Empty,UsedW,data,result);
input [3:0] data;
output [7:0] UsedW;
output [3:0] result;
input WrReq,RdReq,Clock,Aclr;
input EDI;                 
output EDO;                 
output Full,Empty;
                 
test U0( .EDI(EDI), .EDO(EDO), .WrReq(WrReq),.RdReq(RdReq),.Clock(Clock),.Aclr(Aclr),.Data(data),.Q(result),.Full(Full),.Empty(Empty),.UsedW(UsedW));
                 
defparam U0.lpm_width=4;
defparam U0.lpm_widthu=8;
defparam U0.lpm_numwords=256;
defparam U0.lpm_parity_width=1;
defparam U0.lpm_hint="EMB"; 
    
    
endmodule
    
    
module test (EDI, EDO, Data, Clock, WrReq, RdReq, Aclr, Q, UsedW, Full, Empty) ; /* synthesis syn_black_box */ 

	parameter lpm_type = "LPM_FIFO";
	parameter lpm_width  = 4;
	parameter lpm_widthu  = 8;
	parameter lpm_numwords = 256;
        parameter lpm_parity_width= 1;
	parameter lpm_showahead = "OFF";
	parameter lpm_hint = "EMB";

	input [lpm_width-1:0] Data;
	input Clock;
	input WrReq;
	input RdReq;
	input Aclr;
	input [lpm_parity_width-1:0] EDI;
        output [lpm_parity_width-1:0] EDO;
	output [lpm_width-1:0] Q;
	output [lpm_widthu-1:0] UsedW;
	output Full;
	output Empty;

endmodule // lpm_fifo
