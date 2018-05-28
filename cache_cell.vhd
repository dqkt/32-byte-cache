--
-- Entity: cache_cell
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/10/17 at 14:13
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache_cell is

  port (
		rd  		 : in  std_logic;
		wr  		 : in  std_logic;
    D		     : in  std_logic;
    clk      : in  std_logic;
    Q			   : out std_logic);
end cache_cell;

architecture structural of cache_cell is

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
	
	component Dlatch
		port ( 
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic;
      qbar: out std_logic); 
	end component;
  
  component tx
    port ( 
      sel   : in std_logic;
      selnot: in std_logic;
      input : in std_logic;
      output: out std_logic);
  end component;
	
  for inverter_1: inverter use entity work.inverter(structural);
	for and2_1: and2 use entity work.and2(structural);
	for dlatch_1: Dlatch use entity work.Dlatch(structural);
  for tx_1: tx use entity work.tx(structural);
	
	signal not_stored_bit: std_logic;
  signal not_rd: std_logic;
  signal stored_bit: std_logic;
	signal subclk: std_logic;
	
begin

  inverter_1: inverter port map(rd, not_rd);
	and2_1: and2 port map(wr, clk, subclk);
	dlatch_1: dlatch port map(D, subclk, stored_bit, not_stored_bit);
  tx_1: tx port map(rd, not_rd, stored_bit, Q);
	
end structural;
