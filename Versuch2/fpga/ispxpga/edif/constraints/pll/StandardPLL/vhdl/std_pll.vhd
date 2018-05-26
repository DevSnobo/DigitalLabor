--**************************************
--* VHDL source constraint example
--* Standard PLL configuration
--*
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

--Step 1: Library declaration 
library lava1;
use lava1.components.all;

entity standardpll is
port (clk 	: in std_logic;
      rst	: in std_logic;
      clken	: in std_logic;	
      qa	: out std_logic_vector(3 downto 0));
end standardpll;

architecture behave of standardpll is

--Step 2: PLL component declaration. 
--	  STDPLL is a hard-coded PLL component.
component stdpll
          generic( in_freq : string;
                   mult    : string;
                   div     : string;
                   post    : string;
                   pll_dly : string);

          port ( clk_in     : in  std_logic;
                 pll_lock  : out std_logic;
                 clk_out   : out std_logic); 
end component;


-- Step 3: PLL parameter declaration
--	   In STDPLL, the following parameters are used.

attribute in_freq 		: string;
attribute mult    		: string;
attribute div     		: string;
attribute post    		: string;
attribute pll_dly   		: string;
attribute clk_out_to_pin 	: string;
attribute in_freq of i1      	: label is "100.0000";
attribute mult    of i1      	: label is "8";
attribute div     of i1      	: label is "5";
attribute post    of i1      	: label is "2";
attribute pll_dly   of i1    	: label is "4";
attribute clk_out_to_pin  of i1 : label is "OFF";

signal counta  	: std_logic_vector(3 downto 0);
signal countb  	: std_logic_vector(3 downto 0);
signal pllclk 	: std_logic;	-- PLL clock out
signal lock	: std_logic;	-- PLL lock out
signal scken	: std_logic;

begin

-- Step 4: PLL instantiation
I1: STDPLL
generic map (	in_freq  => "100.0000",
            	mult     => "8",
            	div      => "5",
             	post     => "2",
             	pll_dly  => "4")
port map (	clk_in    => clk, 		-- PLL input clock map
         	pll_lock => lock, 		-- PLL lock map
         	clk_out  => pllclk);		-- PLL clock map


process(pllclk)
begin
    if (pllclk'event and pllclk = '1') then
	scken	<= clken and lock;
    end if;
end process;


process(pllclk, scken, rst)
begin
    if (rst = '0') then
	counta <= "0000";

-- Step 5: Use of PLL output clock
    elsif (pllclk'event and pllclk = '1') then
	if scken = '1' then			-- clock enable
	    counta <= counta + "0001" ;
	else
	    counta <= counta;
	end if;
    end if;
end process;

qa <= counta;

end behave;


