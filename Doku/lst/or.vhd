library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ODER2_ent is
  PORT (a, b : IN std_logic;
          y   : OUT std_logic);


end;

architecture ODER2_arch of ODER2_ent is
begin
y <= (a or b);

end ODER2_arch;

