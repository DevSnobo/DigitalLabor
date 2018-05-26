//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Thu Jul 29 13:48:13 2004
`timescale 1 ns / 100 ps
module  test (EDI, EDO, Q, Data, WrAddress, RdAddress,
              RdClock, WrClock, RdEn, WrEn);

input   RdClock, 
        WrClock, RdEn, WrEn;
input   [0:0]  EDI;
input   [3:0]  Data;
input   [3:0]  WrAddress;
input   [3:0]  RdAddress;
output  [0:0]  EDO;
output  [3:0]  Q;
supply0 GND;
supply1 VCC;

lpm_ramdp_4_4_16 test_inst(.RdClock(RdClock),.WrClock(WrClock),.RdEn(RdEn),.WrEn(WrEn),
              .EDI0(EDI[0]),.EDO0(EDO[0]),.Q0(Q[0]),.Q1(Q[1]),
              .Q2(Q[2]),.Q3(Q[3]),.Data0(Data[0]),.Data1(Data[1]),
              .Data2(Data[2]),.Data3(Data[3]),.WrAddress0(WrAddress[0]),.WrAddress1(WrAddress[1]),
              .WrAddress2(WrAddress[2]),.WrAddress3(WrAddress[3]),.RdAddress0(RdAddress[0]),.RdAddress1(RdAddress[1]),
              .RdAddress2(RdAddress[2]),.RdAddress3(RdAddress[3]));

endmodule

 // LPM_RAM_DP
module lpm_ramdp_4_4_16(EDI0,EDO0,Q0,Q1,Q2,Q3,Data0,Data1,
                 Data2,Data3,RdAddress0,RdAddress1,RdAddress2,RdAddress3,
                 WrAddress0,WrAddress1,WrAddress2,WrAddress3,RdEn,WrEn,RdClock,WrClock);

output EDO0,Q0,Q1,Q2,Q3;
input  EDI0,Data0,Data1,Data2,Data3;
input  RdAddress0,RdAddress1,RdAddress2,RdAddress3;
input  WrAddress0,WrAddress1,WrAddress2,WrAddress3;
input  RdEn,WrEn,RdClock,WrClock;

parameter lpm_type     = "LPM_RAM_DP";
parameter lpm_file     = "UNKNOWN";
parameter lpm_width    = 4;
parameter lpm_parity_width = 1;
parameter lpm_widthad  = 4;
parameter lpm_numwords = 16;

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

assign rdaddr = {RdAddress3,RdAddress2,RdAddress1,RdAddress0};

assign wraddr = {WrAddress3,WrAddress2,WrAddress1,WrAddress0};

assign data = {EDI0,Data3,Data2,Data1,Data0};

assign {EDO0,Q3,Q2,Q1,Q0} = q;

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
