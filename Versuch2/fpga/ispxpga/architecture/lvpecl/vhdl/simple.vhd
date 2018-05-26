LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY simple IS
PORT(
	  i	:IN		STD_LOGIC;
	  p_out	:OUT	STD_LOGIC;
	  n_out	:OUT	STD_LOGIC
);
END simple;

ARCHITECTURE lat_behave OF simple IS

COMPONENT	LVPECLOUT 
PORT(
	I:		IN	STD_LOGIC;
	P_OUT:	OUT	STD_LOGIC;
	N_OUT:	OUT	STD_LOGIC
);
END COMPONENT;
attribute syn_black_box: boolean;
attribute syn_black_box of LVPECLOUT: component is true;
BEGIN
I1: LVPECLOUT PORT MAP(I => i, P_OUT => p_out, N_OUT => n_out);
end lat_behave;
