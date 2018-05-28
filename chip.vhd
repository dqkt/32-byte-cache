--
-- Entity: chip
-- Architecture: structural
-- Author: dtran6
-- Created On: 11/13/2017
--

library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity chip is
	port (
    cpu_add    : in  std_logic_vector(7 downto 0);
    cpu_data   : inout  std_logic_vector(7 downto 0);
    cpu_rd_wrn : in  std_logic;
    start      : in  std_logic;
    clk        : in  std_logic;
    reset      : in  std_logic;
    mem_data   : in  std_logic_vector(7 downto 0);
    Vdd        : in  std_logic;
    Gnd        : in  std_logic;
    busy       : out std_logic;
    mem_en     : out std_logic;
    mem_add    : out std_logic_vector(7 downto 0));
end chip;

architecture structural of chip is
  
  component U_to_Z_bit
    port (
      data     : in  std_logic;
      output   : out std_logic);
  end component;
  
  component byte_Z_mux
    port (
      data     : in  std_logic_vector(7 downto 0);
      send_out : in  std_logic;
      output   : out std_logic_vector(7 downto 0));
  end component;

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

  component register8b_ff
    port (
      D		     : in  std_logic_vector(7 downto 0);
      clk      : in  std_logic;
      Q			   : out std_logic_vector(7 downto 0));
  end component;

  component state_machine
    port (
      start    : in  std_logic;
      rd_wr 	 : in  std_logic;
      address  : in  std_logic_vector(7 downto 0);
      hit_miss_0 : in std_logic;
      hit_miss_1 : in std_logic;
      rst	     : in  std_logic;
      clk      : in  std_logic;
      validate : out std_logic;
      cpu_mem  : out std_logic;
      mem_add  : out std_logic_vector(7 downto 0);
      wr_from_mem_add : out std_logic_vector(7 downto 0);
      wr_from_mem : out std_logic;
      rd_data  : out std_logic;
      rd_0     : out std_logic;
      rd_1     : out std_logic;
      wr_0     : out std_logic;
      wr_1     : out std_logic;
      busy     : out std_logic);
  end component;

  component cache8x4B
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
  end component;
  
  component mux2_8b
    port (
      input1   : in  std_logic_vector(7 downto 0);
      input2   : in  std_logic_vector(7 downto 0);
      sel      : in  std_logic;
      output   : out std_logic_vector(7 downto 0));
  end component;
  
  for U_to_Z_bit_1: U_to_Z_bit use entity work.U_to_Z_bit(structural);
  for inverter_1: inverter use entity work.inverter(structural);
  for and2_1: and2 use entity work.and2(structural);
  for address_reg, mem_data_reg, cpu_data_reg: register8b_ff use entity work.register8b_ff(structural);
  for state_machine_1: state_machine use entity work.state_machine(structural);
  for cache_0, cache_1: cache8x4B use entity work.cache8x4B(structural);
  for mux2_8b_1, mux2_8b_2, mux2_8b_3: mux2_8b use entity work.mux2_8b(structural);
  for byte_Z_mux_1: byte_Z_mux use entity work.byte_Z_mux(structural);
  
  signal constantZ: std_logic;
  
  signal subclk, subclk_1: std_logic;
  
  signal validate: std_logic;
  
  signal hit_miss_0, hit_miss_1: std_logic;
  signal rd_0, rd_1, wr_0, wr_1: std_logic;
  signal cache_0_data, cache_1_data: std_logic_vector(7 downto 0);
  
  signal cpu_mem_sel: std_logic;
  
  signal mem_en_temp: std_logic;
  
  signal curr_address, cache_curr_address: std_logic_vector(7 downto 0);
  signal curr_data_in: std_logic_vector(7 downto 0);
  signal curr_mem_data: std_logic_vector(7 downto 0);
  signal curr_cpu_data: std_logic_vector(7 downto 0);
  
  signal cpu_data_temp: std_logic_vector(7 downto 0);
  
  signal wr_from_mem_add: std_logic_vector(7 downto 0);
  
  signal wr_from_mem: std_logic;
  signal rd_data: std_logic;

begin
      
  and2_1: and2 port map(start, clk, subclk);
  
  cpu_data_reg: register8b_ff port map(cpu_data, subclk, curr_cpu_data);
  mem_data_reg: register8b_ff port map(mem_data, clk, curr_mem_data);
  address_reg: register8b_ff port map(cpu_add, subclk, curr_address);
    
  state_machine_1: state_machine port map(start, cpu_rd_wrn, curr_address, hit_miss_0, hit_miss_1, reset, clk, validate, cpu_mem_sel, mem_add, wr_from_mem_add, wr_from_mem, rd_data, rd_0, rd_1, wr_0, wr_1, busy);
  cache_0: cache8x4B port map(validate, curr_data_in, cache_curr_address, rd_0, wr_0, reset, clk, hit_miss_0, cache_0_data);
  cache_1: cache8x4B port map(validate, curr_data_in, cache_curr_address, rd_1, wr_1, reset, clk, hit_miss_1, cache_1_data);
  mux2_8b_1: mux2_8b port map(cache_0_data, cache_1_data, rd_1, cpu_data_temp);
  mux2_8b_2: mux2_8b port map(curr_cpu_data, curr_mem_data, wr_from_mem, curr_data_in);
  mux2_8b_3: mux2_8b port map(curr_address, wr_from_mem_add, wr_from_mem, cache_curr_address);

  byte_Z_mux_1: byte_Z_mux port map(cpu_data_temp, rd_data, cpu_data);

  inverter_1: inverter port map(cpu_mem_sel, mem_en_temp);
  
  U_to_Z_bit_1: U_to_Z_bit port map(mem_en_temp, mem_en);

end structural;
