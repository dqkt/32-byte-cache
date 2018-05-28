--
-- Entity: mux2_8b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/1/17 at 1:35
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_8b is

  port (
    input1   : in  std_logic_vector(7 downto 0);
    input2   : in  std_logic_vector(7 downto 0);
    sel      : in  std_logic;
    output   : out std_logic_vector(7 downto 0));
end mux2_8b;

architecture structural of mux2_8b is
  
	component mux2_1b
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			sel      : in  std_logic;
			output   : out std_logic);
	end component;
	
	for mux2_1b_1, mux2_1b_2, mux2_1b_3, mux2_1b_4, 
			mux2_1b_5, mux2_1b_6, mux2_1b_7, mux2_1b_8: mux2_1b use entity work.mux2_1b(structural);
	
begin

	mux2_1b_1 : mux2_1b port map(input1(0), input2(0), sel, output(0));
	mux2_1b_2 : mux2_1b port map(input1(1), input2(1), sel, output(1));
	mux2_1b_3 : mux2_1b port map(input1(2), input2(2), sel, output(2));
	mux2_1b_4 : mux2_1b port map(input1(3), input2(3), sel, output(3));
	mux2_1b_5 : mux2_1b port map(input1(4), input2(4), sel, output(4));
	mux2_1b_6 : mux2_1b port map(input1(5), input2(5), sel, output(5));
	mux2_1b_7 : mux2_1b port map(input1(6), input2(6), sel, output(6));
	mux2_1b_8 : mux2_1b port map(input1(7), input2(7), sel, output(7));
	
end structural;
