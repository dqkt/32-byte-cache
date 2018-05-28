--
-- Entity: U_to_Z_bit
-- Architecture : structural
-- Author: dtran6
-- Created On: 11/19/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity U_to_Z_bit is

  port (
    data     : in  std_logic;
    output   : out std_logic);
end U_to_Z_bit;

architecture structural of U_to_Z_bit is
  
begin

  output <= 'Z' when data = 'U' else data;

end structural;