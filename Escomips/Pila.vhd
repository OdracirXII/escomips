library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PilaProgram is
	GENERIC(
		NBITS : INTEGER := 16 
			);
	
Port (     D : in  STD_LOGIC_VECTOR (NBITS-1	 downto 0);
           Q : out  STD_LOGIC_VECTOR (NBITS-1 downto 0);
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           UP : in  STD_LOGIC;
           DW : in  STD_LOGIC;
			  --SP1 : OUT INTEGER RANGE 0 TO 7;
           WPC : in  STD_LOGIC);
end PilaProgram;

architecture A_PilaProgram of PilaProgram is
TYPE STACKARR IS ARRAY(7 downto 0) OF STD_LOGIC_VECTOR(NBITS-1 DOWNTO 0);
begin
	PPCS : PROCESS( CLK, CLR )
	VARIABLE SP : INTEGER RANGE 0 TO 7;
	VARIABLE PCS : STACKARR;
	BEGIN
		IF( CLR = '1' )THEN
			PCS := (OTHERS=>(OTHERS=>'0'));			
			SP := 0;
		ELSIF( RISING_EDGE(CLK) )THEN
				IF(WPC='1' AND UP='0' AND DW='0') THEN
					PCS(SP):=D;
				ELSIF(WPC='1' AND UP='1' AND DW='0') THEN
					SP:=SP+1;
					PCS(SP):=D;
				ELSIF(WPC='0' AND UP='0' AND DW='1') THEN
					SP:=SP-1;
					PCS(SP):=(PCS(SP))+1;
				ELSE
					PCS(SP):=(PCS(SP))+1;
				END IF;
		END IF;
		--SP1 <= SP;
		Q <= PCS(SP);
	END PROCESS ;
end A_PilaProgram;

