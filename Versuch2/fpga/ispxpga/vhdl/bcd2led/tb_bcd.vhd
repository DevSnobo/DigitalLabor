
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_BCD is
end tb_BCD;

architecture simulate of tb_BCD is


component BCD2LED
port (  A0, A1, A2, A3 : std_logic;
        A, B, C, D, E, F, G : out std_logic );
end component;

signal A,B,C,D,E,F,G,H: std_logic := '0';
signal A0 : std_logic;
signal A1 : std_logic;
signal A2 : std_logic;
signal A3 : std_logic;
signal OUTT: std_logic_vector(6 downto 0);
signal temp : std_logic_vector(3 downto 0);

file vectorin : text is in "BCD2LED.in";
file out_file : text is out "BCD2LED.out";

function bb(LL : in character) return std_logic is
  begin
    if LL='1' then
        return '1';
    else
        return '0';
    end if;
end bb;

begin
 
UUT: BCD2LED port map (A0,A1,A2,A3,A,B,C,D,E,F,G);


test : process
variable L : line; 
variable L1 : line; 
begin
while not endfile(vectorin) loop

     readline(vectorin,L);
     	A0 <= bb(L(1)) ;
     	A1 <= bb(L(2)) ;
     	A2 <= bb(L(3)) ;
     	A3 <= bb(L(4)) ;

     wait for 99 ns;
        OUTT(0) <= G;
        OUTT(1) <= F;
        OUTT(2) <= E;
        OUTT(3) <= D;
        OUTT(4) <= C;
        OUTT(5) <= B;
        OUTT(6) <= A;
     wait for 1 ns;
     write( L1, OUTT);
     writeline(out_file,L1);

end loop;    
          assert false report "*** Test Finished ***" severity note;
     wait;
end process test;

end simulate;


