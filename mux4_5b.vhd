--
-- Entity: mux4_5b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:13
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_5b is

  port (
    input1   : in  std_logic_vector(4 downto 0);
    input2   : in  std_logic_vector(4 downto 0);
    input3   : in  std_logic_vector(4 downto 0);
    input4   : in  std_logic_vector(4 downto 0);
    sel			 : in  std_logic_vector(1 downto 0);
    output   : out std_logic_vector(4 downto 0));
end mux4_5b;

architecture structural of mux4_5b is
  
  component mux4_1b
    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      sel      : in  std_logic_vector(1 downto 0);
      output   : out std_logic);
  end component;
	
	for mux4_1b_1, mux4_1b_2, mux4_1b_3, mux4_1b_4, mux4_1b_5: mux4_1b use entity work.mux4_1b(structural);
	
begin

	mux4_1b_1: mux4_1b port map(input1(0), input2(0), input3(0), input4(0), sel, output(0));
	mux4_1b_2: mux4_1b port map(input1(1), input2(1), input3(1), input4(1), sel, output(1));
	mux4_1b_3: mux4_1b port map(input1(2), input2(2), input3(2), input4(2), sel, output(2));
	mux4_1b_4: mux4_1b port map(input1(3), input2(3), input3(3), input4(3), sel, output(3));
	mux4_1b_5: mux4_1b port map(input1(4), input2(4), input3(4), input4(4), sel, output(4));
	
end structural;