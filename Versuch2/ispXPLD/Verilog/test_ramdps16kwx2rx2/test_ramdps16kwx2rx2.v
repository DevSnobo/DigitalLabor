`timescale 1ns / 100ps
module test_ramdps16kwx2rx2(
  Q,
  Data,
  WrAddress,
  RdAddress,
  WrClock,
  WrClockEn,
  RdClock,
  RdClockEn,
  WE,
  Reset);
  output [1:0] Q;
  input [1:0] Data;
  input [13:0] WrAddress;
  input [13:0] RdAddress;
  input WrClock,WrClockEn,RdClock,RdClockEn,WE,Reset;
                 
RAM_DP U0(
  .Q(Q),
  .Data(Data),
  .WrAddress(WrAddress),
  .RdAddress(RdAddress),
  .WrClock(WrClock),
  .WrClockEn(WrClockEn),
  .RdClock(RdClock),
  .RdClockEn(RdClockEn),
  .WE(WE),
  .Reset(Reset));
                   
  defparam U0.module_widthw = 2;
  defparam U0.module_widthadw = 14;
  defparam U0.module_numwordsw = 16384;
  defparam U0.module_widthr = 2;
  defparam U0.module_widthadr = 14;
  defparam U0.module_numwordsr = 16384;
  defparam U0.module_indata     = "REGISTERED";
  defparam U0.module_outdata    = "UNREGISTERED";
  defparam U0.module_addressr_control  = "REGISTERED";
  defparam U0.module_addressw_control  = "REGISTERED";
  defparam U0.module_init_file = "RAM_init";    
    
endmodule
    
module RAM_DP(
  Q,
  Data,
  WrAddress,
  RdAddress,
  WrClock,
  WrClockEn,
  RdClock,
  RdClockEn,
  WE,
  Reset);

  parameter module_type = "RAM_DP";
  parameter module_widthw     = 1;
  parameter module_widthr     = 1;
  parameter module_numwordsw  = 1;
  parameter module_widthadw   = 1;
  parameter module_widthadr   = 1;
  parameter module_numwordsr  = 1;
  parameter module_indata     = "REGISTERED";
  parameter module_outdata    = "REGISTERED";
  parameter module_addressw_control  = "REGISTERED";
  parameter module_addressr_control  = "REGISTERED";
  parameter module_hint = "UNUSED";
  parameter module_init_file = "RAM_init";

  output [module_widthr-1:0] Q;
  input [module_widthw-1:0] Data;
  input [module_widthadw-1:0] WrAddress;
  input [module_widthadr-1:0] RdAddress;
  input WrClock,WrClockEn,RdClock,RdClockEn,WE,Reset;

endmodule // ram_dp
