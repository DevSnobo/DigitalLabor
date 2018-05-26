library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_test_ramdq16kx2 is
end tb_test_ramdq16kx2;

architecture simulate of tb_test_ramdq16kx2 is

component test_ramdq16kx2

    port (
           Data         : in std_logic_vector(1 downto 0);
           Address      : in  std_logic_vector(13 downto 0);
           Clock        : in  std_logic;
           ClockEn      : in  std_logic;
           WE           : in  std_logic;
           Reset        : in  std_logic;
           Q            : out std_logic_vector(1 downto 0));
end component;

signal WE, Reset, ClockEN, Clock: std_logic;
signal Address  : std_logic_vector(13 downto 0);
signal Data, Q :std_logic_vector (1 downto 0);

file vectorin : text is in "test.in";
file out_file : text is out "test_out";

function bb(LL : in character) return std_logic is
  begin
    if LL='1' then
        return '1';
    elsif LL='X' then
	return 'X';
    else
        return '0';
    end if;
end bb;

begin

UUT: test_ramdq16kx2
    PORT MAP(
                      Data          => Data,
                      Address       => Address,
                      Clock         => Clock,
                      ClockEn       => ClockEn,
                      WE            => WE,
                      Reset         => Reset,
                      Q             => Q);

test : process
variable L : line;
variable L1 : line;
begin
while not endfile(vectorin) loop

     readline(vectorin,L);
        WE          <= bb(L(1)) ;
        Reset       <= bb(L(3)) ;
        ClockEN  <= bb(L(5)) ;
        Clock    <= bb(L(7)) ;

        Address(13)  <= bb(L(9)) ;
        Address(12)  <= bb(L(10)) ;
        Address(11)  <= bb(L(11)) ;
        Address(10)  <= bb(L(12)) ;
        Address(9)  <= bb(L(13)) ;
        Address(8)  <= bb(L(14)) ;
        Address(7)  <= bb(L(15)) ;
        Address(6)  <= bb(L(16)) ;
        Address(5)  <= bb(L(17)) ;
        Address(4)  <= bb(L(18)) ;
        Address(3)  <= bb(L(19)) ;
        Address(2)  <= bb(L(20)) ;
        Address(1)  <= bb(L(21)) ;
        Address(0)  <= bb(L(22)) ;

        Data(1)    <= bb(L(24)) ;
        Data(0)    <= bb(L(25)) ;

      wait for 100 ns;
      write( L1, Q(1));
      write( L1, Q(0));

end loop;
          assert false report "*** Test Finished ***" severity note;
    wait;
end process test;

end simulate;

configuration cfg_tb of tb_test_ramdq16kx2 is
  for simulate
  end for;
end cfg_tb;

