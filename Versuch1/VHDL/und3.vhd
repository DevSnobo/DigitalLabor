library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity UND3_ent is
  PORT (a, b, c : IN std_logic;
	y	: OUT std_logic);

end;

architecture UND3_arch of UND3_ent is
begin
  y <= (a AND b AND c);
end UND3_arch;

