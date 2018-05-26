--**************************************
--* VHDL source constraint example
--* 	Pin Assignment for BGA Pkg.
--*	2/01/2001 K.Lee
--* Lattice Applications Engineering
--**************************************

library ieee;
use ieee.std_logic_1164.all;

entity pinassg is
port (		inA10	:in std_logic;
		inA11	:in std_logic;
		inA6	:in std_logic;
		oF4A9B4	:out std_logic_vector (2 downto 0));

--The syntax of attribute LOC
--attribute LOC : string;
--attribute LOC of [SigName] : signal is "[pin#]";

attribute LOC : string;
attribute LOC of inA10 	: signal is "A10";
attribute LOC of inA11 	: signal is "A11";
attribute LOC of inA6 	: signal is "A6";
attribute LOC of oF4A9B4 : signal is "F4 A9 B4";

end;

architecture behavioral of pinassg is
begin

oF4A9B4(2) <=  inA10 and inA11;
oF4A9B4(1) <=  inA6 and inA10;
oF4A9B4(0) <=  inA11 and inA6;

end behavioral;


