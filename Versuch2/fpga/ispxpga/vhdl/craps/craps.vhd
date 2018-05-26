package gamble is
    type dice is range 0 to 12;
end gamble;

library ieee;
use ieee.std_logic_1164.all;
use work.gamble.all;

entity craps is
    port(roll, new_game: in std_logic;
--         number:         in dice;
           number: in std_logic_vector(3 downto 0);
         win, loss:      out std_logic);
end craps;

architecture no_cheating of craps is
begin
    process(roll,new_game,number)
        variable next_roll : boolean;
        variable point : std_logic_vector(3 downto 0);
        variable snake_eyes : std_logic_vector(3 downto 0);
    begin
        snake_eyes := "0010";
        if new_game = '1' then                 -- reset
            next_roll := false;
            win        <= '0';
            loss       <= '0';
            point      := "0000";
        elsif rising_edge(roll) then          -- clock
            if not next_roll then
                next_roll := true;
                if number = "0111" or number = "1011" then 
                    win <= '1';
                elsif number = snake_eyes then
                    loss <= '1';
                else
                    point := number;
                end if;
            else
                if number = "0111" then 
                    loss <= '1';
                elsif number <= point then
                    win <= '1'; -- else roll again
                end if;
            end if;
        end if;
    end process;
end no_cheating;    

