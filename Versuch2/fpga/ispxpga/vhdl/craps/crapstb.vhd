entity crapstb is
end;

--------------------------------------------------
-- testbench for Craps.vhd
--
--
library IEEE;
use IEEE.std_logic_1164.all;
--use work.gamble.all;   -- From craps.vhd

architecture behavior of crapstb is 
    component craps
    port(roll, new_game: std_logic;
         Number: in std_logic_vector(3 downto 0);
         win,loss : out std_logic);
    end component;

    signal CE:  std_logic; -- Clock enable
    signal Clk: std_logic;
    signal new_game: std_logic;
    signal Number: std_logic_vector(3 downto 0);
    signal win: std_logic;
    signal loss: std_logic;
    signal vector_cnt: integer := 1;
    signal error_flag: std_logic := '0';

    type test_record is record
        CE      : std_logic;  -- Clock enable
        new_game: std_logic;
        Number  : std_logic_vector(3 downto 0);
        win     : std_logic;
        loss    : std_logic;
    end record;

    type test_array is array(positive range <>) of test_record;

    constant test_vectors : test_array := (
  --  CE, new_game, Number, win, loss
	('0',    '1'  ,    "0000"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0101"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0010"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0101"  , '1', '0'),  -- Reset
	('1',    '1'  ,    "0000"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0111"  , '1', '0'),  -- Reset
	('1',    '1'  ,    "0000"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0010"  , '0', '1'),  -- Reset
	('1',    '1'  ,    "0000"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "1000"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0011"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "0110"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "1001"  , '0', '0'),  -- Reset
	('1',    '0'  ,    "1000"  , '1', '0')  -- Reset
    );

begin
    -- instantiate the component
    uut: craps
        port map (roll => Clk,
                  new_game => new_game,
                  Number => Number,
                  win => win,
                  loss => loss);
 
    -- provide stimulus and check the result

    testrun: process
        variable vector : test_record;
    begin
	for index in test_vectors'range loop
        vector_cnt <= index;
	    vector := test_vectors(index);

	    -- Apply the input stimulus...
        CE <= vector.CE;
	    new_game <= vector.new_game;
	    Number <= vector.Number;

	    -- Clock (low-high-low) with a 100 ns cycle...
        Clk <= '0';
        wait for 25 ns;
        if CE = '1' then
            Clk <= '1';
        end if;
        wait for 50 ns;
        Clk <= '0';
        wait for 25 ns;

	    -- Check the results...
	    if (win  /= vector.win or loss /= vector.loss) then
              error_flag <= '1';
	    else
              error_flag <= '0';
        end if;
	end loop;
	wait;
    end process;
end;


