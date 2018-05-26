library IEEE;
use IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_fifo4kx4 is

    port (
           Data         : in  std_logic_vector(3 downto 0);
           WrClock      : in  std_logic;
           WrEn         : in  std_logic;
           RdClock      : in  std_logic;
           RdEn         : in  std_logic;
           Reset        : in  std_logic;
           RPReset      : in  std_logic;
           Q            : out std_logic_vector(3 downto 0);
           Full         : Out std_logic;
           Empty        : Out std_logic;
           AlmostFull   : Out std_logic;
           AlmostEmpty  : Out std_logic);
end test_fifo4kx4;

architecture struct of  test_fifo4kx4  is

component fifo_dc
 generic (
  	module_type      : string  := "FIFO_DC";
  	module_width     : integer := 1;
  	module_widthu    : integer := 1;
  	module_numwords  : integer := 1;
  	module_amfull_flag : integer := 1;
  	module_amempty_flag : integer := 1;
  	module_hint      : string  := "UNUSED");
  	
  port (
           Data          :  in  std_logic_vector (module_width-1 downto 0);
           WrClock       :  in  std_logic;
           WrEn          :  in  std_logic;
           RdClock       :  in  std_logic;
           RdEn          :  in  std_logic;
           Reset         :  in  std_logic;
           RPReset       :  in  std_logic;
           Q             :  out std_logic_vector (module_width-1 downto 0);
           Full          :  out std_logic;
           Empty         :  out std_logic;
           AlmostFull    :  out std_logic;
           AlmostEmpty   :  out std_logic);
end component;

begin
U0: fifo_dc
         generic map (module_width    => 4,
                      module_widthu   => 12,
                      module_amfull_flag => 1,
                      module_amempty_flag => 1,
                      module_numwords => 4096)
         port map (   Data        => Data,
                      WrClock     => WrClock,
                      WrEn        => WrEn,
                      RdClock     => RdClock,
                      RdEn        => RdEn,
                      Reset       => Reset,
                      RPReset     => RPReset,
                      Q           => Q,
                      Full        => Full,
                      Empty       => Empty,
                      AlmostFull  => AlmostFull,
                      AlmostEmpty => AlmostEmpty );
end struct;
