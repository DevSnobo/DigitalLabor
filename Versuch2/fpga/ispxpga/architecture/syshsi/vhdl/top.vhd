library ieee;
use ieee.std_logic_1164.all;


entity top is
port (
top_rxd_p, top_rxd_n:	in std_logic;
top_refclk:	in std_logic;
top_cdrrst:	in std_logic;
top_recclk:	out std_logic;
top_cslock:	out std_logic;
top_sydt:	out std_logic;
top_rxd	: out std_logic_vector(9 downto 0)
);
end top;


--architecture behave of cdrx8b10b is
architecture behave of top is

component cdrx8b10b
port (
rxd_p, rxd_n:	in std_logic;
refclk:	in std_logic;
cdrrst:	in std_logic;
recclk:	out std_logic;
cslock:	out std_logic;
sydt:	out std_logic;
rxd	: out std_logic_vector(9 downto 0)
);

end component;

begin
C1: cdrx8b10b

port map(
rxd_p	=> top_rxd_p,
rxd_n	=> top_rxd_n,
refclk	=> top_refclk,
cdrrst	=> top_cdrrst,
recclk	=> top_recclk,
cslock	=> top_cslock,
sydt	=> top_sydt,
rxd	=> top_rxd
);

end behave;
