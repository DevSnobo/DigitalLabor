Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_LPM_MULT_20_20_40_SIGNED_1_UNUSED IS

        PORT (
        Result              :OUT    std_logic_vector(39 DOWNTO 0);
        DataA               :IN    std_logic_vector(19 DOWNTO 0);
        DataB               :IN    std_logic_vector(19 DOWNTO 0);
        Clock               :IN   std_logic;
        Aclr                :IN   std_logic);

END test_LPM_MULT_20_20_40_SIGNED_1_UNUSED;

ARCHITECTURE LATTICE_ARCH OF test_LPM_MULT_20_20_40_SIGNED_1_UNUSED IS

BEGIN
END LATTICE_ARCH;

