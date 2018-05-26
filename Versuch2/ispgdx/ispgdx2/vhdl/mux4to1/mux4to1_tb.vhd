library ieee;
use ieee.std_logic_1164.all;

entity mux4to1_tb is
end mux4to1_tb;

-- purpose: STIMULUS for testing 4:1 MUX
architecture TB of mux4to1_tb is
	component mux4to1
	port (mux_out : out std_logic_vector (15 downto 0);
              mux_in1 : in  std_logic_vector (15 downto 0);
              mux_in2 : in  std_logic_vector (15 downto 0);
              mux_in3 : in  std_logic_vector (15 downto 0);
              mux_in4 : in  std_logic_vector (15 downto 0);
              clk     : in std_logic;
              sel     : in std_logic_vector(1 downto 0);
              rst   : in std_logic);
	end component;

signal mux_in1 : std_logic_vector (15 downto 0) := "0000000000000001";
signal mux_in2 : std_logic_vector (15 downto 0) := "0000000000010000";
signal mux_in3 : std_logic_vector (15 downto 0) := "0000000100000000";
signal mux_in4 : std_logic_vector (15 downto 0) := "0001000000000000";
signal clk : std_logic := '0'; 
signal sel : std_logic_vector (1 downto 0) := "XX";  
signal rst : std_logic := '0';
signal mux_out : std_logic_vector (15 downto 0);

constant CLK_PERIOD : time := 20 ns;

begin  -- TB
--------------------
-- Clock generator
--------------------
clk <= not clk after (CLK_PERIOD/2);

-------------------------------------------
-- Instantiate Unit Under Test
-------------------------------------------
UUT : mux4to1	port map (
	mux_out => mux_out,
	mux_in1 => mux_in1,
	mux_in2 => mux_in2,
	mux_in3 => mux_in3,
	mux_in4 => mux_in4,
	clk => clk,
	sel => sel,
	rst => rst);

STIMULUS : process
		
begin  -- process STIMULUS
	wait for (CLK_PERIOD);
	rst <= '1';
	wait for (CLK_PERIOD);
	rst <= '0';
	wait for (2*CLK_PERIOD);
	SEL <= "00";
	wait for (2*CLK_PERIOD);
	SEL <= "01";
	wait for (2*CLK_PERIOD);
	SEL <= "10";
	wait for (2*CLK_PERIOD);
	SEL <= "11";
	wait for (2*CLK_PERIOD);
	SEL <= "00";
	wait for (2*CLK_PERIOD);
	SEL <= "01";
	wait for (2*CLK_PERIOD);
	SEL <= "10";
	wait for (2*CLK_PERIOD);
	SEL <= "11";
	wait for (2*CLK_PERIOD);
	
end process STIMULUS;
end TB;
