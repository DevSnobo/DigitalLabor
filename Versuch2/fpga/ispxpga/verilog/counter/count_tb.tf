// Verilog Stimulus Data from the Waveform Editor
// File: count.tf - 4/24/2001 2:02:06 PM

`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module count_tb;

`include "count.tfi"

// Code for all top level Inputs and BiDirs

  initial begin   // 'clk'
    clk = 0; #80;
    clk = 1; #78;
    clk = 0; #78;
    clk = 1; #86;
    clk = 0; #78;
    clk = 1; #62;
    clk = 0; #64;
    clk = 1; #58;
    clk = 0; #60;
    clk = 1; #74;
    clk = 0; #58;
    clk = 1; #70;
    clk = 0; #58;
    clk = 1; #70;
    clk = 0; #26;
  end  // clk

  initial begin   // 'rst'
    rst = 0; #284;
    rst = 1; #54;
    rst = 0; #662;
  end  // rst

endmodule // t
