// Verilog Stimulus Data from the Waveform Editing Tool
// File: timingsim.tf - 12/12/2000 11:58:19 AM

`timescale 1 ns / 1 ns

// Define Module for Test Fixture

`include "verilog_hierarchical_design.h"

module verilog_hierarchical_design_tb;

    reg [`data_width-1:0] a;
    reg [`data_width-1:0] b;
    reg sel;
    reg r_l;
    reg clk;
    reg rst;


// Outputs
    wire [`data_width-1:0] q;


// Bidirs


// Instantiate the UUT
    verilog_hierarchical_design UUT (
        .q(q), 
        .a(a), 
        .b(b), 
        .sel(sel), 
        .r_l(r_l), 
        .clk(clk), 
        .rst(rst)
        );


// Initialize Inputs
    `ifdef auto_init

        initial begin
            a = 0;
            b = 0;
            sel = 0;
            r_l = 0;
            clk = 0;
            rst = 0;
        end

    `endif

// Code for all top level Inputs and BiDirs

  initial begin   // 'a'
    a[`data_width-1:0] = 8 'h 01; #29500;
    a[`data_width-1:0] = 8 'h 02; #28000;
    a[`data_width-1:0] = 8 'h 03; #20500;
    a[`data_width-1:0] = 8 'h 04; #25000;
    a[`data_width-1:0] = 8 'h 05; #20500;
    a[`data_width-1:0] = 8 'h 06; #24500;
    a[`data_width-1:0] = 8 'h 07; #21000;
    a[`data_width-1:0] = 8 'h 08; #21000;
    a[`data_width-1:0] = 8 'h 09; #33000;
    a[`data_width-1:0] = 8 'h 0a; #15000;
    a[`data_width-1:0] = 8 'h 0b; #14500;
    a[`data_width-1:0] = 8 'h 0c; #23500;
  end  // a

  initial begin   // 'b'
    b[`data_width-1:0] = 8 'h 0a; #17500;
    b[`data_width-1:0] = 8 'h 0b; #20000;
    b[`data_width-1:0] = 8 'h 0c; #20500;
    b[`data_width-1:0] = 8 'h 0d; #18000;
    b[`data_width-1:0] = 8 'h 0e; #26500;
    b[`data_width-1:0] = 8 'h 0f; #33000;
    b[`data_width-1:0] = 8 'h 10; #30000;
    b[`data_width-1:0] = 8 'h 11; #22000;
    b[`data_width-1:0] = 8 'h 12; #24500;
    b[`data_width-1:0] = 8 'h 13; #32500;
    b[`data_width-1:0] = 8 'h 14; #28500;
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
