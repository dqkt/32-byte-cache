--
-- Entity: mux2_5b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:11
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_5b is

  port (
    input1   : in  std_logic_vector(4 downto 0);
    input2   : in  std_logic_vector(4 downto 0);
    sel      : in  std_logic;
    output   : out std_logic_vector(4 downto 0));
end mux2_5b;

architecture structural of mux2_5b is
  
	component mux2_1b
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			sel      : in  std_logic;
			output   : out std_logic);
	end component;
	
	for mux2_1b_1, mux2_1b_2, mux2_1b_3, mux2_1b_4, mux2_1b_5: mux2_1b use entity work.mux2_1b(structural);
	
begin

	mux2_1b_1 : mux2_1b port map(input1(0), input2(0), sel, output(0));
	mux2_1b_2 : mux2_1b port map(input1(1), input2(1), sel, output(1));
	mux2_1b_3 : mux2_1b port map(input1(2), input2(2), sel, output(2));
	mux2_1b_4 : mux2_1b port map(input1(3), input2(3), sel, output(3));
	mux2_1b_5 : mux2_1b port map(input1(4), input2(4), sel, output(4));
	
end structural;
