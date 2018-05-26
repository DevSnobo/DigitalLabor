LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counttb IS
END counttb;

ARCHITECTURE behavior OF counttb IS 

	COMPONENT counter
	PORT(
		Clk : IN std_logic;
		Ld : IN std_logic;
		Rst : IN std_logic;          
		Count : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL Clk :  std_logic;
	SIGNAL Ld :  std_logic;
	SIGNAL Rst :  std_logic;
	SIGNAL Count :  std_logic_vector(3 downto 0);

BEGIN

	uut: counter PORT MAP(
		Clk => Clk,
		Ld => Ld,
		Rst => Rst,
		Count => Count
	);


-- *** Test Bench - User Defined Section ***
   p_clock: process
   begin
      clk <= '0';
      wait for 50 ns;
      clk <= '1';
      wait for 50 ns;
   end process;

   p_stim: process
   begin
      rst <= '1';
      ld <= '0';
      wait for 100 ns;
      rst <= '0';
      wait for 1000 ns;
      ld <= '1';
      wait for 100 ns;
      ld <= '0';
      wait for 1000 ns;
   end process;

-- *** End Test Bench - User Defined Section ***

END;
