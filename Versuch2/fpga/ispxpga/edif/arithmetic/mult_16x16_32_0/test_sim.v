//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Wed Apr 06 22:17:08 2005
`timescale 1 ns / 100 ps
module  test (Result, DataA_, DataB_);

input   [15:0]  DataA_;
input   [15:0]  DataB_;
output  [31:0]  Result;
supply0 GND;
supply1 VCC;

lpm_mult_0_16_16_32_SIGNED_0 test_inst(.Result0(Result[0]),.Result1(Result[1]),.Result2(Result[2]),.Result3(Result[3]),
              .Result4(Result[4]),.Result5(Result[5]),.Result6(Result[6]),.Result7(Result[7]),
              .Result8(Result[8]),.Result9(Result[9]),.Result10(Result[10]),.Result11(Result[11]),
              .Result12(Result[12]),.Result13(Result[13]),.Result14(Result[14]),.Result15(Result[15]),
              .Result16(Result[16]),.Result17(Result[17]),.Result18(Result[18]),.Result19(Result[19]),
              .Result20(Result[20]),.Result21(Result[21]),.Result22(Result[22]),.Result23(Result[23]),
              .Result24(Result[24]),.Result25(Result[25]),.Result26(Result[26]),.Result27(Result[27]),
              .Result28(Result[28]),.Result29(Result[29]),.Result30(Result[30]),.Result31(Result[31]),
              .DataA_0(DataA_[0]),.DataA_1(DataA_[1]),.DataA_2(DataA_[2]),.DataA_3(DataA_[3]),
              .DataA_4(DataA_[4]),.DataA_5(DataA_[5]),.DataA_6(DataA_[6]),.DataA_7(DataA_[7]),
              .DataA_8(DataA_[8]),.DataA_9(DataA_[9]),.DataA_10(DataA_[10]),.DataA_11(DataA_[11]),
              .DataA_12(DataA_[12]),.DataA_13(DataA_[13]),.DataA_14(DataA_[14]),.DataA_15(DataA_[15]),
              .DataB_0(DataB_[0]),.DataB_1(DataB_[1]),.DataB_2(DataB_[2]),.DataB_3(DataB_[3]),
              .DataB_4(DataB_[4]),.DataB_5(DataB_[5]),.DataB_6(DataB_[6]),.DataB_7(DataB_[7]),
              .DataB_8(DataB_[8]),.DataB_9(DataB_[9]),.DataB_10(DataB_[10]),.DataB_11(DataB_[11]),
              .DataB_12(DataB_[12]),.DataB_13(DataB_[13]),.DataB_14(DataB_[14]),.DataB_15(DataB_[15]),.Clock(GND),.Aclr(GND));

endmodule

 // LPM_MULT
module lpm_mult_0_16_16_32_SIGNED_0(Result0,Result1,Result2,Result3,Result4,Result5,
                Result6,Result7,Result8,Result9,Result10,Result11,
                Result12,Result13,Result14,Result15,Result16,Result17,
                Result18,Result19,Result20,Result21,Result22,Result23,
                Result24,Result25,Result26,Result27,Result28,Result29,
                Result30,Result31,
                DataA_0,DataA_1,DataA_2,DataA_3,DataA_4,DataA_5,
                DataA_6,DataA_7,DataA_8,DataA_9,DataA_10,DataA_11,
                DataA_12,DataA_13,DataA_14,DataA_15,DataB_0,DataB_1,
                DataB_2,DataB_3,DataB_4,DataB_5,DataB_6,DataB_7,
                DataB_8,DataB_9,DataB_10,DataB_11,DataB_12,DataB_13,
                DataB_14,DataB_15,
                Clock, Aclr);

output Result0,Result1,Result2,Result3,Result4,Result5,
       Result6,Result7,Result8,Result9,Result10,Result11,
       Result12,Result13,Result14,Result15,Result16,Result17,
       Result18,Result19,Result20,Result21,Result22,Result23,
       Result24,Result25,Result26,Result27,Result28,Result29,
       Result30,Result31;
input  DataA_0,DataA_1,DataA_2,DataA_3,DataA_4,DataA_5,
       DataA_6,DataA_7,DataA_8,DataA_9,DataA_10,DataA_11,
       DataA_12,DataA_13,DataA_14,DataA_15;
input  DataB_0,DataB_1,DataB_2,DataB_3,DataB_4,DataB_5,
       DataB_6,DataB_7,DataB_8,DataB_9,DataB_10,DataB_11,
       DataB_12,DataB_13,DataB_14,DataB_15;
input  Clock,Aclr;

parameter lpm_type   = "LPM_MULT";
parameter lpm_widtha  = 16;
parameter lpm_widthb  = 16;
parameter lpm_widths  = 0;
parameter lpm_widthp  = 32;
parameter lpm_pipeline = 0;
parameter lpm_representation = "SIGNED";

reg  [lpm_widthp-1:0] tmp_result;
reg  [lpm_widthp-1:0] tmp_result2 [lpm_pipeline:0];
reg  [lpm_widtha-2:0] a_int;
reg  [lpm_widthb-2:0] b_int;
reg  [lpm_widths-2:0] s_int;
reg  [lpm_widthp-2:0] p_reg;
reg  [lpm_widthp-1:0] p_int;
integer i, j, k, m, n, p, maxs_mn;
integer int_datas, int_sum;
reg  [lpm_widthp-1:0] int_dataa;
reg  [lpm_widthp-1:0] int_datab;
reg  [lpm_widthp-1:0] int_result;

wire [lpm_widtha-1:0]   dataa;
wire [lpm_widthb-1:0]   datab;
wire [lpm_widths-1:0]   sum;
wire [lpm_widthp-1:0]   result;

assign dataa = {DataA_15,DataA_14,DataA_13,DataA_12,DataA_11,DataA_10,
       DataA_9,DataA_8,DataA_7,DataA_6,DataA_5,DataA_4,
       DataA_3,DataA_2,DataA_1,DataA_0};
assign datab = {DataB_15,DataB_14,DataB_13,DataB_12,DataB_11,DataB_10,
       DataB_9,DataB_8,DataB_7,DataB_6,DataB_5,DataB_4,
       DataB_3,DataB_2,DataB_1,DataB_0};
assign {Result31,Result30,Result29,Result28,Result27,Result26,
       Result25,Result24,Result23,Result22,Result21,Result20,
       Result19,Result18,Result17,Result16,Result15,Result14,
       Result13,Result12,Result11,Result10,Result9,Result8,
       Result7,Result6,Result5,Result4,Result3,Result2,
       Result1,Result0} = result;

 always @(dataa or datab or sum)
   begin
     if (lpm_representation == "UNSIGNED")
       begin
          int_dataa = dataa;
          int_datab = datab;
          int_sum   = sum;
       end
     else if (lpm_representation == "SIGNED")
       begin
          if (dataa[lpm_widtha-1] == 1)
            begin
              int_dataa = 0;
              for (i = 0; i < lpm_widtha - 1; i = i + 1)
                a_int[i] = dataa[i] ^ 1;
              int_dataa = (a_int + 1) * (-1);
            end
          else int_dataa = dataa;

          if (datab[lpm_widthb-1] == 1)
            begin
              int_datab = 0;
              for (j = 0; j < lpm_widthb - 1; j = j + 1)
                b_int[j] = datab[j] ^ 1;
              int_datab = (b_int + 1) * (-1);
            end
          else int_datab = datab;

          if (sum[lpm_widths-1] == 1)
            begin
              int_sum = 0;
              for (k = 0; k < lpm_widths - 1; k = k + 1)
                s_int[k] = sum[k] ^ 1;
              int_sum = (s_int + 1) * (-1);
            end
          else int_sum = sum;
       end
     else
       begin
         int_dataa = {lpm_widtha{1'bx}};
         int_datab = {lpm_widthb{1'bx}};
         int_datas = {lpm_widths{1'bx}};
       end

     p_int = int_dataa * int_datab;
     maxs_mn = ((lpm_widtha+lpm_widthb)>lpm_widths)?lpm_widtha+lpm_widthb:lpm_widths;
     if (lpm_widthp >= maxs_mn)
       tmp_result = p_int;
     else
       begin
         p_reg = p_int;
         for (m = 0; m < lpm_widthp; m = m + 1)
           tmp_result[lpm_widthp-1-m] = p_reg[maxs_mn-1-m];
       end
   end

 always @(posedge Clock or posedge Aclr)
   begin
     if (Aclr)
       begin
        for (p = 0; p <= lpm_pipeline; p = p + 1)
          tmp_result2[p] = 'b0;
       end
     else
       begin :syn_block
         tmp_result2[lpm_pipeline] = tmp_result;
         for (n = 0;  n < lpm_pipeline; n = n + 1)
           tmp_result2[n] = tmp_result2[n+1];
       end
   end

 assign result = (lpm_pipeline > 0) ? tmp_result2[0] : tmp_result;

endmodule
