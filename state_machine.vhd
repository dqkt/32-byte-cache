--
-- Entity: state_machine
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/10/17 at 16:04
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity state_machine is

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
end state_machine;

architecture structural of state_machine is

  component assign1b
    port (
      input    : in  std_logic;
      output   : out std_logic);
  end component;

  component assign5b
    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      input5   : in  std_logic;
      output   : out std_logic_vector(4 downto 0));
  end component;
  
  component assign8b
    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      input5   : in  std_logic;
      input6   : in  std_logic;
      input7   : in  std_logic;
      input8   : in  std_logic;
      output   : out std_logic_vector(7 downto 0));
  end component;
  
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
  
  component or3
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			input3   : in  std_logic;
			output   : out std_logic);
	end component;
  
  component or4
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			input3   : in  std_logic;
			input4   : in  std_logic;
			output   : out std_logic);
	end component;
  
  component and2
		port (
			input1   : in  std_logic;
			input2   : in  std_logic;
			output   : out std_logic);
	end component;
  
  component compare2_5b
    port (
      input1   : in  std_logic_vector(4 downto 0);
      input2   : in  std_logic_vector(4 downto 0);
      output   : out std_logic);
  end component;
  
  component dff                      
    port ( 
      D        : in  std_logic;
      clk      : in  std_logic;
      Q        : out std_logic;
      not_Q    : out std_logic);
  end component; 
  
	component Dlatch
		port ( 
      d   : in  std_logic;
      clk : in  std_logic;
      q   : out std_logic;
      qbar: out std_logic); 
	end component;
  
  component register5b_ff
    port (
      D		     : in  std_logic_vector(4 downto 0);
      clk      : in  std_logic;
      Q			   : out std_logic_vector(4 downto 0));
  end component;

  component constant_low
    port (
      tie_low   : out std_logic);
  end component;
  
  component constant_high
    port (
      tie_high   : out std_logic);
  end component;
  
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
  
  component mux4_1b
    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      sel      : in  std_logic_vector(1 downto 0);
      output   : out std_logic);
  end component;
  
  component mux2_5b
    port (
      input1   : in  std_logic_vector(4 downto 0);
      input2   : in  std_logic_vector(4 downto 0);
      sel      : in  std_logic;
      output   : out std_logic_vector(4 downto 0));
  end component;

  component mux4_5b
    port (
      input1   : in  std_logic_vector(4 downto 0);
      input2   : in  std_logic_vector(4 downto 0);
      input3   : in  std_logic_vector(4 downto 0);
      input4   : in  std_logic_vector(4 downto 0);
      sel			 : in  std_logic_vector(1 downto 0);
      output   : out std_logic_vector(4 downto 0));
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
  
  component mux32_5b
    port (
      input1   : in  std_logic_vector(4 downto 0);
      input2   : in  std_logic_vector(4 downto 0);
      input3   : in  std_logic_vector(4 downto 0);
      input4   : in  std_logic_vector(4 downto 0);
      input5   : in  std_logic_vector(4 downto 0);
      input6   : in  std_logic_vector(4 downto 0);
      input7   : in  std_logic_vector(4 downto 0);
      input8   : in  std_logic_vector(4 downto 0);
      input9   : in  std_logic_vector(4 downto 0);
      input10  : in  std_logic_vector(4 downto 0);
      input11  : in  std_logic_vector(4 downto 0);
      input12  : in  std_logic_vector(4 downto 0);
      input13  : in  std_logic_vector(4 downto 0);
      input14  : in  std_logic_vector(4 downto 0);
      input15  : in  std_logic_vector(4 downto 0);
      input16  : in  std_logic_vector(4 downto 0);
      input17  : in  std_logic_vector(4 downto 0);
      input18  : in  std_logic_vector(4 downto 0);
      input19  : in  std_logic_vector(4 downto 0);
      input20  : in  std_logic_vector(4 downto 0);
      input21  : in  std_logic_vector(4 downto 0);
      input22  : in  std_logic_vector(4 downto 0);
      input23  : in  std_logic_vector(4 downto 0);
      input24  : in  std_logic_vector(4 downto 0);
      input25  : in  std_logic_vector(4 downto 0);
      input26  : in  std_logic_vector(4 downto 0);
      input27  : in  std_logic_vector(4 downto 0);
      input28  : in  std_logic_vector(4 downto 0);
      input29  : in  std_logic_vector(4 downto 0);
      input30  : in  std_logic_vector(4 downto 0);
      input31  : in  std_logic_vector(4 downto 0);
      input32  : in  std_logic_vector(4 downto 0);
      sel			 : in  std_logic_vector(4 downto 0);
      output   : out std_logic_vector(4 downto 0));
  end component;
  
  for constant0: constant_low use entity work.constant_low(structural);
  for constant1: constant_high use entity work.constant_high(structural);
  for U_to_Z_bit_1: U_to_Z_bit use entity work.U_to_Z_bit(structural);
  for byte_Z_mux_1: byte_Z_mux use entity work.byte_Z_mux(structural);
  for inverter_1, inverter_2, inverter_3, inverter_4, inverter_5: inverter use entity work.inverter(structural);
  for and2_1, and2_2, and2_3, and2_4, and2_5, and2_6, and2_7, and2_8, and2_9, and2_10: and2 use entity work.and2(structural);
  for or2_1, or2_2, or2_3, or2_4, or2_5: or2 use entity work.or2(structural);
  for or3_2, or3_3, or3_4, or3_5: or3 use entity work.or3(structural);
  for or4_1, or4_2, or4_3: or4 use entity work.or4(structural);
  for compare2_5b_1, compare2_5b_2, compare2_5b_3, compare2_5b_4, compare2_5b_5, compare2_5b_6,
      compare2_5b_7, compare2_5b_8, compare2_5b_9, compare2_5b_10, compare2_5b_11, compare2_5b_12,
      compare2_5b_13, compare2_5b_14, compare2_5b_15, compare2_5b_16: compare2_5b use entity work.compare2_5b(structural);
  for state: register5b_ff use entity work.register5b_ff(structural);
  for lru_bit, rd_wr_bit, start_bit, rst_bit: dff use entity work.dff(structural);
  for hit_miss_0_bit, hit_miss_1_bit: Dlatch use entity work.Dlatch(structural);
  for assign1b_1, assign1b_2, assign1b_3, assign1b_6: assign1b use entity work.assign1b(structural);
  for assign5b_1, assign5b_2, assign5b_3, assign5b_4, assign5b_5,
      assign5b_6, assign5b_7, assign5b_8, assign5b_9, assign5b_10,
      assign5b_11, assign5b_12, assign5b_13, assign5b_14, assign5b_15,
      assign5b_16, assign5b_17, assign5b_18, assign5b_19, assign5b_20,
      assign5b_21, assign5b_22, assign5b_23, assign5b_24, assign5b_25: assign5b use entity work.assign5b(structural);
  for assign8b_1, assign8b_2, assign8b_3, assign8b_4, assign8b_6: assign8b use entity work.assign8b(structural);
  for mux4_1b_1: mux4_1b use entity work.mux4_1b(structural);
  for mux2_5b_1, mux2_5b_2: mux2_5b use entity work.mux2_5b(structural);
  for mux4_5b_1: mux4_5b use entity work.mux4_5b(structural);
  for mux32_5b_1: mux32_5b use entity work.mux32_5b(structural);
  for mux8_8b_1: mux8_8b use entity work.mux8_8b(structural);
  
  signal constant_0, constant_1: std_logic;
  
  signal busy_temp1, busy_temp2, busy_temp: std_logic;
  
  signal curr_hit_miss_0, curr_hit_miss_1: std_logic;
  signal not_curr_hit_miss_0, not_curr_hit_miss_1: std_logic;
  signal overall_hit_miss, not_overall_hit_miss: std_logic;
  
  signal not_hit_miss_1: std_logic;
  signal temp1, temp2, temp3: std_logic;
    
  signal new_lru, new_lru_temp, curr_lru, not_curr_lru: std_logic;
  
  signal curr_rd_wr, not_curr_rd_wr: std_logic;
  
  signal curr_start, not_curr_start: std_logic;
    
  signal curr_rst, not_curr_rst: std_logic;
  
  signal subclk: std_logic;
  
  signal curr_state, next_state_1, next_state: std_logic_vector(4 downto 0);
  
  signal state0, state1, state2, state3, state4, state5, state6, state7, state8, 
         state9, state10, state11, state12, state13, state14, state15, state16, state17, 
         state18, state19, state20, state21, state22, state23, state24: std_logic_vector(4 downto 0);
           
  signal start_state: std_logic_vector(4 downto 0);
  
  signal op_state_sel: std_logic_vector(1 downto 0);
  signal op_state: std_logic_vector(4 downto 0);
  
  signal is_state_0, is_state_1, is_state_2, is_state_3, is_state_4, is_state_5, is_state_13, 
         is_state_14, is_state_15, is_state_16, is_state_17, is_state_18, is_state_19, is_state_20,
         is_state_22, is_state_24: std_logic;
                 
  signal is_not_idle: std_logic;
                 
  signal is_state_1_or_22: std_logic;
                 
  signal rd_0_temp_1, rd_0_temp_2: std_logic;
  signal rd_1_temp_1, rd_1_temp_2: std_logic;
  
  signal wr_0_temp_1, wr_0_temp_2, wr_0_temp_3: std_logic;
  signal wr_1_temp_1, wr_1_temp_2, wr_1_temp_3: std_logic;
  
  signal wr_from_mem_temp1, wr_from_mem_temp2: std_logic;
  
  signal wr_mem_state: std_logic;
  signal is_RM_wr_state: std_logic;
  
  signal byte_0_add, byte_1_add, byte_2_add, byte_3_add: std_logic_vector(7 downto 0);
  
  signal mem_add_temp: std_logic_vector(7 downto 0);

