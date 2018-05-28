--
-- Entity: assign5b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 22:58
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity assign5b is

  port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		input5   : in  std_logic;
    output   : out std_logic_vector(4 downto 0));
end assign5b;

architecture structural of assign5b is
  
begin

  output(4) <= input1;
  output(3) <= input2;
  output(2) <= input3;
  output(1) <= input4;
  output(0) <= input5;

end structural;	