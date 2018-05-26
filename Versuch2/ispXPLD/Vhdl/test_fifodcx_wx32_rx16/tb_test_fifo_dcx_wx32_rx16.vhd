library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity tb_test_fifo_dcx_wx32_rx16 is
end    tb_test_fifo_dcx_wx32_rx16;

architecture simulate of tb_test_fifo_dcx_wx32_rx16 is

component test_fifo_dcx_wx32_rx16

    port (
           Reset        : in std_logic;
           RPReset      : in std_logic;
           WrClock      : in std_logic;
           WrEn         : in std_logic;
           RdClock      : in std_logic;
           RdEn         : in std_logic;
           Data         : in std_logic_vector(31 downto 0);
           Q            : out std_logic_vector(15 downto 0);
           Full         : Out std_logic;
           Empty        : Out std_logic;
           AlmostFull   : Out std_logic;
           AlmostEmpty  : Out std_logic);
end component ;

signal Reset, RPReset, WrEN, WrClock, RdEN, RdClock: std_logic;
signal Data :std_logic_vector (31 downto 0);
signal Q :std_logic_vector (15 downto 0);
signal FULL, AlmostFull, EMPTY, AlmostEmpty : std_logic;

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

UUT: test_fifo_dcx_wx32_rx16
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
	AlmostEmpty => AlmostEmpty
	);

test : process
variable L : line;
variable L1 : line; 
begin
while not endfile(vectorin) loop

     readline(vectorin,L);
     	Reset <= bb(L(1)) ;
     	RPReset <= bb(L(2)) ;
     	WrEN <= bb(L(4)) ;
     	WrClock <= bb(L(5)) ;
     	RdEN <= bb(L(7)) ;
     	RdClock <= bb(L(8)) ;
     	Data(31) <= bb(L(10)) ;
     	Data(30) <= bb(L(11)) ;
     	Data(29) <= bb(L(12)) ;
     	Data(28) <= bb(L(13)) ;
     	Data(27) <= bb(L(14)) ;
     	Data(26) <= bb(L(15)) ;
     	Data(25) <= bb(L(16)) ;
     	Data(24) <= bb(L(17)) ;
     	Data(23) <= bb(L(18)) ;
     	Data(22) <= bb(L(19)) ;
     	Data(21) <= bb(L(20)) ;
     	Data(20) <= bb(L(21)) ;
     	Data(19) <= bb(L(22)) ;
     	Data(18) <= bb(L(23)) ;
     	Data(17) <= bb(L(24)) ;
     	Data(16) <= bb(L(25)) ;
     	Data(15) <= bb(L(26)) ;
     	Data(14) <= bb(L(27)) ;
     	Data(13) <= bb(L(28)) ;
     	Data(12) <= bb(L(29)) ;
     	Data(11) <= bb(L(30)) ;
     	Data(10) <= bb(L(31)) ;
     	Data(9) <= bb(L(32)) ;
     	Data(8) <= bb(L(33)) ;
     	Data(7) <= bb(L(34)) ;
     	Data(6) <= bb(L(35)) ;
     	Data(5) <= bb(L(36)) ;
     	Data(4) <= bb(L(37)) ;
     	Data(3) <= bb(L(38)) ;
     	Data(2) <= bb(L(39)) ;
     	Data(1) <= bb(L(40)) ;
     	Data(0) <= bb(L(41)) ;
     wait for 100 ns;

     write( L1, Q(15));
     write( L1, Q(14));
     write( L1, Q(13));
     write( L1, Q(12));
     write( L1, Q(11));
     write( L1, Q(10));
     write( L1, Q(9));
     write( L1, Q(8));
     write( L1, Q(7));
     write( L1, Q(6));
     write( L1, Q(5));
     write( L1, Q(4));
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

configuration cfg_tb of tb_test_fifo_dcx_wx32_rx16 is
  for simulate
  end for;
end cfg_tb;

