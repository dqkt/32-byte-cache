--
-- Entity: cache8x4B
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/6/17 at 14:47
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity cache8x4B is

  port (
		validate : in  std_logic;
		data_in	 : in  std_logic_vector(7 downto 0);
		address	 : in  std_logic_vector(7 downto 0);
		rd  		 : in	 std_logic;
		wr  		 : in	 std_logic;
    rst	     : in  std_logic;
    clk      : in  std_logic;
		hit_miss : out std_logic;
		data_out : out std_logic_vector(7 downto 0));
end cache8x4B;

architecture structural of cache8x4B is

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

	component decoder3_8
		port (
			sel			 : in  std_logic_vector(2 downto 0);
			output   : out std_logic_vector(7 downto 0));
	end component;
	
	component block4B
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
	end component;
	
	component mux8_8b
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
	end component;
  
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
	
	for block4B_1, block4B_2, block4B_3, block4B_4, block4B_5, block4B_6, block4B_7, block4B_8: block4B use entity work.block4B(structural); 
	for decoder3_8_1: decoder3_8 use entity work.decoder3_8(structural);
	for inverter_1, inverter_2, inverter_3, inverter_4,
      inverter_5, inverter_6, inverter_7, inverter_8: inverter use entity work.inverter(structural);
  for and2_1, and2_2, and2_3, and2_4, and2_5, and2_6, and2_7, and2_8,
      and2_9, and2_10, and2_11, and2_12, and2_13, and2_14, and2_15, and2_16: and2 use entity work.and2(structural);
  for mux8_8b_1: mux8_8b use entity work.mux8_8b(structural);
	for mux8_1b_1: mux8_1b use entity work.mux8_1b(structural);
  
	signal enable, not_enable: std_logic_vector(7 downto 0);
	signal rd_block, wr_block: std_logic_vector(7 downto 0);
  signal blocks_hit_miss: std_logic_vector(7 downto 0);
	signal block_1_data, block_2_data, block_3_data, block_4_data,
				 block_5_data, block_6_data, block_7_data, block_8_data: std_logic_vector(7 downto 0);
				 
begin

	decoder3_8_1: decoder3_8 port map(address(4 downto 2), enable);
  inverter_1: inverter port map(enable(0), not_enable(0));
  inverter_2: inverter port map(enable(1), not_enable(1));
  inverter_3: inverter port map(enable(2), not_enable(2));
  inverter_4: inverter port map(enable(3), not_enable(3));
  inverter_5: inverter port map(enable(4), not_enable(4));
  inverter_6: inverter port map(enable(5), not_enable(5));
  inverter_7: inverter port map(enable(6), not_enable(6));
  inverter_8: inverter port map(enable(7), not_enable(7));
  and2_1: and2 port map(rd, not_enable(0), rd_block(0));
  and2_2: and2 port map(rd, not_enable(1), rd_block(1));
  and2_3: and2 port map(rd, not_enable(2), rd_block(2));
  and2_4: and2 port map(rd, not_enable(3), rd_block(3));
  and2_5: and2 port map(rd, not_enable(4), rd_block(4));
  and2_6: and2 port map(rd, not_enable(5), rd_block(5));
  and2_7: and2 port map(rd, not_enable(6), rd_block(6));
  and2_8: and2 port map(rd, not_enable(7), rd_block(7));
  and2_9: and2 port map(wr, not_enable(0), wr_block(0));
  and2_10: and2 port map(wr, not_enable(1), wr_block(1));
  and2_11: and2 port map(wr, not_enable(2), wr_block(2));
  and2_12: and2 port map(wr, not_enable(3), wr_block(3));
  and2_13: and2 port map(wr, not_enable(4), wr_block(4));
  and2_14: and2 port map(wr, not_enable(5), wr_block(5));
  and2_15: and2 port map(wr, not_enable(6), wr_block(6));
  and2_16: and2 port map(wr, not_enable(7), wr_block(7));
	block4B_1: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(0), wr_block(0), rst, clk, blocks_hit_miss(0), block_1_data);
	block4B_2: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(1), wr_block(1), rst, clk, blocks_hit_miss(1), block_2_data);
	block4B_3: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(2), wr_block(2), rst, clk, blocks_hit_miss(2), block_3_data);
	block4B_4: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(3), wr_block(3), rst, clk, blocks_hit_miss(3), block_4_data);
	block4B_5: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(4), wr_block(4), rst, clk, blocks_hit_miss(4), block_5_data);
	block4B_6: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(5), wr_block(5), rst, clk, blocks_hit_miss(5), block_6_data);
	block4B_7: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(6), wr_block(6), rst, clk, blocks_hit_miss(6), block_7_data);
	block4B_8: block4B port map(validate, data_in, address(7 downto 5), address(1 downto 0), rd_block(7), wr_block(7), rst, clk, blocks_hit_miss(7), block_8_data);
	mux8_8b_1: mux8_8b port map(block_1_data, block_2_data, block_3_data, block_4_data,
															block_5_data, block_6_data, block_7_data, block_8_data, address(4 downto 2), data_out);
	mux8_1b_1: mux8_1b port map(blocks_hit_miss(0), blocks_hit_miss(1), blocks_hit_miss(2), blocks_hit_miss(3),
                      blocks_hit_miss(4), blocks_hit_miss(5), blocks_hit_miss(6), blocks_hit_miss(7), address(4 downto 2), hit_miss);
  
  
end structural;	