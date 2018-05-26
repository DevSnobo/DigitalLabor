library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_test_ramdps16kwx2rx2 is
end tb_test_ramdps16kwx2rx2;

architecture simulate of tb_test_ramdps16kwx2rx2 is

component test_ramdps16kwx2rx2

    port (
           Data         : in std_logic_vector(1 downto 0);
           WrAddress      : in  std_logic_vector(13 downto 0);
           RdAddress      : in  std_logic_vector(13 downto 0);
           WrClock        : in  std_logic;
           WrClockEn      : in  std_logic;
           RdClock        : in  std_logic;
           RdClockEn      : in  std_logic;
           WE           : in  std_logic;
           Reset        : in  std_logic;
           Q            : out std_logic_vector(1 downto 0));
end component;

signal Reset, WE, WrClockEN, WrClock, RdClockEN, RdClock: std_logic;
signal WrAddress, RdAddress  : std_logic_vector(13 downto 0);
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

UUT: test_ramdps16kwx2rx2
    PORT MAP(
                      Data          => Data,
                      WrAddress     => WrAddress,
                      RdAddress     => RdAddress,
                      WrClock       => WrClock,
                      WrClockEn     => WrClockEn,
                      RdClock       => RdClock,
                      RdClockEn     => RdClockEn,
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
        WrClockEN  <= bb(L(5)) ;
        WrClock    <= bb(L(7)) ;

        WrAddress(13)  <= bb(L(9)) ;
        WrAddress(12)  <= bb(L(10)) ;
        WrAddress(11)  <= bb(L(11)) ;
        WrAddress(10)  <= bb(L(12)) ;
        WrAddress(9)  <= bb(L(13)) ;
        WrAddress(8)  <= bb(L(14)) ;
        WrAddress(7)  <= bb(L(15)) ;
        WrAddress(6)  <= bb(L(16)) ;
        WrAddress(5)  <= bb(L(17)) ;
        WrAddress(4)  <= bb(L(18)) ;
        WrAddress(3)  <= bb(L(19)) ;
        WrAddress(2)  <= bb(L(20)) ;
        WrAddress(1)  <= bb(L(21)) ;
        WrAddress(0)  <= bb(L(22)) ;

        Data(1)    <= bb(L(24)) ;
        Data(0)    <= bb(L(25)) ;

        RdClockEN <= bb(L(27)) ;
        RdClock <= bb(L(29)) ;

        RdAddress(13)  <= bb(L(31)) ;
        RdAddress(12)  <= bb(L(32)) ;
        RdAddress(11)  <= bb(L(33)) ;
        RdAddress(10)  <= bb(L(34)) ;
        RdAddress(9)  <= bb(L(35)) ;
        RdAddress(8)  <= bb(L(36)) ;
        RdAddress(7)  <= bb(L(37)) ;
        RdAddress(6)  <= bb(L(38)) ;
        RdAddress(5)  <= bb(L(39)) ;
        RdAddress(4)  <= bb(L(40)) ;
        RdAddress(3)  <= bb(L(41)) ;
        RdAddress(2)  <= bb(L(42)) ;
        RdAddress(1)  <= bb(L(43)) ;
        RdAddress(0)  <= bb(L(44)) ;

      wait for 100 ns;
      write( L1, Q(1));
      write( L1, Q(0));

end loop;
          assert false report "*** Test Finished ***" severity note;
    wait;
end process test;

end simulate;

configuration cfg_tb of tb_test_ramdps16kwx2rx2 is
  for simulate
  end for;
end cfg_tb;

