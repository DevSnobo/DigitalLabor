--**************************************
--* VHDL source constraint example
--* 	Pin Assignment for PLCC/QFP Pkg.
--*	2/01/2001 K.Lee
--* Lattice Applications Engineering
--**************************************

--Target device = ispLSI5256VE-16LT128
--For BGA type syntax, see pinassgnBGA.syn

library ieee;
use ieee.std_logic_1164.all;

entity pinassg is
port (		in5	:in std_logic;
		in8	:in std_logic;
		in10	:in std_logic;
		o	:out std_logic_vector (13 downto 11));

--The syntax of attribute LOC
--attribute LOC : string;
--attribute LOC of [SigName] : signal is "P[pin#]";

attribute LOC : string;
attribute LOC of in5  	: signal is "P5";
attribute LOC of in8 	: signal is "P8";
attribute LOC of in10 	: signal is "P10";
attribute LOC of o	: signal is "P13 P12 P11";

end;

architecture behavioral of pinassg is
begin

o(11) <=  in5 and in8;
o(12) <=  in10 and in5;
o(13) <=  in8 and in10;

end behavioral;


