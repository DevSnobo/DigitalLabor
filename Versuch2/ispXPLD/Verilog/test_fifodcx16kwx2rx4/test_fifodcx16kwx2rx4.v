`timescale 1ns / 100ps
module test_fifodcx16kwx2rx4 (
  Q,
  Full,
  Empty,
  AlmostFull,
  AlmostEmpty,
  Data,
  WrClock,
  WrEn,
  RdClock,
  RdEn,
  Reset,
  RPReset);

  output [3:0] Q;
  output Full,Empty,AlmostFull,AlmostEmpty;
  input  [1:0] Data;
  input WrClock,WrEn,RdClock,RdEn,Reset,RPReset;

FIFO_DCX U0(
  .Q(Q),
  .Full(Full),
  .Empty(Empty),
  .AlmostFull(AlmostFull),
  .AlmostEmpty(AlmostEmpty),
  .Data(Data),
  .WrClock(WrClock),
  .WrEn(WrEn),
  .RdClock(RdClock),
  .RdEn(RdEn),
  .Reset(Reset),
  .RPReset(RPReset));

  defparam U0.module_widthw = 2;
  defparam U0.module_widthr = 4;
  defparam U0.module_widthuw = 13;
  defparam U0.module_widthur = 12;
  defparam U0.module_numwordsw = 8192;
  defparam U0.module_numwordsr = 4096;
  defparam U0.module_amfull_flag = 1;
  defparam U0.module_amempty_flag = 1;

endmodule
  
module FIFO_DCX(
  Q,
  Full,
  Empty,
  AlmostFull,
  AlmostEmpty,
  Data,
  WrClock,
  WrEn,
  RdClock,
  RdEn,
  Reset,
  RPReset) ;

  parameter module_type = "FIFO_DCX";
  parameter module_widthw  = 1;
  parameter module_widthr  = 1;
  parameter module_widthuw  = 1;
  parameter module_widthur  = 1;
  parameter module_numwordsw = 1;
  parameter module_numwordsr = 1;
  parameter module_hint = "UNUSED";
  parameter module_amfull_flag = 1;
  parameter module_amempty_flag = 1;
  
  output [module_widthr-1:0] Q;
  output Full;
  output Empty;
  output AlmostEmpty;
  output AlmostFull;
  input  [module_widthw-1:0] Data;
  input  WrClock;
  input  WrEn;
  input  RdClock;
  input  RdEn;
  input  Reset;
  input  RPReset;
endmodule //fifo_dcx

