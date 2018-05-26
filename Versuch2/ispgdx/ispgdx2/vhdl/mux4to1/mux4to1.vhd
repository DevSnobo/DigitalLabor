library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
    generic (size : integer range 0 to 63 := 16);
    port (mux_out : out std_logic_vector (size - 1 downto 0);
	  mux_in1 : in  std_logic_vector (size - 1 downto 0);
	  mux_in2 : in  std_logic_vector (size - 1 downto 0);
	  mux_in3 : in  std_logic_vector (size - 1 downto 0);
	  mux_in4 : in  std_logic_vector (size - 1 downto 0);
	  clk : in std_logic;
	  sel : in std_logic_vector(1 downto 0);
          rst : in std_logic);
	
end;

architecture behave of mux4to1 is
begin
    process(clk, rst, sel)
    begin
        if ( rst = '1' ) then
            mux_out <= (others => '0');
        else 
  	    if rising_edge(clk) then
		case sel is
		    when "00" => mux_out <=  mux_in1;
		    when "01" => mux_out <=  mux_in2;		
		    when "10" => mux_out <=  mux_in3; 
		    when "11" => mux_out <=  mux_in4;
		    when others => mux_out <= (others =>'0');
		end case;
	    end if;
        end if;
    end process;
end behave;
