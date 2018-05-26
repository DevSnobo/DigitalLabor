library IEEE;
use IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_rom16kx2 is

    port (
           Address      : in  std_logic_vector(13 downto 0);
           OutClock      : in  std_logic;
           OutClockEn    : in  std_logic;
           Reset        : in  std_logic;
           Q            : out std_logic_vector(1 downto 0));
end test_rom16kx2;

architecture struct of  test_rom16kx2  is

component rom
  generic (
  	module_type               : string  := "ROM";
  	module_width              : integer := 1;
  	module_numwords           : integer := 1;
  	module_widthad            : integer := 1;
  	module_outdata            : string  := "UNREGISTERED";
  	module_address_control    : string  := "REGISTERED";
  	module_init_file          : string := "ROM_init";
  	module_hint               : string  := "UNUSED");

  port (
  	Address       : in  std_logic_vector (module_widthad-1 downto 0);
  	OutClock      : in  std_logic;
  	OutClockEn    : in  std_logic;
  	Reset         : in  std_logic;
  	Q             : out std_logic_vector (module_width-1 downto 0));

end component;

begin
U0: rom
         generic map (module_width     => 2,
                      module_widthad   => 14,
                      module_numwords  => 16384,
                      module_outdata   => "REGISTERED",
                      module_address_control => "REGISTERED",
                      module_init_file => "ROM_init")
         port map (   Address       => Address,
                      OutClock      => OutClock,
                      OutClockEn    => OutClockEn,
                      Reset         => Reset,
                      Q             => Q);
end struct;
