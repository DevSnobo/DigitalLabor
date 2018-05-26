library ieee;
use ieee.std_logic_1164.all;

entity mux2x1vhd is
	port ( z: out std_logic;
	a, b, s: in std_logic );
end;

architecture mux2x1_arch of mux2x1vhd is
begin
  process (s, a, b)
  begin
    case s is
      when '0' =>
        z <= a;
      when '1' =>
        z <= b;
      when others =>
        z <= 'X';
    end case;
  end process;
end mux2x1_arch;

