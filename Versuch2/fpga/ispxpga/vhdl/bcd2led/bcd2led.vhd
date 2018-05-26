library ieee;
use ieee.std_logic_1164.all;

entity BCD2LED is
port ( A0, A1, A2, A3:  in std_logic;
       A,B,C,D,E,F,G : out std_logic);
end;

architecture structural of BCD2LED is
signal BCD: std_logic_vector(3 downto 0);
signal LED: std_logic_vector(6 downto 0);
begin

        BCD <= A0 & A1 & A2 & A3;

	process (BCD)
	begin
            case BCD is
		when "0000" => LED <= "1111110";
		when "0001" => LED <= "1100000";
		when "0010" => LED <= "1011011";
		when "0011" => LED <= "1110011";
		when "0100" => LED <= "1100101";
		when "0101" => LED <= "0110111";
		when "0110" => LED <= "0111111";
		when "0111" => LED <= "1100010";
		when "1000" => LED <= "1111111";
		when "1001" => LED <= "1110111";
		when others => LED <= "-------";
            end case;
	end process;
        	A <= LED(6);
        	B <= LED(5);
        	C <= LED(4);
        	D <= LED(3);
        	E <= LED(2);
        	F <= LED(1);
        	G <= LED(0);
end structural;
