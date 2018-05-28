--
-- Entity: valid_bit
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/5/17 at 18:05
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity valid_bit is

  port (
		rd  		 : in  std_logic;
		wr  		 : in  std_logic;
    new_flag : in  std_logic;
    clk      : in  std_logic;
    flag	   : out std_logic);
end valid_bit;

architecture structural of valid_bit is

	component cache_cell
    port (
      rd  		 : in  std_logic;
      wr  		 : in  std_logic;
      D		     : in  std_logic;
      clk      : in  std_logic;
      Q			   : out std_logic);
	end component;

	for cache_cell_1: cache_cell use entity work.cache_cell(structural);
	
begin

	cache_cell_1: cache_cell port map(rd, wr, new_flag, clk, flag);
	
end structural;
