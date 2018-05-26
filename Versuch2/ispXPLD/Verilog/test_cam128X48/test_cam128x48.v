`timescale 1ns / 100ps
module test_cam128x48(
  Address,
  Match,
  MulMatch,
  Wad,
  Data,
  Clock,
  ClockEn,
  We,
  EnMask,
  WrMask,
  WrDc,
  Reset);
  output [6:0] Address;
  output Match,MulMatch;
  input [47:0] Data;
  input [6:0] Wad;
  input Clock,ClockEn,We,EnMask,WrMask,WrDc,Reset;
                 
CAM CAM_U0(
  .Address(Address),
  .Match(Match),
  .MulMatch(MulMatch),
  .WrAddress(Wad), 
  .Data(Data),
  .Clock(Clock),
  .ClockEn(ClockEn),
  .WE(We),
  .EnMask(EnMask),
  .WrMask(WrMask),
  .WrDC(WrDc),
  .Reset(Reset)); 

  defparam CAM_U0.module_width=48;
  defparam CAM_U0.module_widthad=7;
  defparam CAM_U0.module_numwords=128;
  defparam CAM_U0.module_init_file = "CAM_init";    
    
endmodule

module CAM(
  Address,
  Match,
  MulMatch,
  WrAddress,
  Data,
  Clock,
  ClockEn,
  WE,
  EnMask,
  WrMask,
  WrDC,
  Reset);

  parameter module_type = "CAM";
  parameter module_width  = 1;
  parameter module_widthad  = 1;
  parameter module_numwords = 1;
  parameter module_hint = "UNUSED";
  parameter module_init_file = "CAM_init";
  output [module_widthad-1:0] Address;
  output Match;
  output MulMatch;
  input  [module_width-1:0] Data;
  input  [module_widthad-1:0] WrAddress;
  input  Clock;
  input  ClockEn;
  input  WE;
  input  EnMask;
  input  WrMask;
  input  WrDC;
  input  Reset; 

endmodule //cam

