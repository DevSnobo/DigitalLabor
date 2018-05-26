--**************************************
--* VHDL source constraint example
--* Simple PLL configuration
--* Lattice Semiconductor Corporation 
--**************************************
--
-- The following steps are required to use PLL functions in VHDL.
-- Step 1. Lattice library declaration
-- Step 2. PLL component declaration with generics (for simulation and Synplify synthesis) 
-- Step 3. Parameter passing through attributes for the fitter (required by Exemplar)
-- Step 4. PLL hardcore instantiation
-- Step 5. Use of PLL outputs



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--library synplify;
--use synplify.attributes.all;

--Step 1: Library declaration 
library lava1;
use lava1.components.all;

entity simplepll is
port (clk 	: in std_logic;
      rst	: in std_logic;
      qout	: out std_logic_vector(3 downto 0));
end simplepll;

architecture behave of simplepll is

--Step 2: PLL component declaration. 
--	  SPLL is a hard-coded PLL component.
component spll

          generic ( in_freq : string);

          port (    clk_in   : in std_logic;
                    clk_out : out std_logic); 
end component;

-- Step 3: PLL parameter declaration
--	   In SPLL, the following parameter is used.
attribute in_freq : string;
attribute in_freq of I1      : label is "160.0000";

signal count  : std_logic_vector(3 downto 0);
signal pllclk : std_logic;

begin

-- Step 4: PLL instantiation
I1: spll
generic map( in_freq => "160.0000")
port map(clk_in   => clk, 	-- PLL input clock connection
         clk_out => pllclk);	-- PLL output clock connection


process(pllclk, rst)
begin
    if (rst = '0') then
	count <= "0000";
-- Step 5: Use of PLL output clock
    elsif (pllclk'event and pllclk = '1') then
	count <= count + "0001" ;
    end if;
end process;

qout <= count;

end behave;


