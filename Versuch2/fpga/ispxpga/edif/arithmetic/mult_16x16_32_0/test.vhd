Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test IS

        PORT (
        Result              :OUT    std_logic_vector(31 DOWNTO 0);
        DataA_              :IN    std_logic_vector(15 DOWNTO 0);
        DataB_              :IN    std_logic_vector(15 DOWNTO 0));

END test;

ARCHITECTURE LATTICE_ARCH OF test IS

BEGIN
END LATTICE_ARCH;

