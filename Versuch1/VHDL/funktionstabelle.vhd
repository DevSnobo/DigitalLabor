library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Funktionstabelle_ent is
  PORT (d, c, b, a: in bit;
	y	  : out bit);

end;

architecture Funktionstabelle_arch of Funktionstabelle_ent is
begin
with bit_vector'(d, c, b, a) select
	y <= 	'1' when "0000",
		'1' when "0101",
		'1' when "0110",
		'1' when "0001",
		'1' when "1010",
		'1' when "1111",
		'0' when others,

end Funktionstabelle_arch;

