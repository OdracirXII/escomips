library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ALU IS
	GENERIC(N : INTEGER:= 16);
	PORT(
			A,B: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			AOP: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			flags:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			S: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
		);
END ALU;


ARCHITECTURE operaciones OF ALU is
begin 

  from: process( A, B,AOP )
  variable EB,P,G,RES: STD_LOGIC_VECTOR(n-1 DOWNTO 0);
  variable C : std_logic_vector ( n downto 0 );
  variable RFZ:STD_LOGIC;
  begin
	 C:=(OTHERS=>'0');
    IF(AOP="0011" OR AOP="0111") THEN
	   C(0):= AOP(2);
      For i IN 0 to n-1 LOOP	
		  EB(i):=B(i) XOR AOP(2);
		  P(i):= A(i) XOR EB(i);
		  G(i):= A(i) AND EB(i);
		  RES(i):=P(i) XOR C(i);
		  C(i+1) := G(i) OR (P(i) AND C(i));
	   End LOOP;
    ELSIF(AOP="0000") THEN
	   RES:=A AND B; 
	 ELSIF(AOP="0001") THEN
	   RES:=A OR B; 
	 ELSIF(AOP="0010" OR AOP="1110") THEN
	   RES:=A XOR B; 
	 ELSIF(AOP="0110" OR AOP="1010") THEN
	   RES:=A XNOR B;
	 ELSIF(AOP="1101") THEN
	   RES:=A NAND B;
	 ELSIF(AOP="1100") THEN
	   RES:=A NOR B; 
    ELSE
	   RES:=(OTHERS=>'0');
    END IF;
	 RFZ:=RES(0);
	 For J IN 1 to n-1 LOOP	
	   RFZ:=RFZ OR RES(J);
	 End LOOP;
	 flags(0)<= C(n);--c
	 flags(1)<=not RFZ;--z
	 flags(2)<= RES(N-1);--n
	 flags(3)<= C(N) XOR C(N-1);--ov
	 S<=RES;
  END PROCESS;
  
--BANDERAS(0) <= '1' WHEN( RESULTADO = X"00" )ELSE '0'; --z
END operaciones;