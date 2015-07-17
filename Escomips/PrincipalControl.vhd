library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.PaqueteControl.all;

entity PrincipalControl is
	port(
	CodFun_IN: in std_logic_vector(3 downto 0); --3-0
	CodOP_IN:in std_logic_vector(4 downto 0); --- 24-20
	banderas: in std_logic_vector(3 downto 0);
	clr :IN  std_logic; 
	clk: IN std_logic;
	LF : IN STD_LOGIC;
	MICRO:OUT std_logic_vector(19 downto 0)	
	);
end PrincipalControl;



architecture Behavioral of PrincipalControl is
	Signal BUS_MEMFUN,Bus_OPCODE: std_logic_vector(19 downto 0);
	Signal OutBanderas:  STD_LOGIC_VECTOR (3 downto 0);
	Signal EQ,NEQ,LT,LET,GT,GET: STD_LOGIC;
	SIGNAL TIPOR,BEQ,BLT,BLE,BGT,BGET,BNEQ :STD_LOGIC;
	SIGNAL SM,SDOP: STD_LOGIC;
	SIGNAL CodOP : STD_LOGIC_VECTOR (4 downto 0);
	SIGNAL CodFun: STD_LOGIC_VECTOR (3 DOWNTO 0);
	Signal NA: std_logic;
	--signal lf: STD_LOGIC;
begin

	DECO_INST_P: DECO_INST Port MAP ( 
				OPCODE =>CodOP_IN,
				TIPOR => TIPOR,
				BEQ => BEQ,
				BNEQ =>BNEQ,
				BLT => BLT,
				BLE => BLE,
				BGT =>BGT,
				BGET => BGET
	);
	
	
	DetectorNivel_P: DetectorNivel port Map(
		clr =>clr,
		clk =>clk,
		na =>NA
	);

	memoriaFuncion_P : MemoriaFuncion PORT MAP(
				Bus_direccion => CodFun_IN,		
				Bus_Datos => BUS_MEMFUN
	);
	CodOP <= "00000" WHEN SDOP='0' ELSE CodOP_IN;

	MemoriaOPCODE_P: MemoriraOPCODE Port MAP(
				Bus_direccion => CodOP,
				Bus_Datos=>Bus_OPCODE
	);
		
	CONDICION_P: CONDICION Port Map(
			  BANDERAS_REG => OutBanderas,
           EQ  => EQ,
           NEQ => NEQ,
           LT => LT,
           LET => LET,
           GT => GT,
           GET => GET
	);
			  
	
	MICRO<= Bus_OPCODE WHEN SM='1'ELSE BUS_MEMFUN;
	CodOP <= "00000" WHEN SDOP='0' ELSE CodOP_IN;
		
				 
	
		FSM_control_P: FSM_control Port MAP( 
				TipoR =>TIPOR,
				beq  => BEQ,
				bneq  =>BNEQ,
				blt  =>BLT,
				ble   =>BLE,
				bgt  =>BGT,
				bget => BGET,
				eq   =>EQ,
				neq   =>NEQ,
				lt   =>LT,
				le   => LET,
				gt    =>GT,
				get  	=>	GET,	 
				na   => NA, --- *******NA*******
				clk => CLK,
				clr => CLR,
				sm => SM,
				sdopc => SDOP
			 );
		
   Reg_edo_P: REG_EDO Port Map( 
				BANDERAS =>banderas,
            CLK => clk,
            CLR => clr,
            LF => LF,
            SALIDA => OutBanderas
	);
	
end Behavioral;

