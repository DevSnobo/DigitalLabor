// Verilog Stimulus Data from the Waveform Editor
// File: alarmclk.tf - 3/15/2001 4:08:40 PM

`timescale 1 ns / 1 ns

// Define Module for Test Fixture

module alarmclk_wdl;

`include "alarmclk.tfi"

// Code for all top level Inputs and BiDirs

  initial begin   // 'clock'
    repeat ( 25 )
    begin  // Patt_2
      clock = 0; #20;
      clock = 1; #20;
    end
  end  // clock

  initial begin   // 'ld_new_alrm_time'
    ld_new_alrm_time = 0; #203;
    ld_new_alrm_time = 1; #37;
    ld_new_alrm_time = 0; #760;
  end  // ld_new_alrm_time

  initial begin   // 'ld_new_clk_time'
    ld_new_clk_time = 0; #603;
    ld_new_clk_time = 1; #37;
    ld_new_clk_time = 0; #360;
  end  // ld_new_clk_time

  initial begin   // 'new_alrm_time'
    new_alrm_time[3:0] = 4 'h 0; #203;
    new_alrm_time[3:0] = 4 'h b; #797;
  end  // new_alrm_time

  initial begin   // 'new_clk_time'
    new_clk_time[3:0] = 4 'h 0; #603;
    new_clk_time[3:0] = 4 'h 8; #397;
  end  // new_clk_time

  initial begin   // 'reset'
    reset = 1; #10;
    reset = 0; #990;
  end  // reset

  initial begin   // 'showalrm'
    showalrm = 0; #220;
    showalrm = 1; #40;
    showalrm = 0; #740;
  end  // showalrm

endmodule // t
