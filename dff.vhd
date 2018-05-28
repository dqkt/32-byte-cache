--
-- Entity: dff
-- Architecture : structural
-- Author: cpatel2
--

library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity dff is                      
	port ( 
		D        : in  std_logic;
		clk      : in  std_logic;
		Q        : out std_logic;
		not_Q    : out std_logic);
end dff;                          

architecture structural of dff is 

  
begin
  
  output: process                 

  begin                           
    wait until ( clk'EVENT and clk = '0' ); 
    Q <= D;
    not_Q <= not D;
  end process output;        

                             
end structural;  

