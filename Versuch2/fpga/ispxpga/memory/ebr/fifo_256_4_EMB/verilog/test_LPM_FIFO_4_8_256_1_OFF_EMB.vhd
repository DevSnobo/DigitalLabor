Library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;

ENTITY test_LPM_FIFO_4_8_256_1_OFF_EMB IS

        PORT (
        EDI                 :IN    std_logic_vector(0 DOWNTO 0);
        EDO                 :OUT    std_logic_vector(0 DOWNTO 0);
        Data                :IN    std_logic_vector(3 DOWNTO 0);
        Q                   :OUT    std_logic_vector(3 DOWNTO 0);
        UsedW               :OUT    std_logic_vector(7 DOWNTO 0);
        Clock               :IN   std_logic;
        WrReq               :IN   std_logic;
        RdReq               :IN   std_logic;
        Aclr                :IN   std_logic;
        Full                :OUT   std_logic;
        Empty               :OUT   std_logic);

END test_LPM_FIFO_4_8_256_1_OFF_EMB;

ARCHITECTURE LATTICE_ARCH OF test_LPM_FIFO_4_8_256_1_OFF_EMB IS

BEGIN
END LATTICE_ARCH;

