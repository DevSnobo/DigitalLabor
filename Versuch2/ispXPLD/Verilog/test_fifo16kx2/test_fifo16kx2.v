`timescale 1ns / 100ps
module test_fifo16kx2 (
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
  
  output [1:0] Q;
  output Full,Empty,AlmostFull,AlmostEmpty;
  input  [1:0] Data;
  input WrClock,WrEn,RdClock,RdEn,Reset,RPReset;

FIFO_DC U0(
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

  defparam U0.module_width = 2;
  defparam U0.module_widthu = 14;
  defparam U0.module_numwords = 16384;
  defparam U0.module_amfull_flag = 11;
  defparam U0.module_amempty_flag = 11;
endmodule

module FIFO_DC(
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

  parameter module_type = "FIFO_DC";
  parameter module_width  = 1;
  parameter module_widthu  = 1;
  parameter module_numwords = 1;
  parameter module_hint = "UNUSED";
  parameter module_amfull_flag = 1;
  parameter module_amempty_flag = 1;
  
  output [module_width-1:0] Q;
  output Full;
  output Empty;
  output AlmostEmpty;
  output AlmostFull;
  input  [module_width-1:0] Data;
  input  WrClock;
  input  WrEn;
  input  RdClock;
  input  RdEn;
  input  Reset;
  input  RPReset;

endmodule //fifo_dc
