module dp_16x4_DIS ( EDI,EDO,RdEn,WrEn,RdClock,WrClock,addr,addw,data,result );
input [3:0] data;
input [3:0] addr,addw;
output [3:0] result;
input WrEn,RdClock,WrClock,RdEn;
input [0:0] EDI;                 
output [0:0] EDO;                 
test U0(.EDI(EDI), .EDO(EDO), .RdEn(RdEn), .RdAddress(addr), .WrAddress(addw), .WrEn(WrEn), .RdClock(RdClock), .WrClock(WrClock), .Data(data), .Q(result));
  	defparam U0.lpm_type = "LPM_RAM_DP";
	defparam U0.lpm_width = 4;
	defparam U0.lpm_widthad = 4;
	defparam U0.lpm_numwords = 16;
	defparam U0.lpm_indata = "REGISTERED";
	defparam U0.lpm_outdata = "REGISTERED";
	defparam U0.lpm_rdaddress_control  = "UNREGISTERED";
	defparam U0.lpm_wraddress_control  = "UNREGISTERED";
        defparam U0.lpm_parity_width = 1; 
	defparam U0.lpm_file = "UNUSED";
	defparam U0.lpm_hint = "DIS";              
    
endmodule
    
    
module test ( EDI, EDO, Q, Data, WrAddress, RdAddress, RdClock, WrClock,  RdEn, WrEn) /* synthesis syn_black_box */ ; 


	parameter lpm_type = "LPM_RAM_DP";
	parameter lpm_width = 4;
	parameter lpm_widthad = 4;
	parameter lpm_numwords = 16;
	parameter lpm_indata = "REGISTERED";
	parameter lpm_outdata = "REGISTERED";
	parameter lpm_rdaddress_control  = "UNREGISTERED";
	parameter lpm_wraddress_control  = "UNREGISTERED";
        parameter lpm_parity_width = 1; 
	parameter lpm_file = "UNUSED";
	parameter lpm_hint = "DIS";

	input  [lpm_width-1:0] Data;
	input  [lpm_widthad-1:0] RdAddress, WrAddress;
	input  RdClock, WrClock, RdEn, WrEn;
        input  [lpm_parity_width-1:0] EDI;
        output [lpm_parity_width-1:0] EDO;
	output [lpm_width-1:0] Q;

endmodule 
