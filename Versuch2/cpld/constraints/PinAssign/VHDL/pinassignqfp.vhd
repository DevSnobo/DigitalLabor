--**************************************
--* VHDL source constraint example
--* 	Pin Assignment for PLCC/QFP Pkg.
--*	     2/01/2001
--* Lattice Semiconductor Corporation 
--**************************************

--Target device = LC4256ZE-5TN100C
--For BGA type syntax, see pinassgnBGA.syn

library ieee;
use ieee.std_logic_1164.all;

entity pinassgqfp is
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
attribute LOC of o	: signal is "P55 P22 P11";

end;

architecture behavioral of pinassgqfp is
begin

o(11) <=  in5 and in8;
o(12) <=  in10 and in5;
o(13) <=  in8 and in10;

end behavioral;


