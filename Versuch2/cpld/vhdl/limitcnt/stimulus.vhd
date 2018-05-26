LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

entity stimulus is
end stimulus;

Architecture behavior of stimulus is

   signal      clk : std_logic;
   signal      csn : std_logic;
   signal      rst : std_logic;
   signal      wen : std_logic;
   signal     end0 : std_logic;
   signal     end1 : std_logic;
   signal     end2 : std_logic;
   signal     end3 : std_logic;
   signal     out0 : std_logic;
   signal     out1 : std_logic;
   signal     out2 : std_logic;
   signal     out3 : std_logic;

   component TOP
      Port (     clk : In    std_logic;
                 csn : In    std_logic;
                 rst : In    std_logic;
                 wen : In    std_logic;
                end0 : InOut std_logic;
                end1 : InOut std_logic;
                end2 : InOut std_logic;
                end3 : InOut std_logic;
                out0 : Out   std_logic;
                out1 : Out   std_logic;
                out2 : Out   std_logic;
                out3 : Out   std_logic );
   end component;

   -- Time constants. Making the bus cycle timings a multiple of the
   -- clock period will help to avoid setup/hold timing violations
   -- during post-route simulation. Note that some of these constants
   -- may have to be adjusted in order to perform a succesful post-route
   -- simulation in a particular target device.
   constant clk_period : time := 50 ns;
   constant write_cycle_period : time := clk_period * 2;
   constant read_cycle_period : time := clk_period * 2;
   constant data_hold_time : time := 5 ns;

   signal out_bus, end_in, end_out : std_logic_vector(3 downto 0);

   -- This procedure performs a write cycle over the bidirectional bus
   procedure write_end (variable data : in std_logic_vector(3 downto 0);
      signal csn, wen : inout std_logic;
      signal end_in : inout std_logic_vector(3 downto 0)) is
   begin
      csn <= '0';
      wen <= '0';
      end_in <= data;
      wait for write_cycle_period;
      csn <= '1';
      wen <= '1';
   end write_end;

   -- This procedure performs a read cycle over the bidirectional bus
   procedure read_end (variable data : in std_logic_vector(3 downto 0);
      signal csn : inout std_logic;
      signal end_out : in std_logic_vector(3 downto 0)) is
   begin
      csn <= '0';
      wait for read_cycle_period;
      assert (data = end_out)
         report "Error on readback of END port"
            severity error;
      csn <= '1';
   end read_end;

begin
   UUT : TOP
      Port Map ( clk=>clk, csn=>csn, end0=>end0, end1=>end1, end2=>end2,
                 end3=>end3, out0=>out0, out1=>out1, out2=>out2,
                 out3=>out3, rst=>rst, wen=>wen );

-- *** Test Bench - User Defined Section ***

   -- For convience, re-group the end and out ports into vectors.
   out_bus(3) <= out3;
   out_bus(2) <= out2;
   out_bus(1) <= out1;
   out_bus(0) <= out0;
   end_out(3) <= end3;
   end_out(2) <= end2;
   end_out(1) <= end1;
   end_out(0) <= end0;

   -- create the logical equivalent of a tri-state driver in the testbench to
   -- drive the bidirectional bus.
   end3 <= end_in(3) when (csn = '0' and wen = '0') else 'Z' after data_hold_time;
   end2 <= end_in(2) when (csn = '0' and wen = '0') else 'Z' after data_hold_time;
   end1 <= end_in(1) when (csn = '0' and wen = '0') else 'Z' after data_hold_time;
   end0 <= end_in(0) when (csn = '0' and wen = '0') else 'Z' after data_hold_time;

   -- create a clock oscillator
   p_clock : process
   begin
      clk <= '0';
      wait for (clk_period/2);
      clk <= '1';
      wait for (clk_period/2);
   end process;

   -- main stimulus process
   p_stim: process
      variable data : std_logic_vector(3 downto 0);
   begin
      csn <= '1';
      wen <= '1';
      end_in <= (others => '0');
      rst <= '1';
      wait for clk_period*2;
      rst <= '0';
      wait for clk_period;
      --data := x"5";
      data := "0101";
      write_end(data, csn, wen, end_in);
      wait for clk_period*2;
      read_end(data, csn, end_out);
      wait for clk_period*5;
      wait for clk_period;
      data := "1111";
      write_end(data, csn, wen, end_in);
      wait for clk_period*2;
      read_end(data, csn, end_out);
      wait for clk_period*20;
      assert false
         report "Reached end of stimulus."
            severity note;
   end process;

-- *** End Test Bench - User Defined Section ***

end behavior;

