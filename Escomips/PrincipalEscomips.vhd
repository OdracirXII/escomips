library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.PaqueteEscomips.all;
use work.PaqueteControl.all;

entity PrincipalEscomips is
    Port ( CLR : in  STD_LOGIC;
           CLK : in  STD_LOGIC;	
			  CLK_outww : out  STD_LOGIC;
           PC : out  STD_LOGIC_VECTOR (15 downto 0);
			  Instruccion : out  STD_LOGIC_VECTOR (19 downto 0);
			  --Instruccion : out  STD_LOGIC_VECTOR (24 downto 0);
			  Rd1 : out  STD_LOGIC_VECTOR (15 downto 0);
			  Rd2 : out  STD_LOGIC_VECTOR (15 downto 0);
			  D : out  STD_LOGIC_VECTOR (15 downto 0);
			  ALUout : out  STD_LOGIC_VECTOR (15 downto 0)	  
		);
			  
end PrincipalEscomips;

--ROM CONSTANTE 
--RAM SEÑALES


architecture Behavioral of PrincipalEscomips is
SIGNAL clk_out :STD_LOGIC;
Signal BUS_SDMP: STD_LOGIC_VECTOR(15 DOWNTO 0);
Signal BUS_PILA_MEMPROGRAMA: STD_LOGIC_VECTOR(15 DOWNTO 0);
Signal MICROINSTRU: STD_LOGIC_VECTOR(19 DOWNTO 0);
signal BUS_MEMPROGRAMA: STD_LOGIC_VECTOR(24 DOWNTO 0);
SIGNAL BUS_Read_Register1,BUS_Read_Register2,BUS_Write_Register,BUS_Shamt: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Read_Data1,BUS_Write_Data : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL BUS_SOP1,BUS_SOP2,BUS_ALU,BUS_BusDir: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal BUS_BusDatos_out: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL BUS_SR: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL BUS_SEXT, BUS_SIGNO,BUS_DIRECCION: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL BANDERAS: STD_LOGIC_VECTOR( 3 DOWNTO 0);
SIGNAL AcarreoSalida1: STD_LOGIC;
SIGNAL BUS_SDMD: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL  BUS_Read_Data2,BUS_Read_Data1 : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin	
  		  	
PilaProgram_P: PilaProgram Port map ( 
		     D=>BUS_SDMP,
           Q => BUS_PILA_MEMPROGRAMA,
           --CLK => clk,
			  CLK => clk_out,
           CLR =>clr,
           UP =>MICROINSTRU(19),
           DW => MICROINSTRU(18),			  --SP1 : OUT INTEGER RANGE 0 TO 7;
           WPC => MICROINSTRU(17)
	  );
			  
BUS_SDMP<=BUS_MEMPROGRAMA(15 DOWNTO 0) WHEN MICROINSTRU(16)='0' ELSE BUS_SR;
			  
MemoriaPrograma_P: MemoriaPrograma 	PORT MAP(
		Bus_direccion => BUS_PILA_MEMPROGRAMA,
		Bus_Datos => BUS_MEMPROGRAMA
		);	
	
BUS_Read_Register1<= BUS_MEMPROGRAMA(15 DOWNTO 12);

BUS_Read_Register2<= BUS_MEMPROGRAMA(11 DOWNTO 8) WHEN MICROINSTRU(15) ='0' ELSE BUS_MEMPROGRAMA(19 DOWNTO 16); --sr2
BUS_Write_Register<= BUS_MEMPROGRAMA(19 DOWNTO 16);
BUS_Shamt <=BUS_MEMPROGRAMA(7 DOWNTO 4);
BUS_Write_Data<=BUS_SR WHEN MICROINSTRU(14)='1' ELSE	BUS_MEMPROGRAMA(15 DOWNTO 0); --swd

BUS_SIGNO<= BUS_MEMPROGRAMA(11) & BUS_MEMPROGRAMA(11) & BUS_MEMPROGRAMA(11) & BUS_MEMPROGRAMA(11) & BUS_MEMPROGRAMA(11 DOWNTO 0)	;
BUS_DIRECCION<="0000"&BUS_MEMPROGRAMA(11 DOWNTO 0);

BUS_SEXT<= BUS_SIGNO WHEN MICROINSTRU(9)='0' ELSE BUS_DIRECCION;


 
 
ArchivoRegistro_P: ArchivoRegistro PORT MAP(
		   Read_Register1 => BUS_Read_Register1,
           Read_Register2 => BUS_Read_Register2,
           Write_Register => BUS_Write_Register,			  
           Shamt =>BUS_Shamt,
           Write_Data => BUS_Write_Data, 
           Read_Data1 => BUS_Read_Data1, 
           Read_Data2 => BUS_Read_Data2,
           --Clk => CLK,
			  Clk => clk_out,
           Clr => CLR,
           She => MICROINSTRU(13),
           Dir => MICROINSTRU(12),
           Wr =>MICROINSTRU(11)
	);

BUS_SOP2<= BUS_Read_Data2 WHEN MICROINSTRU(7)='0' ELSE BUS_SEXT; 
BUS_SOP1<= BUS_Read_Data1 WHEN MICROINSTRU(8)='0' ELSE BUS_PILA_MEMPROGRAMA;

ALU_P: ALU 	PORT MAP(
			A => BUS_SOP1,
			B => BUS_SOP2,
			AOP =>MICROINSTRU(6 downto 3),
			flags => BANDERAS,
			S =>BUS_ALU
		);
		
--flags(0)<= C(n);--c
--	 flags(1)<=not RFZ;--z
--	 flags(2)<= RES(N-1);--n
--	 flags(3)<= C(N) XOR C(N-1);--ov

BUS_SDMD<=BUS_ALU WHEN MICROINSTRU(2)='0' ELSE BUS_MEMPROGRAMA(15 DOWNTO 0);

MemoriaDatos_P: MemoriaDatos PORT MAP(
		WD =>MICROINSTRU(1),
		--CLK => CLK,
		CLK => clk_out,
		BusDir => BUS_SDMD(7 downto 0),
		BusDatos_in =>BUS_Read_Data2,
		BusDatos_out => BUS_BusDatos_out
	);	
			 
BUS_SR <= BUS_BusDatos_out WHEN MICROINSTRU(0)='0' ELSE BUS_ALU;

PrincipalControl_P: PrincipalControl port map(
	CodFun_IN =>BUS_MEMPROGRAMA( 3 DOWNTO 0),
	CodOP_IN => BUS_MEMPROGRAMA(24 DOWNTO 20),
	banderas => BANDERAS,
	clr  => CLR,
	--Clk =>CLK, 
	clk => clk_out,
	LF=> MICROINSTRU(10), -----*****
	MICRO => MICROINSTRU
	);
--Instancia DIVISOR
 DIVISOR : Divisor_Escomips 
 Port map(
			clk_in => clk,
			clr => clr,
			clk_out => clk_out);--iiiiii

PC <= BUS_PILA_MEMPROGRAMA;
Instruccion <= MICROINSTRU;
--Instruccion <= BUS_MEMPROGRAMA;
Rd1<=BUS_Read_Data1;
rd2<=BUS_Read_Data2;
aluout<=BUS_ALU;
D <= BUS_BusDatos_out;
CLK_outww <= clk_out;
end Behavioral; 

