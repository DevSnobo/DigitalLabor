--**************************************
--* VHDL source constraint example
--* 	Pin Assignment for BGA Pkg.
--*	       2/01/2001
--* Lattice Semiconductor Corporation 
--**************************************

--Target device = LC4256ZE-5MN144C
--For QFP type syntax, see pinassgnQFP.syn

library ieee;
use ieee.std_logic_1164.all;

entity pinassg is
port (		inA3	:in std_logic;
		inB4	:in std_logic;
		inC5	:in std_logic;
		oF10A2B3	:out std_logic_vector (2 downto 0));

--The syntax of attribute LOC
--attribute LOC : string;
--attribute LOC of [SigName] : signal is "P[pin#]";

attribute LOC : string;
attribute LOC of inA3  	: signal is "PA3";
attribute LOC of inB4 	: signal is "PB4";
attribute LOC of inC5 	: signal is "PC5";
attribute LOC of oF10A2B3: signal is "PF10,PA4,PB3";

end;

architecture behavioral of pinassg is
begin

oF10A2B3(2) <=  inA3 and inB4;
oF10A2B3(1) <=  inC5 and inA3;
oF10A2B3(0) <=  inB4 and inC5;

end behavioral;


