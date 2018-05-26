entity cntbuftb is 
end;

library ieee;
use ieee.std_logic_1164.all;

architecture behavior of cntbuftb is

	constant cycle : time := 20 ns;

	type count_record_t	is record
		Clr, OE : std_logic;
		Q : std_logic_vector(3 downto 0);
	end record;
	type count_array_t is array (positive range <>) of count_record_t;

	type buffer_record_t	is record
		A, B : std_logic_vector(0 to 1);
		Dir : std_logic;
		A_pin, B_pin : std_logic_vector(0 to 1);
	end record;
	type buffer_array_t is array (positive range <>) of buffer_record_t;

	constant count_patterns : count_array_t := (
		(Clr => '1', OE => '0', Q => "0000"),
		(Clr => '0', OE => '0', Q => "0001"),
		(Clr => '0', OE => '0', Q => "0010"),
		(Clr => '0', OE => '0', Q => "0011"),
		(Clr => '0', OE => '1', Q => "ZZZZ"),
		(Clr => '0', OE => '0', Q => "0101"),
		(Clr => '0', OE => '0', Q => "0110"),
		(Clr => '0', OE => '0', Q => "0111"),
		(Clr => '0', OE => '0', Q => "1000"),
		(Clr => '0', OE => '0', Q => "1001"),
		(Clr => '0', OE => '0', Q => "1010"),
		(Clr => '0', OE => '0', Q => "1011"),
		(Clr => '0', OE => '0', Q => "1100"),
		(Clr => '0', OE => '0', Q => "1101"),
		(Clr => '0', OE => '0', Q => "1110"),
		(Clr => '0', OE => '0', Q => "1111"),
		(Clr => '0', OE => '0', Q => "0000"),
		(Clr => '0', OE => '0', Q => "0001"),
		(Clr => '0', OE => '0', Q => "0010"),
		(Clr => '0', OE => '0', Q => "0011"),
		(Clr => '1', OE => '0', Q => "0000"),
		(Clr => '1', OE => '0', Q => "0000"));

	constant buffer_patterns : buffer_array_t := (
		(A=> "XX", B=> "XX", Dir=> '0', A_pin=> "XX", B_pin=> "XX"),
		(A=> "XX", B=> "XX", Dir=> '1', A_pin=> "XX", B_pin=> "XX"),
		(A=> "00", B=> "WW", Dir=> '0', A_pin=> "00", B_pin=> "00"),
		(A=> "01", B=> "WW", Dir=> '0', A_pin=> "01", B_pin=> "01"),
		(A=> "10", B=> "WW", Dir=> '0', A_pin=> "10", B_pin=> "10"),
		(A=> "11", B=> "WW", Dir=> '0', A_pin=> "11", B_pin=> "11"),
		(A=> "WW", B=> "00", Dir=> '1', A_pin=> "00", B_pin=> "00"),
		(A=> "WW", B=> "01", Dir=> '1', A_pin=> "01", B_pin=> "01"),
		(A=> "WW", B=> "10", Dir=> '1', A_pin=> "10", B_pin=> "10"),
		(A=> "WW", B=> "11", Dir=> '1', A_pin=> "11", B_pin=> "11"));

	component cntbuf
		port (Dir : in std_logic;
			  A, B : inout std_logic_vector(0 to 1);
			  Clk, Clr, OE : in std_logic;
			  Q : inout std_logic_vector(3 downto 0));
	end component;

	signal Clock : std_logic := '0';
	signal Clear, Enable : std_logic;
	signal Q_out : std_logic_vector(3 downto 0);

	signal Direction : std_logic;
	signal A_line, B_line : std_logic_vector(0 to 1);

begin
	uut: cntbuf
		port map (Dir =>Direction, A => A_line, B => B_line,
		  		  Clk =>Clock, Clr => Clear, OE => Enable,
				  Q => Q_out); 
	test_counter: process
		variable trouble : boolean := false;
	begin
		for i in count_patterns'range loop

			Clear <= count_patterns(i).Clr;
			Enable <= count_patterns(i).OE;

			-- Equal with clock.
			wait for cycle;
			Clock <= '1';
			wait for cycle;
			Clock <= '0';

			if (count_patterns(i).Q /= Q_out) then
				assert false report "Test of counter failed." severity NOTE;
				trouble := true;
			end if;
		end loop;
		assert trouble
			report "Test of counter passed."
			severity NOTE;
		wait;
	end process;

	test_buffer: process
		variable trouble : boolean := false;
	begin
		for i in buffer_patterns'range loop
			Direction <= buffer_patterns(i).Dir;
			A_line <= buffer_patterns(i).A; 
			B_line <= buffer_patterns(i).B;
			wait for cycle;
			if ((A_line /= buffer_patterns(i).A_pin) or
				(B_line /= buffer_patterns(i).B_pin)) then
				assert false
					report "Test of bi-directional buffer failed."
					severity NOTE;
					trouble := true;
			end if;
		end loop;
		assert trouble
			report "Test of bi-directional buffer passed."
			severity NOTE;
		wait;
	end process;
end;
