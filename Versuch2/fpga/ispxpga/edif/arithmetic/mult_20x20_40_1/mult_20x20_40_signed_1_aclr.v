module mult_20x20_40_SIGNED_1_Aclr ( Result, DataA, DataB, Clock, Aclr );
     
input [19:0] DataA;
input [19:0] DataB;
output [39:0] Result;
input Clock, Aclr;
                 
                 
test U0( .Clock(Clock), .Aclr(Aclr), .Result(Result), .DataA(DataA), .DataB(DataB));  
                 
defparam U0.lpm_widtha=20;
defparam U0.lpm_widthb=20;
defparam U0.lpm_widthp=40;
defparam U0.lpm_pipeline=1;
defparam U0.lpm_representation="SIGNED";
defparam U0.lpm_pipeline  = 1;
defparam U0.lpm_hint = "UNUSED";
         
endmodule
    
    
module test ( Result, DataA, DataB, Clock, Aclr ); /* synthesis syn_black_box */

	parameter lpm_type = "LPM_MULT";
	parameter lpm_widtha = 20;
	parameter lpm_widthb = 20;
	parameter lpm_widthp = 40;
	parameter lpm_representation  = "SIGNED";
	parameter lpm_pipeline  = 1;
	parameter lpm_hint = "UNUSED";

	input  Clock;
	input  Aclr;
	input  [lpm_widtha-1:0] DataA;
	input  [lpm_widthb-1:0] DataB;
	output [lpm_widthp-1:0] Result;

endmodule // lpm_mult
