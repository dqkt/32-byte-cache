--
-- Entity: mux8_5b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:13
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_5b is

  port (
    input1   : in  std_logic_vector(4 downto 0);
    input2   : in  std_logic_vector(4 downto 0);
    input3   : in  std_logic_vector(4 downto 0);
    input4   : in  std_logic_vector(4 downto 0);
    input5   : in  std_logic_vector(4 downto 0);
    input6   : in  std_logic_vector(4 downto 0);
    input7   : in  std_logic_vector(4 downto 0);
    input8   : in  std_logic_vector(4 downto 0);
    sel			 : in  std_logic_vector(2 downto 0);
    output   : out std_logic_vector(4 downto 0));
end mux8_5b;

architecture structural of mux8_5b is
  
	component mux4_5b
		port (
      input1   : in  std_logic_vector(4 downto 0);
      input2   : in  std_logic_vector(4 downto 0);
      input3   : in  std_logic_vector(4 downto 0);
      input4   : in  std_logic_vector(4 downto 0);
      sel			 : in  std_logic_vector(1 downto 0);
      output   : out std_logic_vector(4 downto 0));
	end component;
	
  component mux2_5b

    port (
      input1   : in  std_logic_vector(4 downto 0);
      input2   : in  std_logic_vector(4 downto 0);
      sel      : in  std_logic;
      output   : out std_logic_vector(4 downto 0));
  end component;
  
	for mux4_5b_1, mux4_5b_2: mux4_5b use entity work.mux4_5b(structural);
	for mux2_5b_1: mux2_5b use entity work.mux2_5b(structural);
	
	signal out_of_1234: std_logic_vector(4 downto 0);
	signal out_of_5678: std_logic_vector(4 downto 0);
	
begin

	mux4_5b_1: mux4_5b port map(input1, input2, input3, input4, sel(1 downto 0), out_of_1234);
	mux4_5b_2: mux4_5b port map(input5, input6, input7, input8, sel(1 downto 0), out_of_5678);
	mux2_5b_1: mux2_5b port map(out_of_1234, out_of_5678, sel(2), output);
	
end structural;