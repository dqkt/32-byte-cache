--
-- Entity: assign8b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/13/17 at 23:50
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity assign8b is

  port (
		input1   : in  std_logic;
		input2   : in  std_logic;
		input3   : in  std_logic;
		input4   : in  std_logic;
		input5   : in  std_logic;
		input6   : in  std_logic;
		input7   : in  std_logic;
		input8   : in  std_logic;
    output   : out std_logic_vector(7 downto 0));
end assign8b;

architecture structural of assign8b is
  
begin

  output(7) <= input1;
  output(6) <= input2;
  output(5) <= input3;
  output(4) <= input4;
  output(3) <= input5;
  output(2) <= input6;
  output(1) <= input7;
  output(0) <= input8;

end structural;	