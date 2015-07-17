library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity MemoriraOPCODE is
	generic(
		datos_n: integer:= 20;
		dir_n: integer:= 5 );
	port(
		Bus_direccion : in std_logic_vector(dir_n - 1  downto 0);
		Bus_Datos: out std_logic_vector(datos_n -1 downto 0)
	);
	
end MemoriraOPCODE;

architecture Behavioral of MemoriraOPCODE is
	constant COMUN :	std_logic_vector(datos_n -1 downto 0) := "00001000010000111000";-- 00
	constant LI :	std_logic_vector(datos_n -1 downto 0) := "00000000100000000000"; --01
	constant LWI :std_logic_vector(datos_n -1 downto 0) := "00000100100000000100";
	
	constant SWI :	std_logic_vector(datos_n -1 downto 0) := "00001000000000000110";
	constant SW :	std_logic_vector(datos_n -1 downto 0) := "00001000001010011010";
	---	
	constant ADDI :	std_logic_vector(datos_n -1 downto 0) := "00000100110010011001";
	constant SUBI :	std_logic_vector(datos_n -1 downto 0) := "00000100110010111001"; --06
	constant ANDI :	std_logic_vector(datos_n -1 downto 0) := "00000100111010000001"; ---06
	constant ORI :	std_logic_vector(datos_n -1 downto 0) := "00000100111010001001";
	constant XORI :	std_logic_vector(datos_n -1 downto 0) := "00000100111010010001"; --09	
	constant NANDI :std_logic_vector(datos_n -1 downto 0) := "00000100111011101001";-- 10
	constant NORI :	std_logic_vector(datos_n -1 downto 0) := "00000100111011100001"; --11
	constant XNORI :std_logic_vector(datos_n -1 downto 0) := "00000100111011010001";
	
	constant BEQI :	std_logic_vector(datos_n -1 downto 0) := "00110000000110011001";
	constant BNEI :	std_logic_vector(datos_n -1 downto 0) := "00110000000110011001";
	constant BLTI :	std_logic_vector(datos_n -1 downto 0) := "00110000000110011001";
	constant BLETI :	std_logic_vector(datos_n -1 downto 0) := "00110000000110011001";
	constant BGTI :	std_logic_vector(datos_n -1 downto 0) := "00110000000110011001"; --
	constant BGETI :	std_logic_vector(datos_n -1 downto 0) := "00110000000110011001"; ---

	constant B :	std_logic_vector(datos_n -1 downto 0) := "00100000000000000000";
	constant CALL :	std_logic_vector(datos_n -1 downto 0) := "10100000000000000000"; --
	constant RET :	std_logic_vector(datos_n -1 downto 0) := "01000000000000000000";-- 
	constant NOP :	std_logic_vector(datos_n -1 downto 0) := "00000000000000000000"; --
	--constant LW :	std_logic_vector(datos_n -1 downto 0) := "00000100100000011000";
	--constant LW :	std_logic_vector(datos_n -1 downto 0) := "00000100101010011000";
	constant LW :	std_logic_vector(datos_n -1 downto 0) := "00000100101010011000";
	TYPE MEMORIA IS ARRAY (0 TO  2**dir_n) OF std_logic_vector(datos_n -1 DOWNTO 0);
	--TYPE MEMORIA IS ARRAY (0 TO  2**8) OF std_logic_vector(datos_n -1 DOWNTO 0);
	CONSTANT ROM: MEMORIA :=(
		COMUN, LI,LWI,SWI, SW, ADDI,SUBI,
	-- 0		1		2	3	  4	5		6
		ANDI,ORI,XORI,NANDI, --11
	--	7		8	9		10	
		NORI, XNORI,
	-- 11 	12
		BEQI, BNEI, BLTI,BLETI,BGTI,BGETI, B, CALL, RET, NOP, LW, --13
	-- 13		14		15		16		17		18	  19 20 		21  22 	23
				--14  15

		OTHERS=>(OTHERS=>'0')
	);
	BEGIN 
		PROCESS (Bus_direccion) BEGIN
		Bus_Datos<= ROM(CONV_INTEGER(Bus_direccion));
		END PROCESS;
		
end Behavioral;

