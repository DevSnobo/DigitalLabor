library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
port	(top_clk_in 	: in std_logic;
	top_pll_lock	: out std_logic;
	top_clk_out	: out std_logic);
end top;


architecture behave of top is
component standardpll

port(		clk_in	:	in	std_logic;
		pll_lock:	out	std_logic;
		clk_out	:	out	std_logic);
end component;

begin
U1:	standardpll
port map(	clk_in => top_clk_in,
		pll_lock => top_pll_lock,
		clk_out => top_clk_out);

end behave;
