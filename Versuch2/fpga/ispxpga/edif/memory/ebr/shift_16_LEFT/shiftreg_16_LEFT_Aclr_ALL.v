module shiftreg_16_LEFT_Aclr_ALL ( Q, ShiftOut, Data, Clock,  Enable, Aclr, ShiftIn, Load  );
      
input [15:0] Data;
input Clock,Enable,Aclr,ShiftIn,Load ;
output [15:0] Q;
output ShiftOut;
      
test U0( .Q(Q), .Data(Data), .Clock(Clock), .Enable(Enable), .Aclr(Aclr), .ShiftIn(ShiftIn), .Load(Load), .ShiftOut(ShiftOut) );
 	defparam U0.lpm_type = "LPM_SHIFTREG";
	defparam U0.lpm_width  = 16;
	defparam U0.lpm_direction = "LEFT";
	defparam U0.lpm_hint  = "UNUSED";    
                 
endmodule
    
    
module test ( Q, ShiftOut, Data, Clock,  Enable, Aclr, ShiftIn, Load ) /* synthesis syn_black_box */;

	parameter lpm_type = "LPM_SHIFTREG";
	parameter lpm_width  = 16;
	parameter lpm_direction = "LEFT";
	parameter lpm_hint  = "UNUSED";

	input  [lpm_width-1:0] Data;
	input  Clock, Enable;
	input  Aclr;
	input  ShiftIn, Load;
	output [lpm_width-1:0] Q;
	output ShiftOut;

endmodule // lpm_shiftreg
