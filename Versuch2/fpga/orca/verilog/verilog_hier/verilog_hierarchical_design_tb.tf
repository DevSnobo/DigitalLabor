// Verilog Stimulus Data from the Waveform Editing Tool
// File: timingsim.tf - 12/12/2000 11:58:19 AM

`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module verilog_hierarchical_design_tb;

`include "verilog_hierarchical_design.tfi"

// Code for all top level Inputs and BiDirs

  initial begin   // 'a'
    a[7:0] = 8 'h 01; #29500;
    a[7:0] = 8 'h 02; #28000;
    a[7:0] = 8 'h 03; #20500;
    a[7:0] = 8 'h 04; #25000;
    a[7:0] = 8 'h 05; #20500;
    a[7:0] = 8 'h 06; #24500;
    a[7:0] = 8 'h 07; #21000;
    a[7:0] = 8 'h 08; #21000;
    a[7:0] = 8 'h 09; #33000;
    a[7:0] = 8 'h 0a; #15000;
    a[7:0] = 8 'h 0b; #14500;
    a[7:0] = 8 'h 0c; #23500;
  end  // a

  initial begin   // 'b'
    b[7:0] = 8 'h 0a; #17500;
    b[7:0] = 8 'h 0b; #20000;
    b[7:0] = 8 'h 0c; #20500;
    b[7:0] = 8 'h 0d; #18000;
    b[7:0] = 8 'h 0e; #26500;
    b[7:0] = 8 'h 0f; #33000;
    b[7:0] = 8 'h 10; #30000;
    b[7:0] = 8 'h 11; #22000;
    b[7:0] = 8 'h 12; #24500;
    b[7:0] = 8 'h 13; #32500;
    b[7:0] = 8 'h 14; #28500;
  end  // b

  initial begin   // 'sel'
    sel = 1; #125000;
    sel = 0; #132500;
  end  // sel

  initial begin   // 'r_l'
    r_l = 1; #55000;
    r_l = 0; #65500;
    r_l = 1; #65500;
    r_l = 0; #71500;
  end  // r_l

  initial begin   // 'clk'
    repeat ( 64 )
    begin  // Patt_7
      clk = 0; #2000;
      clk = 1; #2000;
    end
  end  // clk

  initial begin   // 'rst'
    rst = 1; #8500;
    rst = 0; #251000;
    rst = 1; #9000;
  end  // rst

endmodule // t
