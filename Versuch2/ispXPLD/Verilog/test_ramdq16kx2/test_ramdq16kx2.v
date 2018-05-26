`timescale 1ns / 100ps
module test_ramdq16kx2(
  Q,
  Data,
  Address,
  Clock,
  ClockEn,
  WE,
  Reset);
  output [1:0] Q;
  input [1:0] Data;
  input [13:0] Address;
  input Clock,ClockEn,WE,Reset;
                 
RAM_DQ U0(
  .Q(Q),
  .Data(Data),
  .Address(Address),
  .Clock(Clock),
  .ClockEn(ClockEn),
  .WE(WE),
  .Reset(Reset));
                   
  defparam U0.module_width = 2;
  defparam U0.module_widthad = 14;
  defparam U0.module_numwords = 16384;
  defparam U0.module_indata = "REGISTERED";
  defparam U0.module_outdata = "UNREGISTERED";
  defparam U0.module_address_control = "REGISTERED";
  defparam U0.module_init_file = "RAM_init";    

endmodule
      
module RAM_DQ(
  Q,
  Data,
  Address,
  Clock,
  ClockEn,
  WE,
  Reset);

  parameter module_type = "RAM_DQ";
  parameter module_width     = 1;
  parameter module_numwords  = 1;
  parameter module_widthad   = 1;
  parameter module_indata    = "REGISTERED";
  parameter module_outdata   = "UNREGISTERED";
  parameter module_address_control  = "REGISTERED";
  parameter module_hint = "UNUSED";
  parameter module_init_file = "RAM_init";

  output [module_width-1:0] Q;
  input [module_width-1:0] Data;
  input [module_widthad-1:0] Address;
  input Clock,ClockEn,WE,Reset;

endmodule //ram_dq
