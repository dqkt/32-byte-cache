--
-- Entity: register5b_ff
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/10/17 at 16:16
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity register5b_ff is

  port (
    D		     : in  std_logic_vector(4 downto 0);
    clk      : in  std_logic;
    Q			   : out std_logic_vector(4 downto 0));
end register5b_ff;

architecture structural of register5b_ff is

	component dff
    port ( 
      D        : in  std_logic;
      clk      : in  std_logic;
      Q        : out std_logic;
      not_Q    : out std_logic);
  end component;
	
	for dff_1, dff_2, dff_3, dff_4, dff_5: dff use entity work.dff(structural);
	
  signal not_Q: std_logic_vector(4 downto 0);
  
begin

	dff_1: dff port map(D(0), clk, Q(0), not_Q(0));
	dff_2: dff port map(D(1), clk, Q(1), not_Q(1));
	dff_3: dff port map(D(2), clk, Q(2), not_Q(2));
	dff_4: dff port map(D(3), clk, Q(3), not_Q(3));
	dff_5: dff port map(D(4), clk, Q(4), not_Q(4));
	
end structural;
