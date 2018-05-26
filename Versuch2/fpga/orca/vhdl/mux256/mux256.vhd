--Author: Ranjit Gupte
--Lattice Semiconductor Corporation

--This module has a chain of wide muxes.
--It is used to analyze the efficieny of synthesis tools
--when it comes to infering MUX81 library elements. 

library ieee;
	use ieee.std_logic_1164.all;
	use IEEE.std_logic_unsigned.all;

	
entity mux256 is

	port(
  		rx_clk	  :	in std_logic;
  		rst_n     : in std_logic;
  		data_in	  : in std_logic_vector(255 downto 0);
  		sel_in	  : in std_logic_vector(7 downto 0);
  		data_out  : out std_logic
	);	
	end mux256;

architecture structure of mux256 is

signal data_out_reg		:	std_logic;
signal data_in_reg		:	std_logic_vector(255 downto 0);
begin

  process (rx_clk, rst_n)
    begin
      if (rst_n = '0') then
	    data_out	 <= '0';
	    data_in_reg  <= (others => '0');
	  elsif(rx_clk'event and rx_clk = '1') then 
	    data_out	 <= data_out_reg;
	    data_in_reg <= data_in;
	  end if;
  end process;

  process (rx_clk, rst_n)
    begin
      if (rst_n = '0') then
	    data_out_reg <= '0';
	  elsif(rx_clk'event and rx_clk = '1') then 
        case sel_in is
 
        when "00000000" => data_out_reg <= data_in_reg(0);
        when "00000001" => data_out_reg <= data_in_reg(1);
        when "00000010" => data_out_reg <= data_in_reg(2);
        when "00000011" => data_out_reg <= data_in_reg(3);
        when "00000100" => data_out_reg <= data_in_reg(4);
        when "00000101" => data_out_reg <= data_in_reg(5);
        when "00000110" => data_out_reg <= data_in_reg(6);
        when "00000111" => data_out_reg <= data_in_reg(7);
        when "00001000" => data_out_reg <= data_in_reg(8);
        when "00001001" => data_out_reg <= data_in_reg(9);
        when "00001010" => data_out_reg <= data_in_reg(10);
        when "00001011" => data_out_reg <= data_in_reg(11);
        when "00001100" => data_out_reg <= data_in_reg(12);
        when "00001101" => data_out_reg <= data_in_reg(13);
        when "00001110" => data_out_reg <= data_in_reg(14);
        when "00001111" => data_out_reg <= data_in_reg(15);
        when "00010000" => data_out_reg <= data_in_reg(16);
        when "00010001" => data_out_reg <= data_in_reg(17);
        when "00010010" => data_out_reg <= data_in_reg(18);
        when "00010011" => data_out_reg <= data_in_reg(19);
        when "00010100" => data_out_reg <= data_in_reg(20);
        when "00010101" => data_out_reg <= data_in_reg(21);
        when "00010110" => data_out_reg <= data_in_reg(22);
        when "00010111" => data_out_reg <= data_in_reg(23);
        when "00011000" => data_out_reg <= data_in_reg(24);
        when "00011001" => data_out_reg <= data_in_reg(25);
        when "00011010" => data_out_reg <= data_in_reg(26);
        when "00011011" => data_out_reg <= data_in_reg(27);
        when "00011100" => data_out_reg <= data_in_reg(28);
        when "00011101" => data_out_reg <= data_in_reg(29);
        when "00011110" => data_out_reg <= data_in_reg(30);
        when "00011111" => data_out_reg <= data_in_reg(31);
        when "00100000" => data_out_reg <= data_in_reg(32);
        when "00100001" => data_out_reg <= data_in_reg(33);
        when "00100010" => data_out_reg <= data_in_reg(34);
        when "00100011" => data_out_reg <= data_in_reg(35);
        when "00100100" => data_out_reg <= data_in_reg(36);
        when "00100101" => data_out_reg <= data_in_reg(37);
        when "00100110" => data_out_reg <= data_in_reg(38);
        when "00100111" => data_out_reg <= data_in_reg(39);
        when "00101000" => data_out_reg <= data_in_reg(40);
        when "00101001" => data_out_reg <= data_in_reg(41);
        when "00101010" => data_out_reg <= data_in_reg(42);
        when "00101011" => data_out_reg <= data_in_reg(43);
        when "00101100" => data_out_reg <= data_in_reg(44);
        when "00101101" => data_out_reg <= data_in_reg(45);
        when "00101110" => data_out_reg <= data_in_reg(46);
        when "00101111" => data_out_reg <= data_in_reg(47);
        when "00110000" => data_out_reg <= data_in_reg(48);
        when "00110001" => data_out_reg <= data_in_reg(49);
        when "00110010" => data_out_reg <= data_in_reg(50);
        when "00110011" => data_out_reg <= data_in_reg(51);
        when "00110100" => data_out_reg <= data_in_reg(52);
        when "00110101" => data_out_reg <= data_in_reg(53);
        when "00110110" => data_out_reg <= data_in_reg(54);
        when "00110111" => data_out_reg <= data_in_reg(55);
        when "00111000" => data_out_reg <= data_in_reg(56);
        when "00111001" => data_out_reg <= data_in_reg(57);
        when "00111010" => data_out_reg <= data_in_reg(58);
        when "00111011" => data_out_reg <= data_in_reg(59);
        when "00111100" => data_out_reg <= data_in_reg(60);
        when "00111101" => data_out_reg <= data_in_reg(61);
        when "00111110" => data_out_reg <= data_in_reg(62);
        when "00111111" => data_out_reg <= data_in_reg(63);          
        when "01000000" => data_out_reg <= data_in_reg(64);
        when "01000001" => data_out_reg <= data_in_reg(65);
        when "01000010" => data_out_reg <= data_in_reg(66);
        when "01000011" => data_out_reg <= data_in_reg(67);
        when "01000100" => data_out_reg <= data_in_reg(68);
        when "01000101" => data_out_reg <= data_in_reg(69);
        when "01000110" => data_out_reg <= data_in_reg(70);
        when "01000111" => data_out_reg <= data_in_reg(71);
        when "01001000" => data_out_reg <= data_in_reg(72);
        when "01001001" => data_out_reg <= data_in_reg(73);
        when "01001010" => data_out_reg <= data_in_reg(74);
        when "01001011" => data_out_reg <= data_in_reg(75);
        when "01001100" => data_out_reg <= data_in_reg(76);
        when "01001101" => data_out_reg <= data_in_reg(77);
        when "01001110" => data_out_reg <= data_in_reg(78);
        when "01001111" => data_out_reg <= data_in_reg(79);
        when "01010000" => data_out_reg <= data_in_reg(80);
        when "01010001" => data_out_reg <= data_in_reg(81);
        when "01010010" => data_out_reg <= data_in_reg(82);
        when "01010011" => data_out_reg <= data_in_reg(83);
        when "01010100" => data_out_reg <= data_in_reg(84);
        when "01010101" => data_out_reg <= data_in_reg(85);
        when "01010110" => data_out_reg <= data_in_reg(86);
        when "01010111" => data_out_reg <= data_in_reg(87);
        when "01011000" => data_out_reg <= data_in_reg(88);
        when "01011001" => data_out_reg <= data_in_reg(89);
        when "01011010" => data_out_reg <= data_in_reg(90);
        when "01011011" => data_out_reg <= data_in_reg(91);
        when "01011100" => data_out_reg <= data_in_reg(92);
        when "01011101" => data_out_reg <= data_in_reg(93);
        when "01011110" => data_out_reg <= data_in_reg(94);
        when "01011111" => data_out_reg <= data_in_reg(95);
        when "01100000" => data_out_reg <= data_in_reg(96);
        when "01100001" => data_out_reg <= data_in_reg(97);
        when "01100010" => data_out_reg <= data_in_reg(98);
        when "01100011" => data_out_reg <= data_in_reg(99);
        when "01100100" => data_out_reg <= data_in_reg(100);
        when "01100101" => data_out_reg <= data_in_reg(101);
        when "01100110" => data_out_reg <= data_in_reg(102);
        when "01100111" => data_out_reg <= data_in_reg(103);
        when "01101000" => data_out_reg <= data_in_reg(104);
        when "01101001" => data_out_reg <= data_in_reg(105);
        when "01101010" => data_out_reg <= data_in_reg(106);
        when "01101011" => data_out_reg <= data_in_reg(107);
        when "01101100" => data_out_reg <= data_in_reg(108);
        when "01101101" => data_out_reg <= data_in_reg(109);
        when "01101110" => data_out_reg <= data_in_reg(110);
        when "01101111" => data_out_reg <= data_in_reg(111);
        when "01110000" => data_out_reg <= data_in_reg(112);
        when "01110001" => data_out_reg <= data_in_reg(113);
        when "01110010" => data_out_reg <= data_in_reg(114);
        when "01110011" => data_out_reg <= data_in_reg(115);
        when "01110100" => data_out_reg <= data_in_reg(116);
        when "01110101" => data_out_reg <= data_in_reg(117);
        when "01110110" => data_out_reg <= data_in_reg(118);
        when "01110111" => data_out_reg <= data_in_reg(119);
        when "01111000" => data_out_reg <= data_in_reg(120);
        when "01111001" => data_out_reg <= data_in_reg(121);
        when "01111010" => data_out_reg <= data_in_reg(122);
        when "01111011" => data_out_reg <= data_in_reg(123);
        when "01111100" => data_out_reg <= data_in_reg(124);
        when "01111101" => data_out_reg <= data_in_reg(125);
        when "01111110" => data_out_reg <= data_in_reg(126);
        when "01111111" => data_out_reg <= data_in_reg(127);

	when "10000000" => data_out_reg <= data_in_reg(128);
        when "10000001" => data_out_reg <= data_in_reg(129);
        when "10000010" => data_out_reg <= data_in_reg(130);
        when "10000011" => data_out_reg <= data_in_reg(131);
        when "10000100" => data_out_reg <= data_in_reg(132);
        when "10000101" => data_out_reg <= data_in_reg(133);
        when "10000110" => data_out_reg <= data_in_reg(134);
        when "10000111" => data_out_reg <= data_in_reg(135);
        when "10001000" => data_out_reg <= data_in_reg(136);
        when "10001001" => data_out_reg <= data_in_reg(137);
        when "10001010" => data_out_reg <= data_in_reg(138);
        when "10001011" => data_out_reg <= data_in_reg(139);
        when "10001100" => data_out_reg <= data_in_reg(140);
        when "10001101" => data_out_reg <= data_in_reg(141);
        when "10001110" => data_out_reg <= data_in_reg(142);
        when "10001111" => data_out_reg <= data_in_reg(143);
        when "10010000" => data_out_reg <= data_in_reg(144);
        when "10010001" => data_out_reg <= data_in_reg(145);
        when "10010010" => data_out_reg <= data_in_reg(146);
        when "10010011" => data_out_reg <= data_in_reg(147);
        when "10010100" => data_out_reg <= data_in_reg(148);
        when "10010101" => data_out_reg <= data_in_reg(149);
        when "10010110" => data_out_reg <= data_in_reg(150);
        when "10010111" => data_out_reg <= data_in_reg(151);
        when "10011000" => data_out_reg <= data_in_reg(152);
        when "10011001" => data_out_reg <= data_in_reg(153);
        when "10011010" => data_out_reg <= data_in_reg(154);
        when "10011011" => data_out_reg <= data_in_reg(155);
        when "10011100" => data_out_reg <= data_in_reg(156);
        when "10011101" => data_out_reg <= data_in_reg(157);
        when "10011110" => data_out_reg <= data_in_reg(158);
        when "10011111" => data_out_reg <= data_in_reg(159);
        when "10100000" => data_out_reg <= data_in_reg(160);
        when "10100001" => data_out_reg <= data_in_reg(161);
        when "10100010" => data_out_reg <= data_in_reg(162);
        when "10100011" => data_out_reg <= data_in_reg(163);
        when "10100100" => data_out_reg <= data_in_reg(164);
        when "10100101" => data_out_reg <= data_in_reg(165);
        when "10100110" => data_out_reg <= data_in_reg(166);
        when "10100111" => data_out_reg <= data_in_reg(167);
        when "10101000" => data_out_reg <= data_in_reg(168);
        when "10101001" => data_out_reg <= data_in_reg(169);
        when "10101010" => data_out_reg <= data_in_reg(170);
        when "10101011" => data_out_reg <= data_in_reg(171);
        when "10101100" => data_out_reg <= data_in_reg(172);
        when "10101101" => data_out_reg <= data_in_reg(173);
        when "10101110" => data_out_reg <= data_in_reg(174);
        when "10101111" => data_out_reg <= data_in_reg(175);
        when "10110000" => data_out_reg <= data_in_reg(176);
        when "10110001" => data_out_reg <= data_in_reg(177);
        when "10110010" => data_out_reg <= data_in_reg(178);
        when "10110011" => data_out_reg <= data_in_reg(179);
        when "10110100" => data_out_reg <= data_in_reg(180);
        when "10110101" => data_out_reg <= data_in_reg(181);
        when "10110110" => data_out_reg <= data_in_reg(182);
        when "10110111" => data_out_reg <= data_in_reg(183);
        when "10111000" => data_out_reg <= data_in_reg(184);
        when "10111001" => data_out_reg <= data_in_reg(185);
        when "10111010" => data_out_reg <= data_in_reg(186);
        when "10111011" => data_out_reg <= data_in_reg(187);
        when "10111100" => data_out_reg <= data_in_reg(188);
        when "10111101" => data_out_reg <= data_in_reg(189);
        when "10111110" => data_out_reg <= data_in_reg(190);
        when "10111111" => data_out_reg <= data_in_reg(191);          
        when "11000000" => data_out_reg <= data_in_reg(192);
        when "11000001" => data_out_reg <= data_in_reg(193);
        when "11000010" => data_out_reg <= data_in_reg(194);
        when "11000011" => data_out_reg <= data_in_reg(195);
        when "11000100" => data_out_reg <= data_in_reg(196);
        when "11000101" => data_out_reg <= data_in_reg(197);
        when "11000110" => data_out_reg <= data_in_reg(198);
        when "11000111" => data_out_reg <= data_in_reg(199);
        when "11001000" => data_out_reg <= data_in_reg(200);
        when "11001001" => data_out_reg <= data_in_reg(201);
        when "11001010" => data_out_reg <= data_in_reg(202);
        when "11001011" => data_out_reg <= data_in_reg(203);
        when "11001100" => data_out_reg <= data_in_reg(204);
        when "11001101" => data_out_reg <= data_in_reg(205);
        when "11001110" => data_out_reg <= data_in_reg(206);
        when "11001111" => data_out_reg <= data_in_reg(207);
        when "11010000" => data_out_reg <= data_in_reg(208);
        when "11010001" => data_out_reg <= data_in_reg(209);
        when "11010010" => data_out_reg <= data_in_reg(210);
        when "11010011" => data_out_reg <= data_in_reg(211);
        when "11010100" => data_out_reg <= data_in_reg(212);
        when "11010101" => data_out_reg <= data_in_reg(213);
        when "11010110" => data_out_reg <= data_in_reg(214);
        when "11010111" => data_out_reg <= data_in_reg(215);
        when "11011000" => data_out_reg <= data_in_reg(216);
        when "11011001" => data_out_reg <= data_in_reg(217);
        when "11011010" => data_out_reg <= data_in_reg(218);
        when "11011011" => data_out_reg <= data_in_reg(219);
        when "11011100" => data_out_reg <= data_in_reg(220);
        when "11011101" => data_out_reg <= data_in_reg(221);
        when "11011110" => data_out_reg <= data_in_reg(222);
        when "11011111" => data_out_reg <= data_in_reg(223);
        when "11100000" => data_out_reg <= data_in_reg(224);
        when "11100001" => data_out_reg <= data_in_reg(225);
        when "11100010" => data_out_reg <= data_in_reg(226);
        when "11100011" => data_out_reg <= data_in_reg(227);
        when "11100100" => data_out_reg <= data_in_reg(228);
        when "11100101" => data_out_reg <= data_in_reg(229);
        when "11100110" => data_out_reg <= data_in_reg(230);
        when "11100111" => data_out_reg <= data_in_reg(231);
        when "11101000" => data_out_reg <= data_in_reg(232);
        when "11101001" => data_out_reg <= data_in_reg(233);
        when "11101010" => data_out_reg <= data_in_reg(234);
        when "11101011" => data_out_reg <= data_in_reg(235);
        when "11101100" => data_out_reg <= data_in_reg(236);
        when "11101101" => data_out_reg <= data_in_reg(237);
        when "11101110" => data_out_reg <= data_in_reg(238);
        when "11101111" => data_out_reg <= data_in_reg(239);
        when "11110000" => data_out_reg <= data_in_reg(240);
        when "11110001" => data_out_reg <= data_in_reg(241);
        when "11110010" => data_out_reg <= data_in_reg(242);
        when "11110011" => data_out_reg <= data_in_reg(243);
        when "11110100" => data_out_reg <= data_in_reg(244);
        when "11110101" => data_out_reg <= data_in_reg(245);
        when "11110110" => data_out_reg <= data_in_reg(246);
        when "11110111" => data_out_reg <= data_in_reg(247);
        when "11111000" => data_out_reg <= data_in_reg(248);
        when "11111001" => data_out_reg <= data_in_reg(249);
        when "11111010" => data_out_reg <= data_in_reg(250);
        when "11111011" => data_out_reg <= data_in_reg(251);
        when "11111100" => data_out_reg <= data_in_reg(252);
        when "11111101" => data_out_reg <= data_in_reg(253);
        when "11111110" => data_out_reg <= data_in_reg(254);
        when "11111111" => data_out_reg <= data_in_reg(255);          


        when others => data_out_reg <= 'X';
        end case;
      end if;
  end process;

end structure;
