`timescale 1ns / 100ps

module test_rom16kx2(
  Q,
  Address,
  OutClock,
  OutClockEn,
  Reset);
  output [1:0] Q;
  input [13:0] Address;
  input OutClock,OutClockEn,Reset;
                 
ROM U0(
  .Q(Q),
  .Address(Address),
  .OutClock(OutClock),
  .OutClockEn(OutClockEn),
  .Reset(Reset));
  
  defparam U0.module_width = 2;
  defparam U0.module_widthad = 14;
  defparam U0.module_numwords = 16384;
  defparam U0.module_outdata = "REGISTERED";
  defparam U0.module_address_control = "UNREGISTERED";
  defparam U0.module_init_file = "ROM_init";    

endmodule
      
module ROM(
  Q,
  Address,
  OutClock,
  OutClockEn,
  Reset);

  parameter module_type = "ROM";
  parameter module_width     = 1;
  parameter module_numwords  = 1;
  parameter module_widthad   = 1;
  parameter module_outdata   = "REGISTERED";
  parameter module_address_control  = "UNREGISTERED";
  parameter module_init_file = "ROM_init";
  parameter module_hint = "UNUSED";

  output [module_width-1:0] Q;
  input [module_widthad-1:0] Address;
  input OutClock,OutClockEn,Reset;

endmodule //rom
