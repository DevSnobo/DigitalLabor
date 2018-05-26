library IEEE;
use IEEE.std_logic_1164.all;
-- synthesis translate_off
LIBRARY lc5kmx;
USE lc5kmx.components.all;
-- synthesis translate_on

entity test_ramdps16kwx2rx2 is

    port (
           Data         : in std_logic_vector(1 downto 0);
           WrAddress      : in  std_logic_vector(13 downto 0);
           RdAddress      : in  std_logic_vector(13 downto 0);
           WrClock        : in  std_logic;
           WrClockEn      : in  std_logic;
           RdClock        : in  std_logic;
           RdClockEn      : in  std_logic;
           WE           : in  std_logic;
           Reset        : in  std_logic;
           Q            : out std_logic_vector(1 downto 0));
end test_ramdps16kwx2rx2;

architecture struct of  test_ramdps16kwx2rx2  is

component ram_dp

	generic(
		module_type             : string  := "RAM_DP";
		module_widthw           : integer := 1;
		module_widthr           : integer := 1;
		module_numwordsw        : integer := 1;
		module_widthadw         : integer := 1;
		module_widthadr         : integer := 1;
		module_numwordsr        : integer := 1;
		module_indata           : string := "REGISTERED";
		module_outdata          : string := "UNREGISTERED";
		module_addressw_control : string := "REGISTERED";
		module_addressr_control : string := "REGISTERED";
		module_hint             : string := "UNUSED";
		module_init_file        : string := "RAM_init");

	port (
           Data            : in  std_logic_vector (module_widthw-1 downto 0);
           WrAddress       : in  std_logic_vector (module_widthadw-1 downto 0);
           RdAddress       : in  std_logic_vector (module_widthadr-1 downto 0);
           WrClock         : in  std_logic := '0';
           WrClockEn       : in  std_logic := '0';
           RdClock         : in  std_logic := '0';
           RdClockEn       : in  std_logic := '0';
           WE              : in  std_logic;
           Reset           : in  std_logic;
           Q               : out std_logic_vector (module_widthr-1 downto 0));
end component;
begin
U0: ram_dp
         generic map (module_widthw     => 2,
                      module_widthadw   => 14,
                      module_numwordsw  => 16384,
                      module_widthr     => 2,
                      module_widthadr   => 14,
                      module_numwordsr  => 16384,
                      module_indata     => "REGISTERED",
                      module_outdata    => "UNREGISTERED",
                      module_addressw_control => "REGISTERED",
                      module_addressr_control => "REGISTERED",
                      module_init_file => "RAM_init")
         port map (
                      Data          => Data,
                      WrAddress     => WrAddress,
                      RdAddress     => RdAddress,
                      WrClock       => WrClock,
                      WrClockEn     => WrClockEn,
                      RdClock       => RdClock,
                      RdClockEn     => RdClockEn,
                      WE            => WE,
                      Reset         => Reset,
                      Q             => Q);

end struct;
