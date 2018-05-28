--
-- Entity: block4B
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/5/17 at 16:46
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity block4B is

  port (
		validate : in  std_logic;
		data_in	 : in  std_logic_vector(7 downto 0);
		tag			 : in  std_logic_vector(2 downto 0);
		byte_sel : in  std_logic_vector(1 downto 0);
		rd  		 : in	 std_logic;
		wr  		 : in	 std_logic;
    rst	     : in  std_logic;
    clk      : in  std_logic;
		hit_miss : out std_logic;
		data_out : out std_logic_vector(7 downto 0));
end block4B;

architecture structural of block4B is

	component inverter	
		port (
			input    : in  std_logic;
			output   : out std_logic);
	end component;
  
  component or2
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			output   : out std_logic);
	end component;
  
	component compare2_3b
		port (
			input1   : in  std_logic_vector(2 downto 0);
			input2   : in  std_logic_vector(2 downto 0);
			output   : out std_logic);
	end component;

	component and2
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			output   : out std_logic);
	end component;
	
	component valid_bit
    port (
      rd  		 : in  std_logic;
      wr  		 : in  std_logic;
      new_flag : in  std_logic;
      clk      : in  std_logic;
      flag	   : out std_logic);
	end component;
	
	component tag3b
    port (
      rd  		 : in  std_logic;
      wr  		 : in  std_logic;
      new_tag  : in  std_logic_vector(2 downto 0);
      clk      : in  std_logic;
      tag			 : out std_logic_vector(2 downto 0));
	end component;
	
	component decoder2_4
	  port (
			sel      : in  std_logic_vector(1 downto 0);
			output   : out std_logic_vector(3 downto 0));
	end component;
	
	component register8b
    port (
      rd  		 : in  std_logic;
      wr  		 : in  std_logic;
      D		     : in  std_logic_vector(7 downto 0);
      clk      : in  std_logic;
      Q			   : out std_logic_vector(7 downto 0));
	end component;
	
	component mux4_8b
	  port (
			input1   : in  std_logic_vector(7 downto 0);
			input2   : in  std_logic_vector(7 downto 0);
			input3   : in  std_logic_vector(7 downto 0);
			input4   : in  std_logic_vector(7 downto 0);
			sel			 : in  std_logic_vector(1 downto 0);
			output   : out std_logic_vector(7 downto 0));
	end component;
  
  for inverter_1, inverter_2, inverter_3, inverter_4, inverter_5: inverter use entity work.inverter(structural);
	for or2_1: or2 use entity work.or2(structural);
  for compare2_3b_1: compare2_3b use entity work.compare2_3b(structural);
	for and2_1, and2_2, and2_3, and2_4, and2_5,
      and2_6, and2_7, and2_8, and2_9, and2_10, and2_11: and2 use entity work.and2(structural);
	for valid_bit_1: valid_bit use entity work.valid_bit(structural);
	for tag3b_1: tag3b use entity work.tag3b(structural);
	for decoder2_4_1: decoder2_4 use entity work.decoder2_4(structural);
	for byte_1, byte_2,
			byte_3, byte_4: register8b use entity work.register8b(structural);
	for mux4_8b_1: mux4_8b use entity work.mux4_8b(structural);
	
  signal not_rst: std_logic;
	signal new_valid: std_logic;
  signal curr_valid: std_logic;
	signal curr_tag: std_logic_vector(2 downto 0);
	signal tags_match: std_logic;
	signal enable, not_enable: std_logic_vector(3 downto 0);
	signal rd_byte: std_logic_vector(3 downto 0);
	signal wr_byte: std_logic_vector(3 downto 0);
	signal byte_1_data, byte_2_data, byte_3_data, byte_4_data: std_logic_vector(7 downto 0);
	signal valid_wr_temp, valid_wr: std_logic;
  
begin

  inverter_1: inverter port map(rst, not_rst);
  and2_11: and2 port map(validate, wr, valid_wr_temp);
  or2_1: or2 port map(valid_wr_temp, rst, valid_wr);
  and2_1: and2 port map(not_rst, validate, new_valid);
	valid_bit_1: valid_bit port map(rd, valid_wr, new_valid, clk, curr_valid);
	tag3b_1: tag3b port map(rd, wr, tag, clk, curr_tag);
	compare2_3b_1: compare2_3b port map(tag, curr_tag, tags_match);
	and2_2: and2 port map(curr_valid, tags_match, hit_miss);
	decoder2_4_1: decoder2_4 port map(byte_sel, enable);
  inverter_2: inverter port map(enable(0), not_enable(0));
  inverter_3: inverter port map(enable(1), not_enable(1));
  inverter_4: inverter port map(enable(2), not_enable(2));
  inverter_5: inverter port map(enable(3), not_enable(3));
  and2_3: and2 port map(rd, not_enable(0), rd_byte(0));
  and2_4: and2 port map(rd, not_enable(1), rd_byte(1));
  and2_5: and2 port map(rd, not_enable(2), rd_byte(2));
  and2_6: and2 port map(rd, not_enable(3), rd_byte(3));
  and2_7: and2 port map(wr, not_enable(0), wr_byte(0));
  and2_8: and2 port map(wr, not_enable(1), wr_byte(1));
  and2_9: and2 port map(wr, not_enable(2), wr_byte(2));
  and2_10: and2 port map(wr, not_enable(3), wr_byte(3));
	byte_1: register8b port map(rd_byte(0), wr_byte(0), data_in, clk, byte_1_data);
	byte_2: register8b port map(rd_byte(1), wr_byte(1), data_in, clk, byte_2_data);
	byte_3: register8b port map(rd_byte(2), wr_byte(2), data_in, clk, byte_3_data);
	byte_4: register8b port map(rd_byte(3), wr_byte(3), data_in, clk, byte_4_data);
	mux4_8b_1: mux4_8b port map(byte_1_data, byte_2_data, byte_3_data, byte_4_data, byte_sel, data_out);

end structural;
