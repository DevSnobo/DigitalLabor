Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test IS

        PORT (
        Q                   :OUT    std_logic_vector(15 DOWNTO 0);
        Data                :IN    std_logic_vector(15 DOWNTO 0);
        Clock               :IN   std_logic;
        Enable              :IN   std_logic;
        Aclr                :IN   std_logic;
        ShiftIn             :IN   std_logic;
        Load                :IN   std_logic;
        ShiftOut            :OUT   std_logic);

END test;

ARCHITECTURE LATTICE_ARCH OF test IS

BEGIN
END LATTICE_ARCH;

