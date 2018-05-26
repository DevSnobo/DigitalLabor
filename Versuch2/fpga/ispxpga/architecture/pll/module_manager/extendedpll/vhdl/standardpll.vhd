library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.components.all;


entity standardpll is
port	(clk_in 	: in std_logic;
		pll_lock		: out std_logic;
		clk_out		: out std_logic);
end standardpll;


architecture behave of standardpll is
component STDPLL


generic(	IN_FREQ		:	string;
		CLK_OUT_TO_PIN	:	string;
		WAKE_ON_LOCK	:	string;
		MULT		:	string;
		DIV			:	string;
		POST		:	string;
		PLL_DLY		:	string);


port(		CLK_IN	:	in	std_logic;
		PLL_LOCK	:	out	std_logic;
		CLK_OUT	:	out	std_logic);


end component;


attribute IN_FREQ		: string;
attribute MULT 		: string;
attribute DIV 		: string;
attribute POST 		: string;
attribute PLL_DLY		: string;
attribute CLK_OUT_TO_PIN 		: string;
attribute WAKE_ON_LOCK 		: string;
attribute IN_FREQ of I1      	: label is "100.000";
attribute MULT of I1      	: label is "8";
attribute DIV of I1      	: label is "5";
attribute POST of I1      	: label is "2";
attribute PLL_DLY of I1      	: label is "0";
attribute CLK_OUT_TO_PIN of I1      	: label is "OFF";
attribute WAKE_ON_LOCK of I1      	: label is "OFF";


begin
I1:	STDPLL
generic map(	IN_FREQ => "100.000",
		MULT => "8",
		DIV => "5",
		POST => "2",
		PLL_DLY => "0",
		CLK_OUT_TO_PIN => "OFF",
		WAKE_ON_LOCK => "OFF")
port map(	CLK_IN => clk_in,
		PLL_LOCK => pll_lock,
		CLK_OUT => clk_out);


end behave;
