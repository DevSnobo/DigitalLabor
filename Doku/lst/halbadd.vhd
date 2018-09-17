library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity halbadd_ent is
  port ( B, A : IN std_logic;
         S, C : OUT std_logic);

end;

architecture halbadd_arch of halbadd_ent is
begin
  with std_logic_vector'(B, A) select
   S <= '1' when "01",
	'1' when "10",
	'0' when others;
   C <= (B and A);
end halbadd_arch;

