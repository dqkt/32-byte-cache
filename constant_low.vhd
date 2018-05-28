--
-- Entity: constant_low
-- Architecture : structural
-- Author: dtran6
-- Created On: 9/23/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity constant_low is

  port (
    tie_low   : out std_logic);
end constant_low;

architecture structural of constant_low is

begin

  tie_low <= '0';

end structural;
