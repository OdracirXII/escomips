library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MemoriaFuncion is 
	generic(		
		dir_n: integer:= 4;
		datos_n: integer:= 20 );
	port(
		Bus_direccion : in std_logic_vector(dir_n - 1  downto 0);
		Bus_Datos: out std_logic_vector(datos_n -1 downto 0)
	);
	
end MemoriaFuncion;

architecture Behavioral of MemoriaFuncion is

	constant ADD :	std_logic_vector(datos_n -1 downto 0) := "00000100110000011001";-- 00
	constant SUB :	std_logic_vector(datos_n -1 downto 0) := "00000100110000111001"; --01
	constant AND1 :std_logic_vector(datos_n -1 downto 0) := "00000100110000000001";
	constant OR1 :	std_logic_vector(datos_n -1 downto 0) := "00000100110000001001";
	constant XOR1 :	std_logic_vector(datos_n -1 downto 0) := "00000100110000010001";
	constant NAND1 :	std_logic_vector(datos_n -1 downto 0) := "00000100110001101001";
	constant NOR1 :	std_logic_vector(datos_n -1 downto 0) := "00000100110001100001";
	constant XNOR1 :	std_logic_vector(datos_n -1 downto 0) := "00000100110001010001"; --07
	constant NOT1 :	std_logic_vector(datos_n -1 downto 0) := "00000100110001101001"; ---08
	constant SLL1 :	std_logic_vector(datos_n -1 downto 0) := "00000011000000000000";
	constant SRL1 :	std_logic_vector(datos_n -1 downto 0) := "00000010000000000000"; --10
	
	TYPE memoria IS ARRAY (0 to 2**dir_n-1) of std_logic_vector(datos_n -1 downto 0);
	--TYPE memoria IS ARRAY (0 to 2**8) of std_logic_vector(datos_n -1 downto 0);
	CONSTANT ROM: memoria := (
		ADD,SUB,AND1,OR1,XOR1,
		NAND1,NOR1,XNOR1,NOT1,
		SLL1,SRL1,
		others => (others=>'0')		
		);
	BEGIN
	
		PROCESS(Bus_direccion)
		BEGIN
			Bus_Datos<= ROM(CONV_INTEGER(Bus_direccion));
		end process;
end Behavioral;

