LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY top IS
PORT(
	  top_i	:IN		STD_LOGIC;
	  top_p_out	:OUT	STD_LOGIC;
	  top_n_out	:OUT	STD_LOGIC
);
END top;

ARCHITECTURE lat_behave OF top IS

COMPONENT	simple 
PORT(
	i:		IN	STD_LOGIC;
	p_out:	OUT	STD_LOGIC;
	n_out:	OUT	STD_LOGIC
);
END COMPONENT;
BEGIN
I1: simple PORT MAP(i => top_i, p_out => top_p_out, n_out => top_n_out);
end lat_behave;
