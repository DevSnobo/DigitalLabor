//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Thu Jul 29 14:52:57 2004
`timescale 1 ns / 100 ps
module  test (Q, Data,
              Clock, Enable, Aclr, ShiftIn, Load, ShiftOut);

input   Clock, 
        Enable, Aclr, ShiftIn, Load;
input   [15:0]  Data;
output  ShiftOut;
output  [15:0]  Q;
supply0 GND;
supply1 VCC;

lpm_shiftreg_16_LEFT_aclr test_inst(.Clock(Clock),.Enable(Enable),.Aclr(Aclr),.ShiftIn(ShiftIn),
              .Load(Load),.ShiftOut(ShiftOut),.Q0(Q[0]),.Q1(Q[1]),
              .Q2(Q[2]),.Q3(Q[3]),.Q4(Q[4]),.Q5(Q[5]),
              .Q6(Q[6]),.Q7(Q[7]),.Q8(Q[8]),.Q9(Q[9]),
              .Q10(Q[10]),.Q11(Q[11]),.Q12(Q[12]),.Q13(Q[13]),
              .Q14(Q[14]),.Q15(Q[15]),.Data0(Data[0]),.Data1(Data[1]),
              .Data2(Data[2]),.Data3(Data[3]),.Data4(Data[4]),.Data5(Data[5]),
              .Data6(Data[6]),.Data7(Data[7]),.Data8(Data[8]),.Data9(Data[9]),
              .Data10(Data[10]),.Data11(Data[11]),.Data12(Data[12]),.Data13(Data[13]),
              .Data14(Data[14]),.Data15(Data[15]),.Aset(GND),.Sclr(GND),.Sset(GND));

endmodule

 // LPM_SHIFTREG
module lpm_shiftreg_16_LEFT_aclr(Q0,Q1,Q2,Q3,Q4,Q5,
              Q6,Q7,Q8,Q9,Q10,Q11,
              Q12,Q13,Q14,Q15,Data0,Data1,
              Data2,Data3,Data4,Data5,Data6,Data7,
              Data8,Data9,Data10,Data11,Data12,Data13,
              Data14,Data15,
              Enable, Aclr, Aset, Sclr, Sset,
Load, Clock, ShiftIn, ShiftOut);

input  Data0,Data1,Data2,Data3,Data4,Data5,
       Data6,Data7,Data8,Data9,Data10,Data11,
       Data12,Data13,Data14,Data15;
input  Enable, Clock, Load;
input  Aclr, Aset, Sclr, Sset;
input  ShiftIn;

output Q0,Q1,Q2,Q3,Q4,Q5,
       Q6,Q7,Q8,Q9,Q10,Q11,
       Q12,Q13,Q14,Q15;
output ShiftOut;

parameter lpm_type   = "LPM_SHIFTREG";
parameter lpm_width  = 16;
parameter lpm_shift_value = 0;
parameter lpm_avalue = 16'b1111111111111111;
parameter lpm_svalue = 16'b1111111111111111;
parameter lpm_direction = "LEFT";

wire [lpm_width-1:0]   data;
wire [lpm_width-1:0]   q;
reg  [lpm_width-1:0]   tmp_q;
reg  [lpm_width-1:0]   tmp_q2 [lpm_shift_value:0];
reg  tmp_q3 [lpm_shift_value:0];
reg  abit, tmp_q1;
integer i, j;

wire tmp_shiftout, tmp_shiftout1;

assign data = {Data15,Data14,Data13,Data12,Data11,Data10,
       Data9,Data8,Data7,Data6,Data5,Data4,
       Data3,Data2,Data1,Data0};
assign {Q15,Q14,Q13,Q12,Q11,Q10,
       Q9,Q8,Q7,Q6,Q5,Q4,
       Q3,Q2,Q1,Q0} = q;

always @(posedge Clock or posedge Aclr or posedge Aset)
begin :asyn_block
  if (Aclr)
    begin
      tmp_q = 0;
      for (i = 0; i <= lpm_shift_value; i = i + 1)
          tmp_q2[i] = 0;
    end
  else if (Aset)
    begin
      tmp_q = lpm_avalue;
      for (i = 0; i <= lpm_shift_value; i = i + 1)
          tmp_q2[i] = lpm_avalue;
    end
  else
    begin :syn_block
      if (Enable)
        begin
          if (Sclr)
            begin
              tmp_q = 0;
              for (i = 0; i <= lpm_shift_value; i = i + 1)
                  tmp_q2[i] = 0;
            end
          else if (Sset)
            begin
              tmp_q = lpm_svalue;
              for (i = 0; i <= lpm_shift_value; i = i + 1)
                  tmp_q2[i] = lpm_svalue;
            end
          else if (Load)
            begin
              tmp_q = data;
            end
          else if (!Load)
            begin
              if (lpm_direction == "LEFT")
                begin
                  {abit, tmp_q} = {tmp_q, ShiftIn};
                  tmp_q2[lpm_shift_value] = tmp_q;
                  for (j = 0; j < lpm_shift_value; j = j + 1)
                      tmp_q2[j] = tmp_q2[j+1];
                  {abit, tmp_q1} = {tmp_q1, ShiftIn};
                  tmp_q3[lpm_shift_value] = tmp_q1;
                  for (j = 0; j < lpm_shift_value; j = j + 1)
                      tmp_q3[j] = tmp_q3[j+1];
                end
              else if (lpm_direction == "RIGHT")
                begin
                  {tmp_q, abit} = {ShiftIn, tmp_q};
                  for (j = 0; j < lpm_shift_value; j = j + 1)
                      tmp_q2[j] = tmp_q2[j+1];
                end
            end
        end
    end
end

assign tmp_shiftout = (lpm_direction == "LEFT") ? tmp_q[lpm_width-1]:tmp_q[0];
assign tmp_shiftout1 = tmp_q3[0];
assign q = (lpm_shift_value > 0) ? tmp_q2[0] : tmp_q;
assign ShiftOut = (lpm_shift_value > 0) ? tmp_shiftout1 : tmp_shiftout;

endmodule
