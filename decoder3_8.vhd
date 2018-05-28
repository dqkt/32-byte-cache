--
-- Entity: decoder3_8
-- Architecture : structural
-- Author: saressa1
-- Created On: 11/1/2017
--

-- This decoder is operating with active low outputs
-- Therefore, if the output to line 1 is 0
--            then line 1 is enabled and all others
--            should be set to 1.



library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity decoder3_8 is

  port (
    sel			 : in  std_logic_vector(2 downto 0);
    output   : out std_logic_vector(7 downto 0));
end decoder3_8;

architecture structural of decoder3_8 is

component or2
	port (
		input1    : in std_logic;
		input2    : in std_logic;
		output    : out std_logic);
end component;

component decoder1_2
  port (
    sel   	 : in  std_logic;
    output   : out std_logic_vector(1 downto 0));
end component;

component decoder2_4
  port (
    sel      : in  std_logic_vector(1 downto 0);
    output   : out std_logic_vector(3 downto 0));
end component;
  
for or2_1, or2_2, or2_3, or2_4, or2_5, or2_6, or2_7, or2_8: or2 use entity work.or2(structural);
for decoder1_2_1: decoder1_2 use entity work.decoder1_2(structural);
for decoder2_4_1, decoder2_4_2: decoder2_4 use entity work.decoder2_4(structural);

signal decoder2_4_1_out, decoder2_4_2_out: std_logic_vector(3 downto 0);
signal decoder1_2_1_out: std_logic_vector(1 downto 0);

begin

  decoder1_2_1: decoder1_2 port map (sel(2), decoder1_2_1_out);
  decoder2_4_1: decoder2_4 port map (sel(1 downto 0), decoder2_4_1_out);
  decoder2_4_2: decoder2_4 port map (sel(1 downto 0), decoder2_4_2_out); 

  or2_1: or2 port map (decoder2_4_1_out(3), decoder1_2_1_out(1), output(7)); -- OUT0 => 000
  or2_2: or2 port map (decoder2_4_1_out(2), decoder1_2_1_out(1), output(6)); -- OUT1 => 001
  or2_3: or2 port map (decoder2_4_1_out(1), decoder1_2_1_out(1), output(5)); -- OUT2 => 010
  or2_4: or2 port map (decoder2_4_1_out(0), decoder1_2_1_out(1), output(4)); -- OUT3 => 011
  or2_5: or2 port map (decoder2_4_2_out(3), decoder1_2_1_out(0), output(3)); -- OUT0 => 100
  or2_6: or2 port map (decoder2_4_2_out(2), decoder1_2_1_out(0), output(2)); -- OUT1 => 101
  or2_7: or2 port map (decoder2_4_2_out(1), decoder1_2_1_out(0), output(1)); -- OUT2 => 110
  or2_8: or2 port map (decoder2_4_2_out(0), decoder1_2_1_out(0), output(0)); -- OUT3 => 111

end structural;
