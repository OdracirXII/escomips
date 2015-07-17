library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Divisor_Escomips is
    Port ( clk_in, clr : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end Divisor_Escomips;

architecture Behavioral of Divisor_Escomips is
signal aux: std_logic_vector(24 downto 0);
begin
	process(clk_in, clr)
	begin
	if(clr='1') then 
		aux<=(others=>'0');
	elsif(RISING_EDGE(clk_in))then
		aux<=(aux+1);
	end if;
	end process;
clk_out<=aux(24);
end Behavioral;

