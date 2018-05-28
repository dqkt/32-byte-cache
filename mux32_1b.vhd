--
-- Entity: mux32_1b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:56
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux32_1b is

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
    input17  : in  std_logic;
    input18  : in  std_logic;
    input19  : in  std_logic;
    input20  : in  std_logic;
    input21  : in  std_logic;
    input22  : in  std_logic;
    input23  : in  std_logic;
    input24  : in  std_logic;
    input25  : in  std_logic;
    input26  : in  std_logic;
    input27  : in  std_logic;
    input28  : in  std_logic;
    input29  : in  std_logic;
    input30  : in  std_logic;
    input31  : in  std_logic;
    input32  : in  std_logic;
    sel			 : in  std_logic_vector(4 downto 0);
    output   : out std_logic);
end mux32_1b;

architecture structural of mux32_1b is
  
	component mux16_1b
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
	end component;
	
  component mux2_1b

    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      sel      : in  std_logic;
      output   : out std_logic);
  end component;
  
	for mux16_1b_1, mux16_1b_2: mux16_1b use entity work.mux16_1b(structural);
	for mux2_1b_1: mux2_1b use entity work.mux2_1b(structural);
	
	signal out_of_1_to_16: std_logic;
	signal out_of_17_to_32: std_logic;
	
begin

	mux16_1b_1: mux16_1b port map(input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, sel(3 downto 0), out_of_1_to_16);
	mux16_1b_2: mux16_1b port map(input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31, input32, sel(3 downto 0), out_of_17_to_32);
	mux2_1b_1: mux2_1b port map(out_of_1_to_16, out_of_17_to_32, sel(4), output);
	
end structural;