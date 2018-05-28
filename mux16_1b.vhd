--
-- Entity: mux16_1b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:49
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux16_1b is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    input3   : in  std_logic;
    input4   : in  std_logic;
    input5   : in  std_logic;
    input6   : in  std_logic;
    input7   : in  std_logic;
    input8   : in  std_logic;
    input9   : in  std_logic;
    input10  : in  std_logic;
    input11  : in  std_logic;
    input12  : in  std_logic;
    input13  : in  std_logic;
    input14  : in  std_logic;
    input15  : in  std_logic;
    input16  : in  std_logic;
    sel			 : in  std_logic_vector(3 downto 0);
    output   : out std_logic);
end mux16_1b;

architecture structural of mux16_1b is
  
	component mux8_1b
		port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      input5   : in  std_logic;
      input6   : in  std_logic;
      input7   : in  std_logic;
      input8   : in  std_logic;
      sel			 : in  std_logic_vector(2 downto 0);
      output   : out std_logic);
	end component;
	
  component mux2_1b

    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      sel      : in  std_logic;
      output   : out std_logic);
  end component;
  
	for mux8_1b_1, mux8_1b_2: mux8_1b use entity work.mux8_1b(structural);
	for mux2_1b_1: mux2_1b use entity work.mux2_1b(structural);
	
	signal out_of_1_to_8: std_logic;
	signal out_of_9_to_16: std_logic;
	
begin

	mux8_1b_1: mux8_1b port map(input1, input2, input3, input4, input5, input6, input7, input8, sel(2 downto 0), out_of_1_to_8);
	mux8_1b_2: mux8_1b port map(input9, input10, input11, input12, input13, input14, input15, input16, sel(2 downto 0), out_of_9_to_16);
	mux2_1b_1: mux2_1b port map(out_of_1_to_8, out_of_9_to_16, sel(3), output);
	
end structural;