--
-- Entity: nand2
-- Architecture : structural
-- Author: saressa1
-- Created On: 11/1/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity nand2 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end nand2;

architecture structural of nand2 is

begin

  output <= input1 nand input2;

end structural;
