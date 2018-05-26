library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity zaehler_e is

	port(intTakt, intReset : in std_logic;
	     q		 : out std_logic_vector(3 downto 0));

end zaehler_e;

architecture zaehler_a of zaehler_e is

	signal tmp: std_logic_vector(3 downto 0);

	begin
	process (intTakt, intReset)

	begin
		if (intReset ='1') then
				tmp <= "0000";
		elsif (intTakt'event and intTakt = '1') then
				tmp <= tmp + 1;
		end if;
	end process;

		q <= tmp;

end zaehler_a;

