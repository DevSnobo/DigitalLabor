library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity gelb_blinken_e is
	PORT(q: in std_logic_vector(3 downto 0);
		bR, bG, bY : out std_logic);

end;

architecture gelb_blinken_a of gelb_blinken_e is
begin

	bR <= '0';
	bY <= not q(1);
	bG <= '0';

end gelb_blinken_a;

