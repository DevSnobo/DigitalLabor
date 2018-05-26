Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test IS

        PORT (
        Q                   :OUT    std_logic_vector(15 DOWNTO 0);
        Data                :IN    std_logic_vector(15 DOWNTO 0);
        Clock               :IN   std_logic;
        Cnt_En              :IN   std_logic;
        UpDown              :IN   std_logic;
        Sclr                :IN   std_logic);

END test;

ARCHITECTURE LATTICE_ARCH OF test IS

BEGIN
END LATTICE_ARCH;

