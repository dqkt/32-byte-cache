--
-- Entity: decoder2_4
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

entity decoder2_4 is

  port (
    sel      : in  std_logic_vector(1 downto 0);
    output   : out std_logic_vector(3 downto 0));
end decoder2_4;

architecture structural of decoder2_4 is

component decoder1_2
    port (
      sel       : in  std_logic;
      output    : out std_logic_vector(1 downto 0));
end component;

component or2
    port (
      input1    : in std_logic;
      input2    : in std_logic;
      output    : out std_logic);
end component;
  
for decoder1_2_1, decoder1_2_2, decoder1_2_3: decoder1_2 use entity work.decoder1_2(structural);
for or2_1, or2_2, or2_3, or2_4: or2 use entity work.or2(structural);

signal decoder1_out, decoder2_out: std_logic_vector(1 downto 0);
signal decoder3_out: std_logic_vector(1 downto 0);

begin

  decoder1_2_1: decoder1_2 port map (sel(0), decoder1_out);
  decoder1_2_2: decoder1_2 port map (sel(0), decoder2_out);
  decoder1_2_3: decoder1_2 port map (sel(1), decoder3_out);

  or2_1: or2 port map (decoder1_out(0), decoder3_out(0), output(0)); -- OUT0 => 00
  or2_2: or2 port map (decoder1_out(1), decoder3_out(0), output(1)); -- OUT1 => 01
  or2_3: or2 port map (decoder2_out(0), decoder3_out(1), output(2)); -- OUT2 => 10
  or2_4: or2 port map (decoder2_out(1), decoder3_out(1), output(3)); -- OUT3 => 11

end structural;
