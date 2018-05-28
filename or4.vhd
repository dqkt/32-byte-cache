--
-- Entity: or4
-- Architecture : structural
-- Author: dtran6
-- Created On: 11/29/2003
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity or4 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    input3   : in  std_logic;
    input4   : in  std_logic;
    output   : out std_logic);
end or4;

architecture structural of or4 is

begin

  output <= input4 or input3 or input2 or input1;

end structural;
