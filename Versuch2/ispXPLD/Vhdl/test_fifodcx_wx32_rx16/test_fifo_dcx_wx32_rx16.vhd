LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_fifo_dcx_wx32_rx16 is

    port (
           Data         : in std_logic_vector(31 downto 0);
           WrClock      : in std_logic;
           WrEn         : in std_logic;
           RdClock      : in std_logic;
           RdEn         : in std_logic;
           Reset        : in std_logic;
           RPReset      : in std_logic;
           Q            : out std_logic_vector(15 downto 0);
           Full         : Out std_logic;
           Empty        : Out std_logic;
           AlmostFull   : Out std_logic;
           AlmostEmpty  : Out std_logic);
end test_fifo_dcx_wx32_rx16 ;

architecture struct of  test_fifo_dcx_wx32_rx16  is

component fifo_dcx
  generic (
  	module_type       : string  := "FIFO_DCX";
  	module_widthw     : integer := 1;
  	module_widthr     : integer := 1;
  	module_widthuw    : integer := 1;
  	module_widthur    : integer := 1;
  	module_numwordsw  : integer := 1;
  	module_numwordsr  : integer := 1;
  	module_amfull_flag : integer := 1;
  	module_amempty_flag : integer := 1;
  	module_hint      : string  := "UNUSED");

  port (
  	Data          :  in  std_logic_vector (module_widthw-1 downto 0);
  	WrClock       :  in  std_logic;
  	WrEn          :  in  std_logic;
  	RdClock       :  in  std_logic;
  	RdEn          :  in  std_logic;
  	Reset         :  in  std_logic;
  	RPReset       :  in  std_logic;
  	Q             :  out std_logic_vector (module_widthr-1 downto 0);
  	Full          :  out std_logic;
  	Empty         :  out std_logic;
        AlmostFull    :  out std_logic;
        AlmostEmpty   :  out std_logic);
end component;
     
begin
U0: fifo_dcx
         generic map (module_widthw    => 32,
                      module_widthuw   => 9,
                      module_widthr    => 16,
                      module_widthur   => 10,
                      module_numwordsw => 512,
                      module_numwordsr => 1024,
                      module_amfull_flag => 1,
	              module_amempty_flag => 1)
        port map (    Data        => Data, 
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

