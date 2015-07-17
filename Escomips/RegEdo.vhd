library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_EDO is
    Port ( BANDERAS : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           LF : in  STD_LOGIC;
           SALIDA : OUT  STD_LOGIC_VECTOR (3 downto 0));
end REG_EDO;

architecture Behavioral of REG_EDO is
begin

	REGISTRO: PROCESS(CLK, CLR)
	BEGIN
		IF(CLR = '1') THEN
			SALIDA <= (OTHERS=>'0');
		ELSIF(FALLING_EDGE(CLK)) THEN
			IF(LF = '1') THEN
				SALIDA <= BANDERAS;
			END IF;
		END IF;
	END PROCESS REGISTRO;
	
end Behavioral;

