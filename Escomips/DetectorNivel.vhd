library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity DetectorNivel is
	port(
		clr : in std_logic;
		clk : in std_logic;
		na: out std_logic
	);
	
end DetectorNivel;

architecture Behavioral of DetectorNivel is
	signal pclk : std_logic;
	signal nclk : std_logic;
	
	BEGIN 	
		PROCESS (clr,clk)BEGIN
			if(clr='1') then
				pclk<='0';
			elsif(rising_edge(clk)) then
				pclk<= not(pclk);
			end if;
		END PROCESS;
		
		
		
		PROCESS (clr,clk)BEGIN
			if(clr='1') then
				nclk<='0';
			elsif(falling_edge(clk)) then
				nclk<= not (nclk);
			end if;
		END PROCESS;
		na<= NOT (pclk xor nclk);
		
	
		
end Behavioral;

