library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplexer_e is

	port ( sel : in std_logic;
		 a : in std_logic_vector (2 downto 0);
		 b : in std_logic_vector (2 downto 0);
		 x : out std_logic_vector (2 downto 0));

end;

architecture multiplexer_a of multiplexer_e is
begin

 x <= a when (sel = '1') else b;

end multiplexer_a;

