Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test IS

        PORT (
        EDI                 :IN    std_logic_vector(0 DOWNTO 0);
        EDO                 :OUT    std_logic_vector(0 DOWNTO 0);
        Q                   :OUT    std_logic_vector(3 DOWNTO 0);
        Data                :IN    std_logic_vector(3 DOWNTO 0);
        WrAddress           :IN    std_logic_vector(3 DOWNTO 0);
        RdAddress           :IN    std_logic_vector(3 DOWNTO 0);
        RdClock             :IN   std_logic;
        WrClock             :IN   std_logic;
        RdEn                :IN   std_logic;
        WrEn                :IN   std_logic);

END test;

ARCHITECTURE LATTICE_ARCH OF test IS

BEGIN
END LATTICE_ARCH;

