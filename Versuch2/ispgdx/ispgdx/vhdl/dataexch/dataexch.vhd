-- 32-bit Data Exchange from A-bus/C-bus to B-bus/D-bus;
-- dataA0 to dataA31 are A-bus bidirectional signals;
-- dataB0 to dataB31 are B-bus bidirectional signals;
-- dataC0 to dataC31 are C-bus bidirectional signals;
-- dataD0 to dataD31 are D-bus bidirectional signals;
-- oe0 is an enable signal that controls A-bus and B-bus;
-- oe1 is an enable signal that controls C-bus and D-bus;
-- Data goes from A-bus to B-bus if oe0 is low (0);
-- Data goes from B-bus to A-bus if oe0 is high (1);
-- Data goes from C-bus to D-bus if oe1 is low (0);
-- Data goes from D-bus to C-bus if oe1 is high (1);
-- Fitted to ispGDX106A-5Q208

library ieee;
use ieee.std_logic_1164.all;
entity dataexch is
	port (busAdata, busBdata, busCdata, busDdata : INOUT std_logic_vector (31 downto 0);
      		oe0, oe1  : IN std_logic);
	attribute LOC : string;
	attribute LOC of busAdata : signal is "P2,P3,P4,P5,P7,P8,P9,P10,P11,P12,P13,P14,P16,P18,P19,P20,P21,P22,P23,P24,P26,P27,P28,P29,P30,P31,P32,P34,P36,P37,P38,P39";
	attribute PULL : string;
	attribute PULL of busBdata : signal is "UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP,UP";
end dataexch;
architecture behave of dataexch is
begin
       busAdata <= busBdata when oe0 = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       busBdata <= busAdata when oe0 = '0' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       busCdata <= busDdata when oe1 = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
       busDdata <= busCdata when oe1 = '0' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end behave;
