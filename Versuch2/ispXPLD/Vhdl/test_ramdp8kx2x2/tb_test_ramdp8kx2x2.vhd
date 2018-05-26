library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_test_ramdp8kx2x2 is
end tb_test_ramdp8kx2x2;

architecture simulate of tb_test_ramdp8kx2x2 is

component test_ramdp8kx2x2

    port (
           DataInA       : in std_logic_vector(1 downto 0);
           AddressA      : in  std_logic_vector(12 downto 0);
           DataInB       : in std_logic_vector(1 downto 0);
           AddressB      : in  std_logic_vector(12 downto 0);
           ClockA        : in  std_logic;
           ClockEnA      : in  std_logic;
           ClockB        : in  std_logic;
           ClockEnB      : in  std_logic;
           WrA           : in  std_logic;
           WrB           : in  std_logic;
           ResetA        : in  std_logic;
           ResetB        : in  std_logic;
           QA            : out std_logic_vector(1 downto 0);
           QB            : out std_logic_vector(1 downto 0));
end component;

signal ResetA, ResetB, WrA, WrB, ClockEnA, ClockA, ClockEnB, ClockB: std_logic;
signal AddressA, AddressB  : std_logic_vector(12 downto 0);
signal DataInA, DataInB, QA, QB :std_logic_vector (1 downto 0);

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

UUT: test_ramdp8kx2x2
    PORT MAP(
                      DataInA       => DataInA,
                      AddressA      => AddressA,
                      DataInB       => DataInB,
                      AddressB      => AddressB,
                      ClockA        => ClockA,
                      ClockEnA      => ClockEnA,
                      ClockB        => ClockB,
                      ClockEnB      => ClockEnB,
                      WrA           => WrA,
                      WrB           => WrB,
                      ResetA        => ResetA,
                      ResetB        => ResetB,
                      QA            => QA,
                      QB            => QB);

test : process
variable L : line;
variable L1 : line;
begin
while not endfile(vectorin) loop

     readline(vectorin,L);
        ResetA    <= bb(L(1)) ;
        WrA       <= bb(L(3)) ;
        ClockENA  <= bb(L(5)) ;
        ClockA    <= bb(L(7)) ;

        AddressA(12)  <= bb(L(9)) ;
        AddressA(11)  <= bb(L(10)) ;
        AddressA(10)  <= bb(L(11)) ;
        AddressA(9)  <= bb(L(12)) ;
        AddressA(8)  <= bb(L(13)) ;
        AddressA(7)  <= bb(L(14)) ;
        AddressA(6)  <= bb(L(15)) ;
        AddressA(5)  <= bb(L(16)) ;
        AddressA(4)  <= bb(L(17)) ;
        AddressA(3)  <= bb(L(18)) ;
        AddressA(2)  <= bb(L(19)) ;
        AddressA(1)  <= bb(L(20)) ;
        AddressA(0)  <= bb(L(21)) ;

        DataInA(1)    <= bb(L(23)) ;
        DataInA(0)    <= bb(L(24)) ;

        ResetB   <= bb(L(26)) ;
        WrB      <= bb(L(28)) ;
        ClockEnB <= bb(L(30)) ;
        ClockB   <= bb(L(32)) ;

        AddressB(12)  <= bb(L(34)) ;
        AddressB(11)  <= bb(L(35)) ;
        AddressB(10)  <= bb(L(36)) ;
        AddressB(9)  <= bb(L(37)) ;
        AddressB(8)  <= bb(L(38)) ;
        AddressB(7)  <= bb(L(39)) ;
        AddressB(6)  <= bb(L(40)) ;
        AddressB(5)  <= bb(L(41)) ;
        AddressB(4)  <= bb(L(42)) ;
        AddressB(3)  <= bb(L(43)) ;
        AddressB(2)  <= bb(L(44)) ;
        AddressB(1)  <= bb(L(45)) ;
        AddressB(0)  <= bb(L(46)) ;

        DataInB(1)    <= bb(L(48)) ;
        DataInB(0)    <= bb(L(49)) ;

      wait for 100 ns;
      write( L1, QA(1));
      write( L1, QA(0));
      write( L1, QB(1), right, 2);
      write( L1, QB(0));

     writeline(out_file,L1);


end loop;
          assert false report "*** Test Finished ***" severity note;
    wait;
end process test;

end simulate;

configuration cfg_tb of tb_test_ramdp8kx2x2 is
  for simulate
  end for;
end cfg_tb;

