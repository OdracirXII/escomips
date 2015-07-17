library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MemoriaDatos is
	generic(
		datos_n: integer := 16	);
		port(
		WD,CLK : in std_logic;
		BusDir: in std_logic_vector(7 downto 0);		
		BusDatos_in : in std_logic_vector(datos_n-1 downto 0);
		BusDatos_out: out std_logic_vector(datos_n -1 downto 0)
		);
end MemoriaDatos;

architecture Behavioral of MemoriaDatos is
	Type Memoria is Array (0 to (2**8)-1 ) of
	--Type Memoria is Array (0 to 2**8) of
	std_logic_vector(datos_n -1 downto 0);
	signal RAM :Memoria;	
begin
	BusDatos_out<=RAM(CONV_INTEGER(BusDir));
	process(CLK) 
	begin
		if rising_edge(clk) then
		
			if(WD='1') then 			
				RAM(CONV_INTEGER(BusDir)) <= BusDatos_in;
			end if;
		end if;	
		
	end process;
	

end Behavioral;

