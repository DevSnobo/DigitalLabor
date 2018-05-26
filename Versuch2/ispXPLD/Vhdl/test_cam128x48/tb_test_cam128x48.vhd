library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_test_cam128x48 is

end tb_test_cam128x48;

architecture simulate of  tb_test_cam128x48  is

component test_cam128x48
  port (
           Data          : in  std_logic_vector(47 downto 0);
           WrAddress     : in  std_logic_vector(6 downto 0);
           ClockEn       : in  std_logic;
           Clock         : in  std_logic;
           WE            : in  std_logic;
           EnMask        : in  std_logic;
           WrMask        : in  std_logic;
           WrDC          : in  std_logic;
           Reset         : in  std_logic;
           Address       : out std_logic_vector(6 downto 0);
           Match         : Out std_logic;
           MulMatch      : Out std_logic);
end component;

signal Reset, We, EnMask, WrMask, WrDc, ClockEn, Clock: std_logic;
signal Data :std_logic_vector (47 downto 0);
signal Match, MulMatch : std_logic;
signal Address, WrAddress  : std_logic_vector (6 downto 0);
file vectorin : text is in "test.in";
file out_file : text is out "test_out";

function bb(LL : in character) return std_logic is
  begin
    if LL='1' then
        return '1';
    elsif LL='X' then
	return 'X';
    elsif LL='Z' then
        return 'Z';
    elsif LL='U' then
        return 'U';
    else
        return '0';
    end if;
end bb;

begin

UUT: test_cam128x48
     PORT MAP(
                      Data        => Data,
                      WrAddress   => WrAddress,
                      ClockEn     => ClockEn,
                      Clock       => Clock,
                      WE          => We,
                      Reset       => Reset,
                      EnMask      => EnMask,
                      WrMask      => WrMask,
                      WrDC        => WrDC,
                      Address     => Address,
                      Match       => Match,
                      MulMatch    => MulMatch );
test : process
variable L : line;
variable L1 : line; 
begin
while not endfile(vectorin) loop

     readline(vectorin,L);
      Reset   <= bb(L(1)) ;
      We      <= bb(L(3)) ;
      ClockEN <= bb(L(5)) ;
      Clock   <= bb(L(7)) ;
      ENMask  <= bb(L(9)) ;
      WrMask  <= bb(L(11)) ;
      WrDc    <= bb(L(13)) ;
      WrAddress(6)  <= bb(L(15)) ;
      WrAddress(5)  <= bb(L(16)) ;
      WrAddress(4)  <= bb(L(17)) ;
      WrAddress(3)  <= bb(L(18)) ;
      WrAddress(2)  <= bb(L(19)) ;
      WrAddress(1)  <= bb(L(20)) ;
      WrAddress(0)  <= bb(L(21)) ;

      Data(47)    <= bb(L(23));
      Data(46)    <= bb(L(24));
      Data(45)    <= bb(L(25));
      Data(44)    <= bb(L(26));
      Data(43)    <= bb(L(27));
      Data(42)    <= bb(L(28));
      Data(41)    <= bb(L(29));
      Data(40)    <= bb(L(30));
      Data(39)    <= bb(L(31));
      Data(38)    <= bb(L(32));
      Data(37)    <= bb(L(33));
      Data(36)    <= bb(L(34));
      Data(35)    <= bb(L(35));
      Data(34)    <= bb(L(36));
      Data(33)    <= bb(L(37));
      Data(32)    <= bb(L(38));
      Data(31)    <= bb(L(39));
      Data(30)    <= bb(L(40));
      Data(29)    <= bb(L(41));
      Data(28)    <= bb(L(42));
      Data(27)    <= bb(L(43));
      Data(26)    <= bb(L(44));
      Data(25)    <= bb(L(45));
      Data(24)    <= bb(L(46));
      Data(23)    <= bb(L(47));
      Data(22)    <= bb(L(48));
      Data(21)    <= bb(L(49));
      Data(20)    <= bb(L(50));
      Data(19)    <= bb(L(51));
      Data(18)    <= bb(L(52));
      Data(17)    <= bb(L(53));
      Data(16)    <= bb(L(54));
      Data(15)    <= bb(L(55));
      Data(14)    <= bb(L(56));
      Data(13)    <= bb(L(57));
      Data(12)    <= bb(L(58));
      Data(11)    <= bb(L(59));
      Data(10)    <= bb(L(60));
      Data(9)    <= bb(L(61));
      Data(8)    <= bb(L(62));
      Data(7)    <= bb(L(63));
      Data(6)    <= bb(L(64));
      Data(5)    <= bb(L(65));
      Data(4)    <= bb(L(66));
      Data(3)    <= bb(L(67));
      Data(2)    <= bb(L(68));
      Data(1)    <= bb(L(69));
      Data(0)    <= bb(L(70));

     wait for 100 ns;
     write( L1, Address(6));
     write( L1, Address(5));
     write( L1, Address(4));
     write( L1, Address(3));
     write( L1, Address(2));
     write( L1, Address(1));
     write( L1, Address(0), right, 2);
     write( L1, Match);
     write( L1, MulMatch);

     writeline(out_file,L1);

end loop;
          assert false report "*** Test Finished ***" severity note;
    wait;
end process test;

end simulate;

configuration cfg_tb of tb_test_cam128x48 is
  for simulate
  end for;
end cfg_tb;
