--
-- Entity: mux2_1b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/1/17 at 22:54
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1b is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    sel      : in  std_logic;
    output   : out std_logic);
end mux2_1b;

architecture structural of mux2_1b is
  
	component inverter
		port (
			input    : in  std_logic;
			output   : out std_logic);
	end component;
	
	component and2
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			output   : out std_logic);
	end component;
	
	component or2
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			output   : out std_logic);
	end component;
	
	for inverter_1: inverter use entity work.inverter(structural);
	for and2_1, and2_2: and2 use entity work.and2(structural);
	for or2_1: or2 use entity work.or2(structural);
	signal not_sel: std_logic;
	signal not_sel_and_in1: std_logic;
	signal sel_and_in2: std_logic;
	
begin

	inverter_1: inverter port map(sel, not_sel);
	and2_1: and2 port map(not_sel, input1, not_sel_and_in1);
	and2_2: and2 port map(sel, input2, sel_and_in2);
	or2_1: or2 port map(not_sel_and_in1, sel_and_in2, output);
	
end structural;
