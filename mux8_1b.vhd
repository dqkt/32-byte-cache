--
-- Entity: mux8_1b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:40
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_1b is

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
end mux8_1b;

architecture structural of mux8_1b is
  
	component mux4_1b
		port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      sel			 : in  std_logic_vector(1 downto 0);
      output   : out std_logic);
	end component;
	
  component mux2_1b

    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      sel      : in  std_logic;
      output   : out std_logic);
  end component;
  
	for mux4_1b_1, mux4_1b_2: mux4_1b use entity work.mux4_1b(structural);
	for mux2_1b_1: mux2_1b use entity work.mux2_1b(structural);
	
	signal out_of_1234: std_logic;
	signal out_of_5678: std_logic;
	
begin

	mux4_1b_1: mux4_1b port map(input1, input2, input3, input4, sel(1 downto 0), out_of_1234);
	mux4_1b_2: mux4_1b port map(input5, input6, input7, input8, sel(1 downto 0), out_of_5678);
	mux2_1b_1: mux2_1b port map(out_of_1234, out_of_5678, sel(2), output);
	
end structural;