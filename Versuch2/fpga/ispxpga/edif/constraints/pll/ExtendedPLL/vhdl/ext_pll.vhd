--**************************************
--* VHDL source constraint example
--* Extended PLL configuration
--* Lattice Semiconductor Corporation 
--**************************************
--
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

entity extendedpll is
port (clk 	: in std_logic;
      rst	: in std_logic;
      clken	: in std_logic;
      pllfbk	: in std_logic;  -- PLL extended feed back input
      pllrst	: in std_logic;  -- PLL extended reset input
      qa	: out std_logic_vector(3 downto 0);
      qb	: out std_logic_vector(3 downto 0));
end extendedpll;

architecture behave of extendedpll is

--Step 2: PLL component declaration. 
--	  STDPLLX is a hard-coded PLL component.
component stdpllx
          generic( in_freq : string;
                   mult    : string;
                   div     : string;
                   post    : string;
                   pll_dly : string;
                   secdiv  : string);
          port  ( clk_in   : in  std_logic;
                  pll_fbk  : in std_logic;
                  PLL_RST  : in std_logic;
                  pll_lock : out std_logic;
                  sec_out  : out std_logic;
                  clk_out  : out std_logic); 
end component;


-- Step 3: PLL parameter declaration
--	   In STDPLLX, the following parameters are used.

attribute in_freq 		: string;
attribute mult    		: string;
attribute div     		: string;
attribute post    		: string;
attribute pll_dly  		: string;
attribute secdiv		: string;
attribute clk_out_to_pin 	: string;
attribute pll_fbk_attribute 	: string;
attribute in_freq of i1      	: label is "100.0000";
attribute mult    of i1      	: label is "8";
attribute div     of i1      	: label is "5";
attribute post    of i1      	: label is "2";
attribute pll_dly of i1      	: label is "7";
attribute secdiv  of i1      	: label is "2";
attribute clk_out_to_pin  of i1	: label is "OFF";
attribute pll_fbk_attribute of i1 : label is "CLKTREE";

signal counta  	: std_logic_vector(3 downto 0);
signal countb  	: std_logic_vector(3 downto 0);
signal ppclk 	: std_logic;	-- primary PLL clock out
signal lock	: std_logic;	-- PLL lock out
signal spclk	: std_logic;	-- secondary PLL clock out
signal scken	: std_logic;

begin

-- Step 4: PLL instantiation
I1: STDPLLX
generic map (	in_freq => "100.0000",
            	mult    => "8",
            	div     => "5",
             	post    => "2",
             	pll_dly => "4",
             	secdiv  => "2")
port map (	clk_in    => clk, 	
	        pll_fbk  => pllfbk, 	-- PLL extended feedback
        	pll_rst  => pllrst, 	-- PLL reset 
         	pll_lock => lock, 	
         	clk_out  => ppclk,	
		sec_out  => spclk);	


process(ppclk)
begin
    if (rst = '0') then
        scken   <= '0';
    elsif (ppclk'event and ppclk = '1') then
	scken	<= clken and lock;
    end if;
end process;


process(ppclk, scken, rst)
begin
    if (rst = '0') then
	counta <= "0000";
-- Step 5: Use of PLL primary output clock
    elsif (ppclk'event and ppclk = '1') then
	if scken = '1' then			-- clock enable
	    counta <= counta + "0001" ;
	else
	    counta <= counta;
	end if;
    end if;
end process;


process(spclk, rst)
begin
    if (rst = '0') then
	countb <= "0000";
-- Step 5: Use of PLL secondary output clock
    elsif (spclk'event and spclk = '1') then
	countb <= countb + "0001" ;
    end if;
end process;

qa <= counta;
qb <= countb;

end behave;


