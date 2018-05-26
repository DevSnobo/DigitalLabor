--------------------------------------
-- 2/25/99 designed
-- (C) Copyright Lattice 1999 - 2001
--------------------------------------
-- This is top level module for design.
-- It contains the logic for latching 
-- compare data and instantiates other 
-- modules
--------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity TOP_SCHEMATIC is
	port (CLK : in std_logic;
		  RST : in std_logic;
		  SEL : in std_logic;
		  DAT : in std_logic_vector (3 downto 0);
		  COMPDAT : in std_logic_vector (3 downto 0);
		  GT_O : out std_logic;
		  LT_O : out std_logic;
		  EQ_O : out std_logic);
end TOP_SCHEMATIC;

architecture IMP_TOP_SCHEMATIC of TOP_SCHEMATIC is

	component COMP_LT
	   port (O1 : out std_logic;
			IN0 : in std_logic_vector (3 downto 0);
			IN1 : in std_logic_vector (3 downto 0));
	end component;
		  
	component COMP_GT
		port (O1 : out std_logic;
			  IN0 : in std_logic_vector (3 downto 0);
			  IN1 : in std_logic_vector (3 downto 0));
	end component;

	component COMP_EQ 
	  port (O1 : out std_logic;
		  IN0 : in std_logic_vector (3 downto 0);
		  IN1 : in std_logic_vector (3 downto 0));
	end component;
	
	signal CR : std_logic_vector (3 downto 0);
	signal W_CR :  std_logic_vector (3 downto 0);

begin  -- IMP_TOP_SCHEMATIC
	-------------------------------------------
	-- Instantiate lower level modules
	-------------------------------------------
	GT_1: COMP_GT port map(
		O1 => GT_O,
		IN0 => W_CR,
		IN1 => COMPDAT);

	LT_1: COMP_LT port map (
		O1 => LT_O,
		IN0 => W_CR,
		IN1 => COMPDAT);

	EQ_1: COMP_EQ port map (
		O1 => EQ_O,
		IN0 => W_CR,
		IN1 => COMPDAT);

	W_CR <= CR;
	--------------------------------------------
	-- Define logic for loading compare register
	--
	-- The compare register (cr) is only loaded
	-- when sel input is asserted on rising edge
	-- of clk.
	--------------------------------------------
	LOAD_COMP_REG : process (CLK, RST)
	begin  -- process LOAD_COMP_REG
		-- activities triggered by asynchronous reset (active low)
		if RST = '0' then
			CR <= "0000";
			-- activities triggered by rising edge of clock
		elsif CLK'event and CLK = '1' then
			if SEL = '0' then
				CR <= DAT;
			else
				CR <= CR;
			end if;
		end if;
	end process LOAD_COMP_REG;

end IMP_TOP_SCHEMATIC;

		   
