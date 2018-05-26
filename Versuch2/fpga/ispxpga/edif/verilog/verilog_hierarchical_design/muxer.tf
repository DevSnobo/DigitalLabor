// Verilog Stimulus Data from the Waveform Editor
// File: muxer.tf - 4/24/2001 2:05:39 PM

`timescale 1 ps / 1 ps

// Define Module for Test Fixture

module muxer_wdl;

`include "mux.tfi"

// Code for all top level Inputs and BiDirs

  initial begin   // 'a'
    a[7:0] = 8 'h 01; #10000;
    a[7:0] = 8 'h 02; #9500;
    a[7:0] = 8 'h 03; #10000;
    a[7:0] = 8 'h 04; #10500;
    a[7:0] = 8 'h 05; #10000;
    a[7:0] = 8 'h 06; #10000;
    a[7:0] = 8 'h 07; #10000;
    a[7:0] = 8 'h 08; #10500;
    a[7:0] = 8 'h 09; #9500;
    a[7:0] = 8 'h 0a; #10000;
  end  // a

  initial begin   // 'b'
    b[7:0] = 8 'h 06; #10000;
    b[7:0] = 8 'h 07; #9500;
    b[7:0] = 8 'h 08; #10500;
    b[7:0] = 8 'h 09; #10000;
    b[7:0] = 8 'h 0a; #10000;
    b[7:0] = 8 'h 0b; #10000;
    b[7:0] = 8 'h 0c; #10000;
    b[7:0] = 8 'h 0d; #10000;
    b[7:0] = 8 'h 0e; #10000;
    b[7:0] = 8 'h 0f; #9500;
  end  // b

  initial begin   // 'sel'
    sel = 1; #50000;
    sel = 0; #50000;
  end  // sel

endmodule // t
