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

entity decoder1_2 is

  port (
    sel   	 : in  std_logic;
    output   : out std_logic_vector(1 downto 0));
end decoder1_2;

architecture structural of decoder1_2 is

component inverter
    port (
      input     : in std_logic;
      output    : out std_logic);
end component;
  
for inverter_1, inverter_2, inverter_3: inverter use entity work.inverter(structural);

  signal temp: std_logic;

begin

  inverter_1: inverter port map(sel, temp);
  inverter_2: inverter port map(temp, output(0));
  inverter_3: inverter port map(sel, output(1));

end structural;
