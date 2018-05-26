module mult_16x16_32_SIGNED_0_Aclr ( Result, DataA_, DataB_ );
      
input [15:0] DataA_;
input [15:0] DataB_;
output [31:0] Result;
                 
test U0( .Result(Result), .DataA_(DataA_), .DataB_(DataB_));
	defparam U0.lpm_type = "LPM_MULT";
	defparam U0.lpm_widtha = 16;
	defparam U0.lpm_widthb = 16;
	defparam U0.lpm_widthp = 32;
	defparam U0.lpm_representation  = "SIGNED";
	defparam U0.lpm_pipeline  = 0;
	defparam U0.lpm_hint = "UNUSED";
                 
endmodule
    
    
module test ( Result, DataA_, DataB_, Clock, Aclr ); /* synthesis syn_black_box */ 

	parameter lpm_type = "LPM_MULT";
	parameter lpm_widtha = 16;
	parameter lpm_widthb = 16;
	parameter lpm_widthp = 32;
	parameter lpm_representation  = "SIGNED";
	parameter lpm_pipeline  = 0;
	parameter lpm_hint = "UNUSED";

	input  Clock;
	input  Aclr;
	input  [lpm_widtha-1:0] DataA_;
	input  [lpm_widthb-1:0] DataB_;
	output [lpm_widthp-1:0] Result;

endmodule // lpm_mult
