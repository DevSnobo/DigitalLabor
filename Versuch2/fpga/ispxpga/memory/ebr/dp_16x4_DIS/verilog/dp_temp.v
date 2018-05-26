module test ( EDI, EDO, Q, Data, WrAddress, RdAddress, RdClock, WrClock,  RdEn, WrEn) ; 


	parameter lpm_type = "LPM_RAM_DP";
	parameter lpm_width = 1;
	parameter lpm_widthad = 1;
	parameter lpm_numwords = 1<< lpm_widthad;
	parameter lpm_indata = "REGISTERED";
	parameter lpm_outdata = "REGISTERED";
	parameter lpm_rdaddress_control  = "UNREGISTERED";
	parameter lpm_wraddress_control  = "UNREGISTERED";
        parameter lpm_parity_width = 1; 
	parameter lpm_file = "UNUSED";
	parameter lpm_hint = "UNUSED";

	input  [lpm_width-1:0] Data;
	input  [lpm_widthad-1:0] RdAddress, WrAddress;
	input  RdClock, WrClock, RdEn, WrEn;
        input  [lpm_parity_width-1:0] EDI;
        output [lpm_parity_width-1:0] EDO;
	output [lpm_width-1:0] Q;

endmodule 
