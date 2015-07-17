library IEEE;
use IEEE.STD_LOGIC_1164.all;
package PaqueteEscomips is
--decalracion  de componentes de las unidades

component PilaProgram is 
	GENERIC(
		NBITS : INTEGER := 16 
	);
	Port (
			D : in  STD_LOGIC_VECTOR (NBITS-1	 downto 0);
           Q : out  STD_LOGIC_VECTOR (NBITS-1 downto 0);
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           UP : in  STD_LOGIC;
           DW : in  STD_LOGIC;
			  --SP1 : OUT INTEGER RANGE 0 TO 7;
           WPC : in  STD_LOGIC
			  );
end component;

	
COMPONENT MemoriaPrograma is
	generic(
		datos_n: integer:= 25;
		dir_n: integer:= 16	);
	port(
		Bus_direccion : in std_logic_vector(dir_n - 1  downto 0);
		Bus_Datos: out std_logic_vector(datos_n -1 downto 0)
	);
	
end COMPONENT;


COMPONENT ArchivoRegistro is
    Port ( Read_Register1 : in  STD_LOGIC_VECTOR (3 downto 0);
           Read_Register2 : in  STD_LOGIC_VECTOR (3 downto 0);
           Write_Register : in  STD_LOGIC_VECTOR (3 downto 0);
           Shamt : in  STD_LOGIC_VECTOR (3 downto 0);
           Write_Data : in  STD_LOGIC_VECTOR (15 downto 0);
           Read_Data1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Read_Data2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Clk : in  STD_LOGIC;
           Clr : in  STD_LOGIC;
           She : in  STD_LOGIC;
           Dir : in  STD_LOGIC;
           Wr : in  STD_LOGIC);
			  
end COMPONENT;



COMPONENT ALU IS
	GENERIC(N : INTEGER:= 16);
	PORT(
			A,B: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			AOP: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			flags:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
END component;


COMPONENT MemoriaDatos is
	generic(
		datos_n: integer := 16	);
		port(
		WD,CLK : in std_logic;
		BusDir: in std_logic_vector(7 downto 0);		
		BusDatos_in : in std_logic_vector(datos_n-1 downto 0);
		BusDatos_out: out std_logic_vector(datos_n -1 downto 0)
		);
end COMPONENT;

component Divisor_Escomips is
    Port ( clk_in, clr : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;

COMPONENT PrincipalControl is
	port(
	CodFun_IN: in std_logic_vector(3 downto 0); --3-0
	CodOP_IN:in std_logic_vector(4 downto 0); --- 24-20
	banderas: in std_logic_vector(3 downto 0);
	clr :IN  std_logic; 
	clk: IN std_logic;
	LF : IN STD_LOGIC;
	MICRO :OUT std_logic_vector(19 downto 0)	
	);
end COMPONENT;




end PaqueteEscomips;

package body PaqueteEscomips is 
end PaqueteEscomips;
