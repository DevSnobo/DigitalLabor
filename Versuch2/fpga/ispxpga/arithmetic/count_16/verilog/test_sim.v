//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Mon Sep 09 10:03:37 2002
`timescale 1 ns / 100 ps
module  test (Q, Data,
              Clock, Cnt_En, UpDown, Sclr);

input   Clock, 
        Cnt_En, UpDown, Sclr;
input   [15:0]  Data;
output  [15:0]  Q;
supply0 GND;
supply1 VCC;

lpm_counter_16_16 test_inst(.Clock(Clock),.Cnt_En(Cnt_En),.UpDown(UpDown),.Sclr(Sclr),
              .Q0(Q[0]),.Q1(Q[1]),.Q2(Q[2]),.Q3(Q[3]),
              .Q4(Q[4]),.Q5(Q[5]),.Q6(Q[6]),.Q7(Q[7]),
              .Q8(Q[8]),.Q9(Q[9]),.Q10(Q[10]),.Q11(Q[11]),
              .Q12(Q[12]),.Q13(Q[13]),.Q14(Q[14]),.Q15(Q[15]),
              .Data0(Data[0]),.Data1(Data[1]),.Data2(Data[2]),.Data3(Data[3]),
              .Data4(Data[4]),.Data5(Data[5]),.Data6(Data[6]),.Data7(Data[7]),
              .Data8(Data[8]),.Data9(Data[9]),.Data10(Data[10]),.Data11(Data[11]),
              .Data12(Data[12]),.Data13(Data[13]),.Data14(Data[14]),.Data15(Data[15]),.Clk_En(VCC),.Aclr(GND),.Aset(GND),.Aload(GND),.Sset(GND),.Sload(GND));

endmodule

 // LPM_COUNTER
module lpm_counter_16_16(Q0,Q1,Q2,Q3,Q4,Q5,
              Q6,Q7,Q8,Q9,Q10,Q11,
              Q12,Q13,Q14,Q15,
              Data0,Data1,Data2,Data3,Data4,Data5,
              Data6,Data7,Data8,Data9,Data10,Data11,
              Data12,Data13,Data14,Data15,
              Clock, Clk_En, Cnt_En, Aclr, Aset, Aload,
              UpDown,Sclr, Sset, Sload);

output Q0,Q1,Q2,Q3,Q4,Q5,
       Q6,Q7,Q8,Q9,Q10,Q11,
       Q12,Q13,Q14,Q15;
input  Data0,Data1,Data2,Data3,Data4,Data5,
       Data6,Data7,Data8,Data9,Data10,Data11,
       Data12,Data13,Data14,Data15;
input  Clock, Clk_En, Cnt_En;
input  UpDown;
input  Aclr, Aset, Aload;
input  Sclr, Sset, Sload;

parameter lpm_type   = "LPM_COUNTER";
parameter lpm_width  = 16;
parameter lpm_modulus= 65536;
parameter lpm_avalue = 16'b1111111111111111;
parameter lpm_svalue = 16'b1111111111111111;

wire [lpm_width-1:0]   data;
wire [lpm_width-1:0]   q;
reg  [lpm_width-1:0]   tmp_count;
reg  [lpm_width-1:0]   re_start;
integer up_limit;

assign data = {Data15,Data14,Data13,Data12,Data11,Data10,
       Data9,Data8,Data7,Data6,Data5,Data4,
       Data3,Data2,Data1,Data0};
assign {Q15,Q14,Q13,Q12,Q11,Q10,
       Q9,Q8,Q7,Q6,Q5,Q4,
       Q3,Q2,Q1,Q0} = q;

always @(posedge Clock or posedge Aclr or posedge Aset or posedge Aload)
begin :asyn_block
  if (Aclr)
    begin
      tmp_count = 0;
    end
  else if (Aset)
    begin
      tmp_count = lpm_avalue;
    end
  else if (Aload)
    begin
      tmp_count = data;
    end
  else
    begin :syn_block
      if (Clk_En)
        begin
          if (Sclr)
            begin :syn_clr
              tmp_count = 0;
            end
          else if (Sset)
            begin :syn_set
              tmp_count = lpm_svalue;
            end
          else if (Sload)
            begin :syn_load
              tmp_count = data;
            end
          else if (Cnt_En)
            begin
              up_limit = (UpDown == 1)?(lpm_modulus - 1):0;
              re_start = (UpDown == 1)?0:(lpm_modulus - 1);
              if (((tmp_count >= up_limit) && UpDown) ||
                  ((tmp_count == up_limit) && UpDown))
                tmp_count = re_start;
              else
                tmp_count = (UpDown == 1)?tmp_count+1:tmp_count-1;
            end
        end
    end
end

assign q = tmp_count;
endmodule
