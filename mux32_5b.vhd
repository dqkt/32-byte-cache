--
-- Entity: mux32_5b
-- Architecture : structural 
-- Author: dtran6
-- Created On: 11/12/17 at 21:13
--
library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity mux32_5b is

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
end mux32_5b;

architecture structural of mux32_5b is

  component mux32_1b
    port (
      input1   : in  std_logic;
      input2   : in  std_logic;
      input3   : in  std_logic;
      input4   : in  std_logic;
      input5   : in  std_logic;
      input6   : in  std_logic;
      input7   : in  std_logic;
      input8   : in  std_logic;
      input9   : in  std_logic;
      input10  : in  std_logic;
      input11  : in  std_logic;
      input12  : in  std_logic;
      input13  : in  std_logic;
      input14  : in  std_logic;
      input15  : in  std_logic;
      input16  : in  std_logic;
      input17  : in  std_logic;
      input18  : in  std_logic;
      input19  : in  std_logic;
      input20  : in  std_logic;
      input21  : in  std_logic;
      input22  : in  std_logic;
      input23  : in  std_logic;
      input24  : in  std_logic;
      input25  : in  std_logic;
      input26  : in  std_logic;
      input27  : in  std_logic;
      input28  : in  std_logic;
      input29  : in  std_logic;
      input30  : in  std_logic;
      input31  : in  std_logic;
      input32  : in  std_logic;
      sel			 : in  std_logic_vector(4 downto 0);
      output   : out std_logic);
  end component;
	
	for mux32_1b_1, mux32_1b_2, mux32_1b_3, mux32_1b_4, mux32_1b_5: mux32_1b use entity work.mux32_1b(structural);
	
begin

	mux32_1b_1: mux32_1b port map(input1(0), input2(0), input3(0), input4(0), input5(0), input6(0), input7(0), input8(0), input9(0), input10(0), input11(0), input12(0), input13(0), input14(0), input15(0), input16(0), input17(0), input18(0), input19(0), input20(0), input21(0), input22(0), input23(0), input24(0), input25(0), input26(0), input27(0), input28(0), input29(0), input30(0), input31(0), input32(0), sel, output(0));
	mux32_1b_2: mux32_1b port map(input1(1), input2(1), input3(1), input4(1), input5(1), input6(1), input7(1), input8(1), input9(1), input10(1), input11(1), input12(1), input13(1), input14(1), input15(1), input16(1), input17(1), input18(1), input19(1), input20(1), input21(1), input22(1), input23(1), input24(1), input25(1), input26(1), input27(1), input28(1), input29(1), input30(1), input31(1), input32(1), sel, output(1));
	mux32_1b_3: mux32_1b port map(input1(2), input2(2), input3(2), input4(2), input5(2), input6(2), input7(2), input8(2), input9(2), input10(2), input11(2), input12(2), input13(2), input14(2), input15(2), input16(2), input17(2), input18(2), input19(2), input20(2), input21(2), input22(2), input23(2), input24(2), input25(2), input26(2), input27(2), input28(2), input29(2), input30(2), input31(2), input32(2), sel, output(2));
	mux32_1b_4: mux32_1b port map(input1(3), input2(3), input3(3), input4(3), input5(3), input6(3), input7(3), input8(3), input9(3), input10(3), input11(3), input12(3), input13(3), input14(3), input15(3), input16(3), input17(3), input18(3), input19(3), input20(3), input21(3), input22(3), input23(3), input24(3), input25(3), input26(3), input27(3), input28(3), input29(3), input30(3), input31(3), input32(3), sel, output(3));
	mux32_1b_5: mux32_1b port map(input1(4), input2(4), input3(4), input4(4), input5(4), input6(4), input7(4), input8(4), input9(4), input10(4), input11(4), input12(4), input13(4), input14(4), input15(4), input16(4), input17(4), input18(4), input19(4), input20(4), input21(4), input22(4), input23(4), input24(4), input25(4), input26(4), input27(4), input28(4), input29(4), input30(4), input31(4), input32(4), sel, output(4));
	
end structural;