library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;
use IEEE.NUMERIC_BIT.all;
entity ArchivoRegistro is
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
end ArchivoRegistro;

architecture Behavioral of ArchivoRegistro is

Type Arreglo IS ARRAY(0 TO 15) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
Signal Archivo: Arreglo;
begin

--Lectura 
Read_Data1 <= Archivo(conv_integer(Read_Register1));
Read_Data2 <= Archivo(conv_integer(Read_Register2));

PROCESS(clk, clr)
BEGIN
	if(Clr = '1') then
		for i in 0 to 15 loop
			archivo(i) <= (others => '0');
		end loop;
	elsif rising_edge(clk)  then 
		if(Wr = '1' and She = '0') then 
			Archivo(conv_integer(Write_Register)) <= Write_Data;
		elsif (Wr = '0' and She = '1') then 
			if (Dir = '1') then 
				Archivo(conv_integer(Write_Register)) <= to_stdlogicvector(to_bitvector(archivo(conv_integer(Read_Register1))) srl conv_integer(Shamt)); 
			else
				Archivo(conv_integer(Write_Register)) <= to_stdlogicvector(to_bitvector(archivo(conv_integer(Read_Register1))) sll conv_integer(Shamt)); 
			end if;
		end if;
	end if;
END PROCESS;

end Behavioral;

