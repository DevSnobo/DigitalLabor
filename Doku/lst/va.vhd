library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity VA_ent is
  port ( ai, bi, ci : in std_logic;
         sumi, cout : out std_logic);

end;

architecture VA_arch of VA_ent is
  signal N1, N2, N3 : std_logic;


component halbadd_ent
  port (B, A : in std_logic;
        S, C : out std_logic);
end component;

component ODER2_ent
  port (a, b : in std_logic;
        y    : out std_logic);
end component;


begin
  I1 : ODER2_ent
    Port Map ( a=>N2, b=>N3, y=>cout );
  I2 : halbadd_ent
    Port Map ( B => bi, A=>ai, S=>N1, C=>N2 );
  I3 : halbadd_ent
    Port Map ( B => ci, A=>N1, S=> sumi, C=>N3 );
end;




