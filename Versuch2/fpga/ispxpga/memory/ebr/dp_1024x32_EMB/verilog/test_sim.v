//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Thu Jul 29 13:48:50 2004
`timescale 1 ns / 100 ps
module  test (EDI, EDO, Q, Data, WrAddress, RdAddress,
              RdClock, WrClock, RdEn, WrEn);

input   RdClock, 
        WrClock, RdEn, WrEn;
input   [3:0]  EDI;
input   [31:0]  Data;
input   [9:0]  WrAddress;
input   [9:0]  RdAddress;
output  [3:0]  EDO;
output  [31:0]  Q;
supply0 GND;
supply1 VCC;

lpm_ramdp_32_10_1024 test_inst(.RdClock(RdClock),.WrClock(WrClock),.RdEn(RdEn),.WrEn(WrEn),
              .EDI0(EDI[0]),.EDI1(EDI[1]),.EDI2(EDI[2]),.EDI3(EDI[3]),
              .EDO0(EDO[0]),.EDO1(EDO[1]),.EDO2(EDO[2]),.EDO3(EDO[3]),
              .Q0(Q[0]),.Q1(Q[1]),.Q2(Q[2]),.Q3(Q[3]),
              .Q4(Q[4]),.Q5(Q[5]),.Q6(Q[6]),.Q7(Q[7]),
              .Q8(Q[8]),.Q9(Q[9]),.Q10(Q[10]),.Q11(Q[11]),
              .Q12(Q[12]),.Q13(Q[13]),.Q14(Q[14]),.Q15(Q[15]),
              .Q16(Q[16]),.Q17(Q[17]),.Q18(Q[18]),.Q19(Q[19]),
              .Q20(Q[20]),.Q21(Q[21]),.Q22(Q[22]),.Q23(Q[23]),
              .Q24(Q[24]),.Q25(Q[25]),.Q26(Q[26]),.Q27(Q[27]),
              .Q28(Q[28]),.Q29(Q[29]),.Q30(Q[30]),.Q31(Q[31]),
              .Data0(Data[0]),.Data1(Data[1]),.Data2(Data[2]),.Data3(Data[3]),
              .Data4(Data[4]),.Data5(Data[5]),.Data6(Data[6]),.Data7(Data[7]),
              .Data8(Data[8]),.Data9(Data[9]),.Data10(Data[10]),.Data11(Data[11]),
              .Data12(Data[12]),.Data13(Data[13]),.Data14(Data[14]),.Data15(Data[15]),
              .Data16(Data[16]),.Data17(Data[17]),.Data18(Data[18]),.Data19(Data[19]),
              .Data20(Data[20]),.Data21(Data[21]),.Data22(Data[22]),.Data23(Data[23]),
              .Data24(Data[24]),.Data25(Data[25]),.Data26(Data[26]),.Data27(Data[27]),
              .Data28(Data[28]),.Data29(Data[29]),.Data30(Data[30]),.Data31(Data[31]),
              .WrAddress0(WrAddress[0]),.WrAddress1(WrAddress[1]),.WrAddress2(WrAddress[2]),.WrAddress3(WrAddress[3]),
              .WrAddress4(WrAddress[4]),.WrAddress5(WrAddress[5]),.WrAddress6(WrAddress[6]),.WrAddress7(WrAddress[7]),
              .WrAddress8(WrAddress[8]),.WrAddress9(WrAddress[9]),.RdAddress0(RdAddress[0]),.RdAddress1(RdAddress[1]),
              .RdAddress2(RdAddress[2]),.RdAddress3(RdAddress[3]),.RdAddress4(RdAddress[4]),.RdAddress5(RdAddress[5]),
              .RdAddress6(RdAddress[6]),.RdAddress7(RdAddress[7]),.RdAddress8(RdAddress[8]),.RdAddress9(RdAddress[9]));

endmodule

 // LPM_RAM_DP
module lpm_ramdp_32_10_1024(EDI0,EDI1,EDI2,EDI3,EDO0,EDO1,EDO2,EDO3,Q0,Q1,Q2,Q3,Q4,Q5,
                 Q6,Q7,Q8,Q9,Q10,Q11,
                 Q12,Q13,Q14,Q15,Q16,Q17,
                 Q18,Q19,Q20,Q21,Q22,Q23,
                 Q24,Q25,Q26,Q27,Q28,Q29,
                 Q30,Q31,Data0,Data1,Data2,Data3,
                 Data4,Data5,Data6,Data7,Data8,Data9,
                 Data10,Data11,Data12,Data13,Data14,Data15,
                 Data16,Data17,Data18,Data19,Data20,Data21,
                 Data22,Data23,Data24,Data25,Data26,Data27,
                 Data28,Data29,Data30,Data31,RdAddress0,RdAddress1,
                 RdAddress2,RdAddress3,RdAddress4,RdAddress5,RdAddress6,RdAddress7,
                 RdAddress8,RdAddress9,WrAddress0,WrAddress1,WrAddress2,WrAddress3,
                 WrAddress4,WrAddress5,WrAddress6,WrAddress7,WrAddress8,WrAddress9,
                 RdEn,WrEn,RdClock,WrClock);

output EDO0,EDO1,EDO2,EDO3,Q0,Q1,Q2,Q3,Q4,Q5,
       Q6,Q7,Q8,Q9,Q10,Q11,
       Q12,Q13,Q14,Q15,Q16,Q17,
       Q18,Q19,Q20,Q21,Q22,Q23,
       Q24,Q25,Q26,Q27,Q28,Q29,
       Q30,Q31;
input  EDI0,EDI1,EDI2,EDI3,Data0,Data1,Data2,Data3,Data4,Data5,
       Data6,Data7,Data8,Data9,Data10,Data11,
       Data12,Data13,Data14,Data15,Data16,Data17,
       Data18,Data19,Data20,Data21,Data22,Data23,
       Data24,Data25,Data26,Data27,Data28,Data29,
       Data30,Data31;
input  RdAddress0,RdAddress1,RdAddress2,RdAddress3,RdAddress4,RdAddress5,
       RdAddress6,RdAddress7,RdAddress8,RdAddress9;
input  WrAddress0,WrAddress1,WrAddress2,WrAddress3,WrAddress4,WrAddress5,
       WrAddress6,WrAddress7,WrAddress8,WrAddress9;
input  RdEn,WrEn,RdClock,WrClock;

parameter lpm_type     = "LPM_RAM_DP";
parameter lpm_file     = "UNKNOWN";
parameter lpm_width    = 32;
parameter lpm_parity_width = 4;
parameter lpm_widthad  = 10;
parameter lpm_numwords = 1024;

wire [lpm_widthad-1:0] rdaddr;
wire [lpm_widthad-1:0] wraddr;
wire [lpm_width + lpm_parity_width - 1:0]   q;
wire [lpm_width + lpm_parity_width - 1:0]   data;
reg  [lpm_width + lpm_parity_width - 1:0]   SRAM [lpm_numwords-1:0];
reg  [lpm_width + lpm_parity_width - 1:0]   tmp_result;
reg  [lpm_width-1:0]   ONES;
reg  [lpm_width-1:0]   ALLZS;
integer i;

initial
begin
  for (i = 0; i < lpm_width; i = i + 1)
     ALLZS[i] = 1'bZ;
  for (i = 0; i < lpm_width; i = i + 1)
     ONES[i] = 1'b1;
  for (i = 0; i < lpm_numwords; i = i + 1)
     SRAM[i] = ONES;
end

assign rdaddr = {RdAddress9,RdAddress8,RdAddress7,RdAddress6,RdAddress5,RdAddress4,
               RdAddress3,RdAddress2,RdAddress1,RdAddress0};

assign wraddr = {WrAddress9,WrAddress8,WrAddress7,WrAddress6,WrAddress5,WrAddress4,
               WrAddress3,WrAddress2,WrAddress1,WrAddress0};

assign data = {EDI0,EDI1,EDI2,EDI3,Data31,Data30,Data29,Data28,Data27,Data26,
               Data25,Data24,Data23,Data22,Data21,Data20,
               Data19,Data18,Data17,Data16,Data15,Data14,
               Data13,Data12,Data11,Data10,Data9,Data8,
               Data7,Data6,Data5,Data4,Data3,Data2,
               Data1,Data0};

assign {EDO0,EDO1,EDO2,EDO3,Q31,Q30,Q29,Q28,Q27,Q26,
        Q25,Q24,Q23,Q22,Q21,Q20,
        Q19,Q18,Q17,Q16,Q15,Q14,
        Q13,Q12,Q11,Q10,Q9,Q8,
        Q7,Q6,Q5,Q4,Q3,Q2,
        Q1,Q0} = q;

always @(posedge WrClock)
begin
  if (WrEn)
    begin
        SRAM[wraddr] = data;
    end
end

always @(posedge RdClock)
begin
  if (RdEn)
    begin
        tmp_result = SRAM[rdaddr];
    end
end

assign q = tmp_result;
endmodule
