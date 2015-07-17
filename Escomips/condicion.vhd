library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONDICION is
    Port ( BANDERAS_REG : in  STD_LOGIC_VECTOR (3 downto 0);
           EQ : out  STD_LOGIC;
           NEQ : out  STD_LOGIC;
           LT : out  STD_LOGIC;
           LET : out  STD_LOGIC;
           GT : out  STD_LOGIC;
           GET : out  STD_LOGIC);
end CONDICION;

architecture Behavioral of CONDICION is
SIGNAL RBAND: STD_LOGIC_VECTOR(3 DOWNTO 0); 
begin

--	 flags(0)<= C(n);--c 
--	 flags(1)<=not RFZ;--z
--	 flags(2)<= RES(N-1);--n
--	 flags(3)<= C(N) XOR C(N-1);--ov
	EQ <= BANDERAS_REG(1);
	NEQ <= NOT(BANDERAS_REG(1));
	LT<=(((BANDERAS_REG(2) xor BANDERAS_REG(3))) and (not(BANDERAS_REG(1))));---<	
	
	GT <= (NOT(BANDERAS_REG(1))) AND (not((BANDERAS_REG(2) XOR BANDERAS_REG(3)))); -->	
	
	GET<=((not(BANDERAS_REG(2) xor BANDERAS_REG(3))) or BANDERAS_REG(1)); --->= 		
	
	LET<=((BANDERAS_REG(2) xor BANDERAS_REG(3)) or BANDERAS_REG(1));  ---- <=


--	 flags(3)<= C(n);--c 
--	 flags(2)<=not RFZ;--z
--	 flags(1)<= RES(N-1);--n
--	 flags(0)<= C(N) XOR C(N-1);--ov

--	EQ <= BANDERAS_REG(2);
--	NEQ <= NOT(BANDERAS_REG(2));
--	LT<=(not((BANDERAS_REG(1) xor BANDERAS_REG(0))) or (not(BANDERAS_REG(2))));---<	
--	GT <= (NOT(BANDERAS_REG(2))) AND (not((BANDERAS_REG(1) XOR BANDERAS_REG(0)))); -->	
--	GET<=((not(BANDERAS_REG(1) xor BANDERAS_REG(0))) or BANDERAS_REG(2)); --->= 		
--	LET<=((BANDERAS_REG(1) xor BANDERAS_REG(0)) or BANDERAS_REG(2));  ---- <=







end Behavioral;

