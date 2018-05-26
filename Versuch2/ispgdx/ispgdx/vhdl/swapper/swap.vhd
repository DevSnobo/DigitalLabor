
-- VHDL Test Bench

LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY swap IS
END swap;

ARCHITECTURE behavior OF swap IS 

	COMPONENT swapper
	PORT(
		oe0 : IN std_logic;
		clk0 : IN std_logic;
		lowA : IN std_logic_vector(15 downto 0);
		highA : IN std_logic_vector(15 downto 0);          
		lowB : OUT std_logic_vector(15 downto 0);
		highB : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	SIGNAL oe0 :  std_logic;
	SIGNAL clk0 :  std_logic;
	SIGNAL lowA :  std_logic_vector(15 downto 0);
	SIGNAL highA :  std_logic_vector(15 downto 0);
	SIGNAL lowB :  std_logic_vector(15 downto 0);
	SIGNAL highB :  std_logic_vector(15 downto 0);

BEGIN

	uut: swapper PORT MAP(
		oe0 => oe0,
		clk0 => clk0,
		lowA => lowA,
		highA => highA,
		lowB => lowB,
		highB => highB
	);


-- *** Test Bench - User Defined Section ***

   p_lowA: PROCESS -- stimulus for signal clk
   BEGIN
   lowA <= "0010001000100010"; WAIT FOR 100 NS;
   lowA <= "0011001100110011"; WAIT FOR 100 NS;
   lowA <= "0100010001000100"; WAIT FOR 100 NS;
   lowA <= "0101010101010101"; WAIT FOR 100 NS;   
   lowA <= "0110011001100110"; WAIT FOR 100 NS;
   lowA <= "0111011101110111"; WAIT FOR 100 NS;
   lowA <= "1000100010001000"; WAIT FOR 100 NS;
   lowA <= "1001100110011001"; WAIT FOR 100 NS;
   lowA <= "1010101010101010"; WAIT FOR 100 NS;
   lowA <= "1011101110111011"; WAIT FOR 100 NS;
   WAIT; -- forever
   END PROCESS;

   p_highA: PROCESS -- stimulus for signal clk
   BEGIN
   highA <= "1111111111111111"; WAIT FOR 100 NS;
   highA <= "1110111011101110"; WAIT FOR 100 NS;
   highA <= "1101110111011101"; WAIT FOR 100 NS;
   highA <= "1100110011001100"; WAIT FOR 100 NS;   
   highA <= "1011101110111011"; WAIT FOR 100 NS;
   highA <= "1010101010101010"; WAIT FOR 100 NS;
   highA <= "1001100110011001"; WAIT FOR 100 NS;
   highA <= "1000100010001000"; WAIT FOR 100 NS;
   highA <= "0111011101110111"; WAIT FOR 100 NS;
   highA <= "0110011001100110"; WAIT FOR 100 NS;
   WAIT; -- forever
   END PROCESS;

   p_clk: PROCESS -- stimulus for signal clk
   BEGIN
   clk0 <= '0'; WAIT FOR 50 NS;
   clk0 <= '1'; WAIT FOR 50 NS;
   clk0 <= '0'; WAIT FOR 150 NS;
   clk0 <= '1'; WAIT FOR 50 NS;   
   clk0 <= '0'; WAIT FOR 250 NS;
   clk0 <= '1'; WAIT FOR 50 NS;
   clk0 <= '0'; WAIT FOR 250 NS;
   clk0 <= '1'; WAIT FOR 50 NS;
   clk0 <= '0'; WAIT FOR 200 NS;
   WAIT; -- forever
   END PROCESS;

   p_oe0: PROCESS -- stimulus for signal clk
   BEGIN
   oe0 <= '0'; WAIT FOR 150 NS;
   oe0 <= '1'; WAIT FOR 300 NS;
   oe0 <= '0'; WAIT FOR 200 NS;
   oe0 <= '1'; WAIT FOR 100 NS;   
   oe0 <= '0'; WAIT FOR 200 NS;
   oe0 <= '1'; WAIT FOR 200 NS;
   oe0 <= '0'; WAIT FOR 200 NS;
   WAIT; -- forever
   END PROCESS;

-- *** End Test Bench - User Defined Section ***

END;
