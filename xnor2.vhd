--
-- Entity: xnor2
-- Architecture : structural
-- Author: saressa1
-- Created On: 11/1/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xnor2 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end xnor2;

architecture structural of xnor2 is

component nand2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

for nand2_1, nand2_2, nand2_3, nand2_4, nand2_5: nand2 use entity work.nand2(structural);

signal temp1, temp2, temp3, temp4: std_logic;

begin
  
  nand2_1: nand2 port map (input1, input2, temp1);
  nand2_2: nand2 port map (input1, temp1, temp2);
  nand2_3: nand2 port map (input2, temp1, temp3);
  nand2_4: nand2 port map (temp2, temp3, temp4);
  nand2_5: nand2 port map (temp4, temp4, output);
  
end structural;
