--
-- Entity: assign1b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 22:42
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity assign1b is

  port (
		input    : in  std_logic;
    output   : out std_logic);
end assign1b;

architecture structural of assign1b is
  
begin

  output <= input;

end structural;	