begin

  constant0: constant_low port map(constant_0);
  constant1: constant_high port map(constant_1);
    
  inverter_1: inverter port map(hit_miss_1, not_hit_miss_1);
  
  mux4_1b_1: mux4_1b port map(curr_lru, hit_miss_0, not_curr_lru, hit_miss_0, op_state_sel, new_lru_temp);
  and2_8: and2 port map(new_lru_temp, not_curr_rst, new_lru);
    
  lru_bit: dff port map(new_lru, is_not_idle, curr_lru, not_curr_lru);
  rst_bit: dff port map(rst, clk, curr_rst, not_curr_rst);
  
  inverter_4: inverter port map(is_state_0, is_not_idle);
  
  and2_1: and2 port map(start, clk, subclk);
  
  start_bit: dff port map(start, subclk, curr_start, not_curr_start);
  
  rd_wr_bit: dff port map(rd_wr, subclk, curr_rd_wr, not_curr_rd_wr);
  
  hit_miss_0_bit: Dlatch port map(hit_miss_0, is_state_1, curr_hit_miss_0, not_curr_hit_miss_0);
  hit_miss_1_bit: Dlatch port map(hit_miss_1, is_state_1, curr_hit_miss_1, not_curr_hit_miss_1);
  
  compare2_5b_12: compare2_5b port map(curr_state, state5, is_state_5);
  inverter_2: inverter port map(is_state_5, cpu_mem);
  
  compare2_5b_9: compare2_5b port map(curr_state, state0, is_state_0);
  compare2_5b_10: compare2_5b port map(curr_state, state4, is_state_4);
  compare2_5b_11: compare2_5b port map(curr_state, state24, is_state_24);
  
  or4_3: or4 port map(is_state_0, is_state_2, is_state_4, is_state_22, busy_temp1);
  or2_5: or2 port map(busy_temp1, is_state_24, busy_temp2);
  
  inverter_5: inverter port map(busy_temp2, busy_temp);
  
  U_to_Z_bit_1: U_to_Z_bit port map(busy_temp, busy);
      
  assign5b_1: assign5b port map(constant_0, constant_0, constant_0, constant_0, constant_0, state0);
  assign5b_2: assign5b port map(constant_0, constant_0, constant_0, constant_0, constant_1, state1);
  assign5b_3: assign5b port map(constant_0, constant_0, constant_0, constant_1, constant_0, state2);
  assign5b_4: assign5b port map(constant_0, constant_0, constant_0, constant_1, constant_1, state3);
  assign5b_5: assign5b port map(constant_0, constant_0, constant_1, constant_0, constant_0, state4);
  assign5b_6: assign5b port map(constant_0, constant_0, constant_1, constant_0, constant_1, state5);
  assign5b_7: assign5b port map(constant_0, constant_0, constant_1, constant_1, constant_0, state6);
  assign5b_8: assign5b port map(constant_0, constant_0, constant_1, constant_1, constant_1, state7);
  assign5b_9: assign5b port map(constant_0, constant_1, constant_0, constant_0, constant_0, state8);
  assign5b_10: assign5b port map(constant_0, constant_1, constant_0, constant_0, constant_1, state9);
  assign5b_11: assign5b port map(constant_0, constant_1, constant_0, constant_1, constant_0, state10);
  assign5b_12: assign5b port map(constant_0, constant_1, constant_0, constant_1, constant_1, state11);
  assign5b_13: assign5b port map(constant_0, constant_1, constant_1, constant_0, constant_0, state12);
  assign5b_14: assign5b port map(constant_0, constant_1, constant_1, constant_0, constant_1, state13);
  assign5b_15: assign5b port map(constant_0, constant_1, constant_1, constant_1, constant_0, state14);
  assign5b_16: assign5b port map(constant_0, constant_1, constant_1, constant_1, constant_1, state15);
  assign5b_17: assign5b port map(constant_1, constant_0, constant_0, constant_0, constant_0, state16);
  assign5b_18: assign5b port map(constant_1, constant_0, constant_0, constant_0, constant_1, state17);
  assign5b_19: assign5b port map(constant_1, constant_0, constant_0, constant_1, constant_0, state18);
  assign5b_20: assign5b port map(constant_1, constant_0, constant_0, constant_1, constant_1, state19);
  assign5b_21: assign5b port map(constant_1, constant_0, constant_1, constant_0, constant_0, state20);
  assign5b_22: assign5b port map(constant_1, constant_0, constant_1, constant_0, constant_1, state21);
  assign5b_23: assign5b port map(constant_1, constant_0, constant_1, constant_1, constant_0, state22);
  assign5b_24: assign5b port map(constant_1, constant_0, constant_1, constant_1, constant_1, state23);
  assign5b_25: assign5b port map(constant_1, constant_1, constant_0, constant_0, constant_0, state24);
    
  or2_1: or2 port map(curr_hit_miss_0, curr_hit_miss_1, overall_hit_miss);
  inverter_3: inverter port map(overall_hit_miss, not_overall_hit_miss);
  
  assign1b_1: assign1b port map(overall_hit_miss, op_state_sel(0));
  assign1b_2: assign1b port map(curr_rd_wr, op_state_sel(1));

  mux2_5b_1: mux2_5b port map(state0, state1, start, start_state);
  
  mux4_5b_1: mux4_5b port map(state23, state3, state5, state2, op_state_sel, op_state);
  
  mux32_5b_1: mux32_5b port map(start_state, op_state, state0, state4, state0, state6, state7, state8, state9, state10, state11, state12, state13, state14, state15, state16, state17, state18, state19, state20, state21, state22, state0, state24, state0, state0, state0, state0, state0, state0, state0, state0, curr_state, next_state_1);
  
  mux2_5b_2: mux2_5b port map(next_state_1, state0, rst, next_state);
  state: register5b_ff port map(next_state, clk, curr_state);
  
  compare2_5b_1: compare2_5b port map(curr_state, state1, is_state_1);
  compare2_5b_2: compare2_5b port map(curr_state, state2, is_state_2);
  compare2_5b_3: compare2_5b port map(curr_state, state22, is_state_22);

  and2_2: and2 port map(is_state_2, curr_hit_miss_0, rd_0_temp_1);
  and2_3: and2 port map(is_state_22, not_curr_lru, rd_0_temp_2);
  or3_2: or3 port map(is_state_1, rd_0_temp_1, rd_0_temp_2, rd_0);
  
  and2_4: and2 port map(is_state_2, curr_hit_miss_1, rd_1_temp_1);
  and2_5: and2 port map(is_state_22, curr_lru, rd_1_temp_2);
  or3_3: or3 port map(is_state_1, rd_1_temp_1, rd_1_temp_2, rd_1);
  
  or2_2: or2 port map(is_state_2, is_state_22, rd_data);
  
  compare2_5b_4: compare2_5b port map(curr_state, state3, is_state_3);
  compare2_5b_5: compare2_5b port map(curr_state, state14, is_state_14);
  compare2_5b_6: compare2_5b port map(curr_state, state16, is_state_16);
  compare2_5b_7: compare2_5b port map(curr_state, state18, is_state_18);
  compare2_5b_8: compare2_5b port map(curr_state, state20, is_state_20);
  
  compare2_5b_13: compare2_5b port map(curr_state, state13, is_state_13);
  compare2_5b_14: compare2_5b port map(curr_state, state15, is_state_15);
  compare2_5b_15: compare2_5b port map(curr_state, state17, is_state_17);
  compare2_5b_16: compare2_5b port map(curr_state, state19, is_state_19);
  
  assign8b_1: assign8b port map(address(7), address(6), address(5), address(4), address(3), address(2), constant_0, constant_0, byte_0_add);
  assign8b_2: assign8b port map(address(7), address(6), address(5), address(4), address(3), address(2), constant_0, constant_1, byte_1_add);
  assign8b_3: assign8b port map(address(7), address(6), address(5), address(4), address(3), address(2), constant_1, constant_0, byte_2_add);
  assign8b_4: assign8b port map(address(7), address(6), address(5), address(4), address(3), address(2), constant_1, constant_1, byte_3_add);
  
  assign8b_6: assign8b port map(address(7), address(6), address(5), address(4), address(3), address(2), constant_0, constant_0, mem_add_temp);
  
  mux8_8b_1: mux8_8b port map(byte_1_add, byte_2_add, byte_2_add, byte_3_add, byte_3_add, byte_0_add, byte_0_add, byte_1_add, curr_state(2 downto 0), wr_from_mem_add);
    
  byte_Z_mux_1: byte_Z_mux port map(mem_add_temp, is_state_5, mem_add);
  
  or4_1: or4 port map(is_state_13, is_state_14, is_state_15, is_state_16, wr_from_mem_temp1);
  or4_2: or4 port map(is_state_17, is_state_18, is_state_19, is_state_20, wr_from_mem_temp2);
  or2_4: or2 port map(wr_from_mem_temp1, wr_from_mem_temp2, wr_mem_state);
  
  assign1b_3: assign1b port map(wr_mem_state, wr_from_mem);
  
  or2_3: or2 port map(wr_mem_state, is_state_5, is_RM_wr_state);

  assign1b_6: assign1b port map(is_state_5, validate);
  
  and2_6: and2 port map(is_state_3, curr_hit_miss_0, wr_0_temp_1);
  and2_7: and2 port map(is_RM_wr_state, not_curr_lru, wr_0_temp_2);
  or3_4: or3 port map(curr_rst, wr_0_temp_1, wr_0_temp_2, wr_0);
  
  and2_9: and2 port map(is_state_3, curr_hit_miss_1, wr_1_temp_1);
  and2_10: and2 port map(is_RM_wr_state, curr_lru, wr_1_temp_2);
  or3_5: or3 port map(curr_rst, wr_1_temp_1, wr_1_temp_2, wr_1);
  
end structural;