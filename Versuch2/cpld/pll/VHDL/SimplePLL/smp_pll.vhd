--**************************************
--* VHDL source constraint example
--* Simple PLL configuration
--* Lattice Semiconductor Corporation 
--**************************************
--
-- The following steps are required to use PLL functions in VHDL.
-- Step 1. Lattice library declaration
-- Step 2. Parameter passing through attributes for the fitter (required by Mentor)
-- Step 3. PLL hardcore instantiation
-- Step 4. Use of PLL outputs



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Step 1: Library declaration 
LIBRARY lc5kmx;
USE lc5kmx.components.all;

entity simplepll is
port (clk 	: in std_logic;
      rst	: in std_logic;
      qout	: out std_logic_vector(3 downto 0));
end simplepll;

architecture behave of simplepll is

-- Step 2: PLL parameter declaration
--	   In SPLL, the following parameter is used.
attribute in_freq : string;
attribute in_freq of I1      : label is "100.0000";

signal count  : std_logic_vector(3 downto 0);
signal pllclk : std_logic;

begin

-- Step 3: PLL instantiation
I1: spll
generic map( in_freq => "100.0000")
port map(clk_in   => clk, 	-- PLL input clock connection
         clk_out => pllclk);	-- PLL output clock connection


process(pllclk, rst)
begin
    if (rst = '0') then
	count <= "0000";
-- Step 4: Use of PLL output clock
    elsif (pllclk'event and pllclk = '1') then
	count <= count + "0001" ;
    end if;
end process;

qout <= count;

end behave;


