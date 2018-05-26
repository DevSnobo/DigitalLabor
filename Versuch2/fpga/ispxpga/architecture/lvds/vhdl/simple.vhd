LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY simple IS
PORT(
	  p_in	:IN		STD_LOGIC;
	  n_in	:IN		STD_LOGIC;
	  o	:OUT	STD_LOGIC
);
END simple;

ARCHITECTURE lat_behave OF simple IS

COMPONENT	LVDSIN 
PORT(
	P_IN:	IN	STD_LOGIC;
	N_IN:	IN	STD_LOGIC;
	O:	OUT	STD_LOGIC
);
END COMPONENT;
attribute syn_black_box: boolean;
attribute syn_black_box of LVDSIN: component is true;
BEGIN
I1: LVDSIN PORT MAP(P_IN => p_in, N_IN => n_in, O => o);
end lat_behave;
