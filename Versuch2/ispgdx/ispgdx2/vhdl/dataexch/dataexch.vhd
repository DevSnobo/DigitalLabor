library ieee;
use ieee.std_logic_1164.all;
entity dataexch is
	port (busAdata, busBdata, busCdata, busDdata : INOUT std_logic_vector (63 downto 0);
      		oe0, oe1  : IN std_logic);

end dataexch;
architecture behave of dataexch is
begin
       busAdata <= busBdata when oe0 = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       busBdata <= busAdata when oe0 = '0' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       busCdata <= busDdata when oe1 = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       busDdata <= busCdata when oe1 = '0' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end behave;
