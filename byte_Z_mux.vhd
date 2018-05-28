--
-- Entity: byte_Z_mux
-- Architecture : structural
-- Author: dtran6
-- Created On: 11/18/2017
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity byte_Z_mux is

  port (
    data     : in  std_logic_vector(7 downto 0);
    send_out : in  std_logic;
    output   : out std_logic_vector(7 downto 0));
end byte_Z_mux;

architecture structural of byte_Z_mux is
  
begin

  output <= data when send_out = '1' else (others => 'Z');

end structural;