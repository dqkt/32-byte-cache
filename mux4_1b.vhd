--
-- Entity: mux4_1b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/1/17 at 22:54
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1b is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    input3   : in  std_logic;
    input4   : in  std_logic;
    sel      : in  std_logic_vector(1 downto 0);
    output   : out std_logic);
end mux4_1b;

architecture structural of mux4_1b is
  
	component mux2_1b
    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      sel      : in  std_logic;
      output   : out std_logic);
	end component;
	
	for mux2_1b_1, mux2_1b_2, mux2_1b_3: mux2_1b use entity work.mux2_1b(structural);
	
	signal out_of_1_2: std_logic;
	signal out_of_3_4: std_logic;
	
begin

	mux2_1b_1: mux2_1b port map(input1, input2, sel(0), out_of_1_2);
	mux2_1b_2: mux2_1b port map(input3, input4, sel(0), out_of_3_4);
	mux2_1b_3: mux2_1b port map(out_of_1_2, out_of_3_4, sel(1), output);
	
end structural;
