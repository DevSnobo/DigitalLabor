library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library xpga;
use xpga.components.all;

entity cdrx8b10b is
port (
rxd_p, rxd_n:	in std_logic;
refclk:	in std_logic;
cdrrst:	in std_logic;
recclk:	out std_logic;
cslock:	out std_logic;
sydt:	out std_logic;
rxd	: out std_logic_vector(9 downto 0)
);
end cdrx8b10b;


architecture behave of cdrx8b10b is


component LVDSIN
port (
	P_IN		: in std_logic;
	N_IN		: in std_logic;
	O		: out std_logic
);
end component;


component CDRX_8B10B


generic(
IN_FREQ:	string
);


port (
SIN:	in std_logic;
REFCLK:	in std_logic;
CDRRST:	in std_logic;
RXD0:	out std_logic;
RXD1:	out std_logic;
RXD2:	out std_logic;
RXD3:	out std_logic;
RXD4:	out std_logic;
RXD5:	out std_logic;
RXD6:	out std_logic;
RXD7:	out std_logic;
RXD8:	out std_logic;
RXD9:	out std_logic;
RECCLK:	out std_logic;
CSLOCK:	out std_logic;
SYDT:	out std_logic
);


end component;


signal sin	: std_logic;


attribute IN_FREQ	: string;
attribute IN_FREQ of I3	: label is "40.00";


begin
I1: LVDSIN port map (P_IN => rxd_p, N_IN => rxd_n, O => sin);
I3: CDRX_8B10B
generic map(
IN_FREQ	=> "40.00"
)


port map(
SIN	=> sin,
REFCLK	=> refclk,
CDRRST	=> cdrrst,
RXD0	=> rxd(0),
RXD1	=> rxd(1),
RXD2	=> rxd(2),
RXD3	=> rxd(3),
RXD4	=> rxd(4),
RXD5	=> rxd(5),
RXD6	=> rxd(6),
RXD7	=> rxd(7),
RXD8	=> rxd(8),
RXD9	=> rxd(9),
RECCLK	=> recclk,
CSLOCK	=> cslock,
SYDT	=> sydt
);


end behave;
