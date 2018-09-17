library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Va2_ent is
  port ( b, a : in std_logic_vector (1 downto 0);
        sum      : out std_logic_vector (2 downto 0));

end;

architecture Va2_arch of Va2_ent is
  signal N1: std_logic;

component VA_ent
  port ( ai, bi, ci : in std_logic;
         sumi, cout : out std_logic);
end component;

begin
  VA0 : VA_ent
     Port Map ( bi=>b(0), ai=>a(0), ci=>'0',  sumi=>sum(0), cout=>N1 );
  VA1 : VA_ent
     Port Map ( bi=>b(1), ai=>a(1), ci=>N1, sumi=>sum(1), cout=>sum(2) );
end;

