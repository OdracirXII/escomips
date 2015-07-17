library IEEE;
use IEEE.STD_LOGIC_1164.all;

package PaqueteControl is


	COMPONENT MemoriaFuncion is 
		generic(		
			dir_n: integer:= 4;
			datos_n: integer:= 20 );
		port(
			Bus_direccion : in std_logic_vector(dir_n - 1  downto 0);
			Bus_Datos: out std_logic_vector(datos_n -1 downto 0)
		);	
	end COMPONENT;

	COMPONENT CONDICION is
		 Port ( BANDERAS_REG : in  STD_LOGIC_VECTOR (3 downto 0);
				  EQ : out  STD_LOGIC;
				  NEQ : out  STD_LOGIC;
				  LT : out  STD_LOGIC;
				  LET : out  STD_LOGIC;
				  GT : out  STD_LOGIC;
				  GET : out  STD_LOGIC);
	end COMPONENT;

	COMPONENT DECO_INST is
		 Port ( OPCODE : in  STD_LOGIC_VECTOR (4 downto 0);
				  TIPOR : out  STD_LOGIC;
				  BEQ : out  STD_LOGIC;
				  BNEQ : out  STD_LOGIC;
				  BLT : out  STD_LOGIC;
				  BLE : out  STD_LOGIC;
				  BGT : out  STD_LOGIC;
				  BGET : out  STD_LOGIC
				 );
	end COMPONENT;

	COMPONENT FSM_control is
		 Port ( TipoR : in  STD_LOGIC;		
				  beq:in std_logic;
				  bneq :in std_logic;
				  blt :in std_logic;
				  ble :in std_logic;
				  bgt :in std_logic;
				  bget:in std_logic;
				  eq :in std_logic;
				  neq :in std_logic;
				  lt :in std_logic;
				  le :in std_logic;
				  gt :in std_logic; 
				  get:in std_logic;			 
				  na :in std_logic;
				  clk : in  STD_LOGIC;
				  clr :  in  STD_LOGIC;
				  sm :out std_logic;
				  sdopc : out  STD_LOGIC);
	end COMPONENT;

	COMPONENT MemoriraOPCODE is
		generic(
			datos_n: integer:= 20;
			dir_n: integer:= 5 );
		port(
			Bus_direccion : in std_logic_vector(dir_n - 1  downto 0);
			Bus_Datos: out std_logic_vector(datos_n -1 downto 0)
		);
		
	end COMPONENT;


	COMPONENT REG_EDO is
		 Port ( BANDERAS : in  STD_LOGIC_VECTOR (3 downto 0);
				  CLK : in  STD_LOGIC;
				  CLR : in  STD_LOGIC;
				  LF : in  STD_LOGIC;
				  SALIDA : OUT  STD_LOGIC_VECTOR (3 downto 0));
	end COMPONENT;

	component DetectorNivel is port(
		clr : in std_logic;
		clk : in std_logic;
		na: out std_logic
	);
	end component;
	

end PaqueteControl;

package body PaqueteControl is
 
end PaqueteControl;
