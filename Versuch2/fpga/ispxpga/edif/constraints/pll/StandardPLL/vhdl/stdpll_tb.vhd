LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

COMPONENT standardpll
PORT(
	clk : 	IN std_logic;
	rst : 	IN std_logic;
	clken : IN std_logic;          
	qa : 	OUT std_logic_vector(3 downto 0)
	);
END COMPONENT;

	SIGNAL clk 	:  std_logic;
	SIGNAL rst 	:  std_logic;
	SIGNAL clken 	:  std_logic;
	SIGNAL qa 	:  std_logic_vector(3 downto 0);

	CONSTANT clock_low:TIME := 50 ns;
	CONSTANT clock_high:TIME:= 50 ns;


BEGIN

UUT: standardpll
	PORT MAP(
		clk => clk,
		rst => rst,
		clken => clken,
		qa => qa
	);


CK_GEN: PROCESS
BEGIN
	clk <= '0';
	WAIT FOR clock_low;
	clk <= '1';
	WAIT FOR clock_high;
END PROCESS;


TB: PROCESS
BEGIN
	rst 	<= '1';
	clken 	<= '0';
	wait for 200 ns;
	rst 	<= '0';
	wait for 100 ns;
	clken	<= '1';
	wait;

END PROCESS;

END;


