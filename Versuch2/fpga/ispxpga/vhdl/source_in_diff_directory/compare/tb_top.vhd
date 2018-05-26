--------------------------------------
-- Jan DeHoop
-- Vantis FAE
-- 2/25/99
-- (C) Copyright Vantis 1999
--------------------------------------
--
-- This is test bench for top-module
-- If it is always the same name then script
-- for MTI is simple to handle
--------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity TB_TOP is
end TB_TOP;

-- purpose: STIMULUS for testing comparitor
architecture TB of TB_TOP is

	component TOP_SCHEMATIC
	port (CLK : in std_logic;
		  RST : in std_logic;
		  SEL : in std_logic;
		  DAT : in std_logic_vector (3 downto 0);
		  COMPDAT : in std_logic_vector (3 downto 0);
		  GT_O : out std_logic;
		  LT_O : out std_logic;
		  EQ_O : out std_logic);
	end component;


signal CLK : std_logic := '0';			-- Primary Clock
signal RST : std_logic := '0';  		-- RESET
signal SEL : std_logic := '1';  		-- Select to load compare register
signal DAT : std_logic_vector (3 downto 0) := "0000";  
signal COMPDAT : std_logic_vector (3 downto 0 ) := "0000";
														
signal GT_O : std_logic;  				-- Asserted when COMPDAT >
signal LT_O : std_logic;  				-- Asserted when COMPDAT <
signal EQ_O : std_logic;  				-- Asserted when COMPDAT =

constant CLK_PERIOD : time := 20 ns;

begin  -- TB
--------------------
-- Clock generator
--------------------
CLK <= not CLK after (CLK_PERIOD/2);

-------------------------------------------
-- Instantiate Unit Under Test
-------------------------------------------
UUT : TOP_SCHEMATIC	port map (
	CLK => CLK,
	RST => RST,
	SEL => SEL,
	DAT => DAT,
	COMPDAT => COMPDAT,
	GT_O => GT_O,
	LT_O => LT_O,
	EQ_O => EQ_O);

STIMULUS : process
		
begin  -- process STIMULUS
	wait for (5 * CLK_PERIOD);
	------------------------------
	-- Remove Reset condition
	------------------------------
	RST <= '1';
	wait for (5 * CLK_PERIOD);
	-------------------------------------
	-- Expect tGT = 0; tLT = 0; tEQ = 1;
	-------------------------------------
	wait for (CLK_PERIOD);
	---------------------------------------
	-- Load compare register with new data
	---------------------------------------
	wait for (CLK_PERIOD);
	SEL <= '0';
	DAT <= "1010";
	wait for (CLK_PERIOD);
	-------------------------------------
	-- Expect tGT = 1; tLT = 0; tEQ = 0;
	-------------------------------------
	SEL <= '1';
	COMPDAT <= "1010";
	wait for (CLK_PERIOD);
	-------------------------------------
	-- Expect tGT = 0; tLT = 0; tEQ = 1;
	-------------------------------------
	COMPDAT <= "1011";
	wait for (CLK_PERIOD);
	-------------------------------------
	-- Expect tGT = 0; tLT = 1; tEQ = 1;
	-------------------------------------
	wait for (5 * CLK_PERIOD);
	
end process STIMULUS;
end TB;
