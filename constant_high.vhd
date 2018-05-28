--
-- Entity: constant_high
-- Architecture : structural
-- Author: dtran6
-- Created On: 9/23/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity constant_high is

  port (
    tie_high   : out std_logic);
end constant_high;

architecture structural of constant_high is

begin

  tie_high <= '1';

end structural;
