library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity or2_ent is
PORT(a, b: IN std_logic ;
	y: OUT std_logic);

end;

architecture or2_arch of or2_ent is
begin

	y <= (a or b);

end or2_arch;

