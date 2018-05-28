--
-- Entity: mux8_8b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/6/17 at 15:40
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_8b is

  port (
    input1   : in  std_logic_vector(7 downto 0);
    input2   : in  std_logic_vector(7 downto 0);
    input3   : in  std_logic_vector(7 downto 0);
    input4   : in  std_logic_vector(7 downto 0);
    input5   : in  std_logic_vector(7 downto 0);
    input6   : in  std_logic_vector(7 downto 0);
    input7   : in  std_logic_vector(7 downto 0);
    input8   : in  std_logic_vector(7 downto 0);
    sel			 : in  std_logic_vector(2 downto 0);
    output   : out std_logic_vector(7 downto 0));
end mux8_8b;

architecture structural of mux8_8b is
  
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
	
	for mux8_1b_1, mux8_1b_2, mux8_1b_3, mux8_1b_4,
      mux8_1b_5, mux8_1b_6, mux8_1b_7, mux8_1b_8: mux8_1b use entity work.mux8_1b(structural);
      
begin

	mux8_1b_1: mux8_1b port map(input1(0), input2(0), input3(0), input4(0), input5(0), input6(0), input7(0), input8(0), sel(2 downto 0), output(0));
	mux8_1b_2: mux8_1b port map(input1(1), input2(1), input3(1), input4(1), input5(1), input6(1), input7(1), input8(1), sel(2 downto 0), output(1));
	mux8_1b_3: mux8_1b port map(input1(2), input2(2), input3(2), input4(2), input5(2), input6(2), input7(2), input8(2), sel(2 downto 0), output(2));
	mux8_1b_4: mux8_1b port map(input1(3), input2(3), input3(3), input4(3), input5(3), input6(3), input7(3), input8(3), sel(2 downto 0), output(3));
	mux8_1b_5: mux8_1b port map(input1(4), input2(4), input3(4), input4(4), input5(4), input6(4), input7(4), input8(4), sel(2 downto 0), output(4));
	mux8_1b_6: mux8_1b port map(input1(5), input2(5), input3(5), input4(5), input5(5), input6(5), input7(5), input8(5), sel(2 downto 0), output(5));
	mux8_1b_7: mux8_1b port map(input1(6), input2(6), input3(6), input4(6), input5(6), input6(6), input7(6), input8(6), sel(2 downto 0), output(6));
	mux8_1b_8: mux8_1b port map(input1(7), input2(7), input3(7), input4(7), input5(7), input6(7), input7(7), input8(7), sel(2 downto 0), output(7));
	
end structural;
