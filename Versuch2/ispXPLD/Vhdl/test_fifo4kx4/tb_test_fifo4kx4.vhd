library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_test_fifo4kx4 is
end tb_test_fifo4kx4;

architecture simulate of tb_test_fifo4kx4 is

component test_fifo4kx4

    port (
           Reset        : in   std_logic;
           RPReset      : in   std_logic;
           WrEN         : in   std_logic;
           WrClock      : in   std_logic;
           RdEN         : in   std_logic;
           RdClock      : in   std_logic;
           Data         : in   std_logic_vector (3 downto 0);
           Q            : out  std_logic_vector (3 downto 0);
           FULL         : out  std_logic;
           Empty        : Out std_logic;
           AlmostFull   : Out std_logic;
           AlmostEmpty  : Out std_logic);
end component;

signal Reset, RPReset, WrEN, WrClock, RdEN, RdClock: std_logic := '0';
signal Data, Q :std_logic_vector (3 downto 0) := "0000";
signal FULL, AlmostFull : std_logic := '0';
signal EMPTY, AlmostEmpty : std_logic := '1';

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

UUT: test_fifo4kx4
    PORT MAP(
	WrEN        => WrEN,
	WrClock     => WrClock,
	RdEN        => RdEN,
	RdClock     => RdClock,
	Reset       => Reset,
	RPReset     => RPReset,
	Data        => Data,

	Q           => Q,
	FULL        => FULL,
	AlmostFull  => AlmostFull,
	EMPTY       => EMPTY,
	AlmostEmpty => AlmostEmpty);

test : process
variable L : line;
variable L1 : line;
begin
while not endfile(vectorin) loop

     readline(vectorin,L);
        Reset    <= bb(L(1)) ;
        RPReset  <= bb(L(2)) ;
        WrEN     <= bb(L(4)) ;
        WrClock  <= bb(L(5)) ;
        RdEN     <= bb(L(7)) ;
        RdClock  <= bb(L(8)) ;
        Data(3)  <= bb(L(10)) ;
        Data(2)  <= bb(L(11)) ;
        Data(1)  <= bb(L(12)) ;
        Data(0)  <= bb(L(13)) ;

      wait for 100 ns;
      write( L1, Q(3));
      write( L1, Q(2));
      write( L1, Q(1));
      write( L1, Q(0), right, 2);
      write( L1, FULL);
      write( L1, AlmostFull);
      write( L1, EMPTY);
      write( L1, AlmostEmpty);

      writeline(out_file,L1);

end loop;
          assert false report "*** Test Finished ***" severity note;
    wait;
end process test;

end simulate;

configuration cfg_tb of tb_test_fifo4kx4 is
  for simulate
  end for;
end cfg_tb;

