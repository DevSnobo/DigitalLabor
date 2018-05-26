---------------------------------------------------------
-- VHDL Version of example CNTBUF.ABL
-- Counter and Bidirectional Buffer
--
-- Copyright 1999, Vantis Corporation
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cntbuf is
    port( Dir:        in     std_logic;
          A,B:        inout  std_logic_vector(0 to 1);
          Clk,Clr,OE: in     std_logic;
          Q:          inout  std_logic_vector(3 downto 0));
end cntbuf;

architecture example of cntbuf is
begin
    process(Dir,A,B)            -- Bi-directional buffer
    begin
        if Dir = '1' then
            B <= "ZZ";          -- Make B high Z
            A <= B;
        else
            B <= A;
            A <= "ZZ";          -- Make A high Z
        end if;
    end process;

    process(Clk,OE)         -- Counter
        variable Count: unsigned(3 downto 0); -- type unsigned defined in ieee.numeric_std
    begin
        if (rising_edge(Clk)) then   -- Edge triggered clock
            if Clr = '1' then -- sync reset condition
                Count := (others => '0'); 
	    else
                Count := Count + 1; -- overload "+" operator from ieee.numeric_std
            end if;
        end if;
	-- the following statements will infer tristate output buffers with low-active enable
        if OE = '1' then
            Q <= "ZZZZ"; 
        else
            Q <= std_logic_vector(Count); -- type cast counter output to std_logic_vector
        end if;
    end process;
end example;
