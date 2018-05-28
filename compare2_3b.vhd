--
-- Entity: compare2_3b
-- Architecture : structural
-- Author: saressa1
-- Created On: 11/1/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity compare2_3b is

  port (
    input1   : in  std_logic_vector(2 downto 0);
    input2   : in  std_logic_vector(2 downto 0);
    output   : out std_logic);
end compare2_3b;

architecture structural of compare2_3b is

component xnor2
  port (
    input1    : in  std_logic;
    input2    : in  std_logic;
    output    : out std_logic);
end component;

component and3
  port (
    input1    : in  std_logic;
    input2    : in  std_logic;
    input3    : in  std_logic;
    output    : out std_logic);
end component;
  
for xnor2_1, xnor2_2, xnor2_3: xnor2 use entity work.xnor2(structural);
for and3_1: and3 use entity work.and3(structural);

signal temp1, temp2, temp3: std_logic;

begin

  xnor2_1: xnor2 port map (input1(0), input2(0), temp1);
  xnor2_2: xnor2 port map (input1(1), input2(1), temp2);
  xnor2_3: xnor2 port map (input1(2), input2(2), temp3);

  and3_1: and3 port map (temp1, temp2, temp3, output);

end structural;
