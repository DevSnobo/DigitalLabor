library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity halfadd_ent is
port(x, y: IN std_logic;
	c, s: OUT std_logic);
end;

architecture halfadd_arch of halfadd_ent is
begin

with std_logic_vector'(x, y) select
c <= '1' when "11",
'0' when others;

with std_logic_vector'(x, y) select
s <= '1' when "01",
'1' when "10",
'0' when others;


end halfadd_arch;

