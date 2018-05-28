--
-- Entity: tag3b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/5/17 at 16:44
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity tag3b is

  port (
		rd  		 : in  std_logic;
		wr  		 : in  std_logic;
    new_tag  : in  std_logic_vector(2 downto 0);
    clk      : in  std_logic;
    tag			 : out std_logic_vector(2 downto 0));
end tag3b;

architecture structural of tag3b is

  component cache_cell
    port (
      rd  		 : in  std_logic;
      wr  		 : in  std_logic;
      D		     : in  std_logic;
      clk      : in  std_logic;
      Q			   : out std_logic);
  end component;

	for cache_cell_1, cache_cell_2, cache_cell_3: cache_cell use entity work.cache_cell(structural);
		
begin

	cache_cell_1: cache_cell port map(rd, wr, new_tag(0), clk, tag(0));
	cache_cell_2: cache_cell port map(rd, wr, new_tag(1), clk, tag(1));
	cache_cell_3: cache_cell port map(rd, wr, new_tag(2), clk, tag(2));
	
end structural;
