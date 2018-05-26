library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Ampel_sn_e is
		port(v : in std_logic_vector(3 downto 0);
	     	R, G, Y : out std_logic);

end;

architecture Ampel_sn_a of Ampel_sn_e is

begin			
	
	R <= (v(3) or (v(2) and v(1))) or (v(3) and v(2) and v(1));
	Y <= ((not v(3)) and v(2) and (not v(1))) or (v(3) and v(2) and v(1));
	G <= (not v(3)) and (not v(2));
		
end Ampel_sn_a;

