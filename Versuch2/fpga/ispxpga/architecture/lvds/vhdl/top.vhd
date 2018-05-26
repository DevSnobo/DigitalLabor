LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY top IS
PORT(
	  top_p_in	:IN		STD_LOGIC;
	  top_n_in	:IN		STD_LOGIC;
	  top_o	:OUT	STD_LOGIC
);
END top;

ARCHITECTURE lat_behave OF top IS

COMPONENT	simple 
PORT(
	p_in:	IN	STD_LOGIC;
	n_in:	IN	STD_LOGIC;
	o:	OUT	STD_LOGIC
);
END COMPONENT;
BEGIN
I1: simple PORT MAP(p_in => top_p_in, n_in => top_n_in, o => top_o);
end lat_behave;
