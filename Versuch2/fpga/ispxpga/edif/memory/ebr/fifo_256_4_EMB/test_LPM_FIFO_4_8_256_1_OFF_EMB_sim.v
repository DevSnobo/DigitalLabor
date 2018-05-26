//--------------------------------------------------------
// This file was developed by Lattice Semiconductor Corp.
// Lattice Semiconductor Corp. does not guarantee that
// this file is complete or fit for any particular purpose.
// Any one using this file are responsible for the results
// of such use.
//--------------------------------------------------------
// Mon Oct 11 15:50:25 2004
`timescale 1 ns / 100 ps
module  test_LPM_FIFO_4_8_256_1_OFF_EMB (EDI, EDO, Data, Q, UsedW,
              Clock, WrReq, RdReq, Aclr, Full, Empty);

input   Clock, 
        WrReq, RdReq, Aclr;
input   [0:0]  EDI;
input   [3:0]  Data;
output  Full, 
        Empty;
output  [0:0]  EDO;
output  [3:0]  Q;
output  [7:0]  UsedW;
supply0 GND;
supply1 VCC;

lpm_fifo_4_256_8_1 test_LPM_FIFO_4_8_256_1_OFF_EMB_inst(.Clock(Clock),.WrReq(WrReq),.RdReq(RdReq),.Aclr(Aclr),
              .Full(Full),.Empty(Empty),.EDI0(EDI[0]),.EDO0(EDO[0]),
              .Data0(Data[0]),.Data1(Data[1]),.Data2(Data[2]),.Data3(Data[3]),
              .Q0(Q[0]),.Q1(Q[1]),.Q2(Q[2]),.Q3(Q[3]),
              .UsedW0(UsedW[0]),.UsedW1(UsedW[1]),.UsedW2(UsedW[2]),.UsedW3(UsedW[3]),
              .UsedW4(UsedW[4]),.UsedW5(UsedW[5]),.UsedW6(UsedW[6]),.UsedW7(UsedW[7]));

endmodule

 // LPM_FIFO
module lpm_fifo_4_256_8_1(EDI0,EDO0,Q0,Q1,Q2,Q3,Empty,Full,UsedW0,UsedW1,
                  UsedW2,UsedW3,UsedW4,UsedW5,
                  UsedW6,UsedW7,
                  Data0,Data1,Data2,
                 Data3,Aclr,Clock,WrReq,RdReq);

output EDO0,Q0,Q1,Q2,Q3;
output Empty,Full,UsedW0,UsedW1,
                  UsedW2,UsedW3,UsedW4,UsedW5,
                  UsedW6,UsedW7;
input  EDI0,Data0,Data1,Data2,Data3;
input  Aclr,WrReq, RdReq, Clock;

reg Full, Empty;

parameter lpm_type     = "LPM_FIFO";
parameter lpm_width    = 4;
parameter lpm_parity_width = 1;
parameter lpm_widthu  = 8;
parameter lpm_numwords = 256;
parameter lpm_showahead = "OFF";

reg  [lpm_widthu + lpm_parity_width - 1:0]  usedw;

reg  [lpm_widthu + lpm_parity_width - 1:0]  tmp_usedw;
reg  [lpm_width + lpm_parity_width - 1:0]   q;
wire [lpm_width + lpm_parity_width - 1:0]   data;
reg  [lpm_width + lpm_parity_width - 1:0]   tmp_q;
reg  [lpm_width + lpm_parity_width - 1:0]   SRAM [lpm_numwords-1:0];
integer full_flag,empty_flag;
integer rdidx,wridx,count;

assign data = {EDI0,Data3,Data2,Data1,Data0};

assign {EDO0,Q3,Q2,Q1,Q0} = q;

assign {UsedW7,UsedW6,UsedW5,UsedW4,UsedW3,UsedW2,
        UsedW1,UsedW0} = usedw;

always @(posedge Clock or posedge Aclr)
begin
  if (Aclr)
    begin
      tmp_q = SRAM[rdidx];
      tmp_usedw = 0;
      rdidx = 0;
      wridx = 0;
      count = 0;
      full_flag = 0;
      empty_flag = 1;
      if (lpm_showahead == "ON")
         tmp_q = SRAM[0];
    end
  else
  if (RdReq && WrReq)
    begin
      if (full_flag == 0 && empty_flag == 0)
        begin
          SRAM[wridx] = data;
          if (wridx >= lpm_numwords-1)
            wridx = 0;
          else
            wridx = wridx + 1;
          tmp_q = SRAM[rdidx]; 
          if (lpm_showahead == "ON")
            tmp_q = SRAM[rdidx+1];
          if (rdidx >= lpm_numwords-1)
            rdidx = 0;
          else
            rdidx = rdidx + 1;
        end
    end
  else if (RdReq)
    begin
      if (empty_flag == 0)
        begin
          tmp_q = SRAM[rdidx]; 
          full_flag = 0;
          count = count - 1;
          if (count < 1)
            begin
              empty_flag = 1;
              count = 0;
            end
          if (rdidx >= lpm_numwords-1)
            begin
              rdidx = 0;
              if (lpm_showahead == "ON")
                tmp_q = SRAM[0]; 
            end
          else
            begin
              if (lpm_showahead == "ON")
                tmp_q = SRAM[rdidx+1]; 
              rdidx = rdidx + 1;
            end
        end
    end
  else if (WrReq)
    begin
      if (full_flag == 0)
        begin
          SRAM[wridx] = data; 
          if (lpm_showahead == "ON")
            tmp_q = SRAM[rdidx]; 
          count = count + 1;
          empty_flag = 0;
          if (count > lpm_numwords-1)
            begin
              full_flag = 1;
              count = lpm_numwords;
            end
          if (wridx >= lpm_numwords-1)
            wridx = 0;
          else
            wridx = wridx + 1;
        end
    end
  assign q = tmp_q;
  assign usedw = count;
  assign Empty = empty_flag;
  assign Full = full_flag;

end

endmodule
