`timescale 1ns / 100ps
module test_ramdp8kx2x2 (
  QA,
  QB,
  DataInA,
  AddressA,
  DataInB,
  AddressB,
  ClockA,
  ClockEnA,
  ClockB,
  ClockEnB,
  WrA,
  WrB,
  ResetA,
  ResetB);

  output [1:0] QA;
  output [1:0] QB;
  input  [1:0] DataInA;
  input  [1:0] DataInB;
  input  [12:0] AddressA;
  input  [12:0] AddressB;
  input ClockA,ClockEnA,ClockB,ClockEnB,WrA,WrB,ResetA,ResetB;

RAM_DP_TRUE U0 (
  .QA(QA),
  .QB(QB),
  .DataInA(DataInA),
  .AddressA(AddressA),
  .DataInB(DataInB),
  .AddressB(AddressB),
  .ClockA(ClockA),
  .ClockEnA(ClockEnA),
  .ClockB(ClockB),
  .ClockEnB(ClockEnB),
  .WrA(WrA),
  .WrB(WrB),
  .ResetA(ResetA),
  .ResetB(ResetB));
  
  defparam U0.module_widtha = 2;
  defparam U0.module_widthada = 13;
  defparam U0.module_numwordsa = 8192;
  defparam U0.module_widthb =  2;
  defparam U0.module_widthadb = 13;
  defparam U0.module_numwordsb = 8192;
  defparam U0.module_indata    = "REGISTERED";
  defparam U0.module_outdata   = "UNREGISTERED";
  defparam U0.module_addressa_control  = "REGISTERED";
  defparam U0.module_addressb_control  = "REGISTERED";
  defparam U0.module_init_file = "RAM_init";
  
endmodule

module RAM_DP_TRUE(
  QA,
  QB,
  DataInA,
  AddressA,
  DataInB,
  AddressB,
  ClockA,
  ClockEnA,
  ClockB,
  ClockEnB,
  WrA,
  WrB,
  ResetA,
  ResetB);

  parameter module_type = "RAM_DP_TRUE";
  parameter module_widtha     = 1;
  parameter module_widthada   = 1;
  parameter module_numwordsa  = 1;
  parameter module_widthb     = 1;
  parameter module_widthadb   = 1;
  parameter module_numwordsb  = 1;
  parameter module_indata     = "REGISTERED";
  parameter module_outdata    = "UNREGISTERED";
  parameter module_addressa_control  = "REGISTERED";
  parameter module_addressb_control  = "REGISTERED";
  parameter module_hint = "UNUSED";
  parameter module_init_file = "RAM_init";

  output [module_widtha-1:0] QA;
  output [module_widthb-1:0] QB;
  input [module_widtha-1:0] DataInA;
  input [module_widthada-1:0] AddressA;
  input [module_widthb-1:0] DataInB;
  input [module_widthadb-1:0] AddressB;
  input ClockA,ClockEnA,ClockB,ClockEnB,WrA,WrB,ResetA,ResetB;

endmodule // ram_dp_true

