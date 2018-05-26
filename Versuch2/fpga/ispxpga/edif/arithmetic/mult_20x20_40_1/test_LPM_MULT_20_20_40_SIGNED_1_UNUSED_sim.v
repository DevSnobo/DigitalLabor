//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Thu Jul 29 15:08:42 2004
`timescale 1 ns / 100 ps
module  test_LPM_MULT_20_20_40_SIGNED_1_UNUSED (Result, DataA, DataB,
              Clock, Aclr);

input   Clock, 
        Aclr;
input   [19:0]  DataA;
input   [19:0]  DataB;
output  [39:0]  Result;
supply0 GND;
supply1 VCC;

lpm_mult_0_20_20_40_SIGNED_1 test_LPM_MULT_20_20_40_SIGNED_1_UNUSED_inst(.Clock(Clock),.Aclr(Aclr),.Result0(Result[0]),.Result1(Result[1]),
              .Result2(Result[2]),.Result3(Result[3]),.Result4(Result[4]),.Result5(Result[5]),
              .Result6(Result[6]),.Result7(Result[7]),.Result8(Result[8]),.Result9(Result[9]),
              .Result10(Result[10]),.Result11(Result[11]),.Result12(Result[12]),.Result13(Result[13]),
              .Result14(Result[14]),.Result15(Result[15]),.Result16(Result[16]),.Result17(Result[17]),
              .Result18(Result[18]),.Result19(Result[19]),.Result20(Result[20]),.Result21(Result[21]),
              .Result22(Result[22]),.Result23(Result[23]),.Result24(Result[24]),.Result25(Result[25]),
              .Result26(Result[26]),.Result27(Result[27]),.Result28(Result[28]),.Result29(Result[29]),
              .Result30(Result[30]),.Result31(Result[31]),.Result32(Result[32]),.Result33(Result[33]),
              .Result34(Result[34]),.Result35(Result[35]),.Result36(Result[36]),.Result37(Result[37]),
              .Result38(Result[38]),.Result39(Result[39]),.DataA0(DataA[0]),.DataA1(DataA[1]),
              .DataA2(DataA[2]),.DataA3(DataA[3]),.DataA4(DataA[4]),.DataA5(DataA[5]),
              .DataA6(DataA[6]),.DataA7(DataA[7]),.DataA8(DataA[8]),.DataA9(DataA[9]),
              .DataA10(DataA[10]),.DataA11(DataA[11]),.DataA12(DataA[12]),.DataA13(DataA[13]),
              .DataA14(DataA[14]),.DataA15(DataA[15]),.DataA16(DataA[16]),.DataA17(DataA[17]),
              .DataA18(DataA[18]),.DataA19(DataA[19]),.DataB0(DataB[0]),.DataB1(DataB[1]),
              .DataB2(DataB[2]),.DataB3(DataB[3]),.DataB4(DataB[4]),.DataB5(DataB[5]),
              .DataB6(DataB[6]),.DataB7(DataB[7]),.DataB8(DataB[8]),.DataB9(DataB[9]),
              .DataB10(DataB[10]),.DataB11(DataB[11]),.DataB12(DataB[12]),.DataB13(DataB[13]),
              .DataB14(DataB[14]),.DataB15(DataB[15]),.DataB16(DataB[16]),.DataB17(DataB[17]),
              .DataB18(DataB[18]),.DataB19(DataB[19]));

endmodule

 // LPM_MULT
module lpm_mult_0_20_20_40_SIGNED_1(Result0,Result1,Result2,Result3,Result4,Result5,
                Result6,Result7,Result8,Result9,Result10,Result11,
                Result12,Result13,Result14,Result15,Result16,Result17,
                Result18,Result19,Result20,Result21,Result22,Result23,
                Result24,Result25,Result26,Result27,Result28,Result29,
                Result30,Result31,Result32,Result33,Result34,Result35,
                Result36,Result37,Result38,Result39,
                DataA_0,DataA_1,DataA_2,DataA_3,DataA_4,DataA_5,
                DataA_6,DataA_7,DataA_8,DataA_9,DataA_10,DataA_11,
                DataA_12,DataA_13,DataA_14,DataA_15,DataA_16,DataA_17,
                DataA_18,DataA_19,DataB_0,DataB_1,DataB_2,DataB_3,
                DataB_4,DataB_5,DataB_6,DataB_7,DataB_8,DataB_9,
                DataB_10,DataB_11,DataB_12,DataB_13,DataB_14,DataB_15,
                DataB_16,DataB_17,DataB_18,DataB_19,
                Clock, Aclr);

output Result0,Result1,Result2,Result3,Result4,Result5,
       Result6,Result7,Result8,Result9,Result10,Result11,
       Result12,Result13,Result14,Result15,Result16,Result17,
       Result18,Result19,Result20,Result21,Result22,Result23,
       Result24,Result25,Result26,Result27,Result28,Result29,
       Result30,Result31,Result32,Result33,Result34,Result35,
       Result36,Result37,Result38,Result39;
input  DataA_0,DataA_1,DataA_2,DataA_3,DataA_4,DataA_5,
       DataA_6,DataA_7,DataA_8,DataA_9,DataA_10,DataA_11,
       DataA_12,DataA_13,DataA_14,DataA_15,DataA_16,DataA_17,
       DataA_18,DataA_19;
input  DataB_0,DataB_1,DataB_2,DataB_3,DataB_4,DataB_5,
       DataB_6,DataB_7,DataB_8,DataB_9,DataB_10,DataB_11,
       DataB_12,DataB_13,DataB_14,DataB_15,DataB_16,DataB_17,
       DataB_18,DataB_19;
input  Clock,Aclr;

parameter lpm_type   = "LPM_MULT";
parameter lpm_widtha  = 20;
parameter lpm_widthb  = 20;
parameter lpm_widths  = 0;
parameter lpm_widthp  = 40;
parameter lpm_pipeline = 1;
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

assign dataa = {DataA_19,DataA_18,DataA_17,DataA_16,DataA_15,DataA_14,
       DataA_13,DataA_12,DataA_11,DataA_10,DataA_9,DataA_8,
       DataA_7,DataA_6,DataA_5,DataA_4,DataA_3,DataA_2,
       DataA_1,DataA_0};
assign datab = {DataB_19,DataB_18,DataB_17,DataB_16,DataB_15,DataB_14,
       DataB_13,DataB_12,DataB_11,DataB_10,DataB_9,DataB_8,
       DataB_7,DataB_6,DataB_5,DataB_4,DataB_3,DataB_2,
       DataB_1,DataB_0};
assign {Result39,Result38,Result37,Result36,Result35,Result34,
       Result33,Result32,Result31,Result30,Result29,Result28,
       Result27,Result26,Result25,Result24,Result23,Result22,
       Result21,Result20,Result19,Result18,Result17,Result16,
       Result15,Result14,Result13,Result12,Result11,Result10,
       Result9,Result8,Result7,Result6,Result5,Result4,
       Result3,Result2,Result1,Result0} = result;

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
