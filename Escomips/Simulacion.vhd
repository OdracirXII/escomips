LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Simulacion IS
END Simulacion;
 
ARCHITECTURE behavior OF Simulacion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PrincipalEscomips
    PORT(
			CLR : in  STD_LOGIC;
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
    END COMPONENT;
    

   --Inputs
   signal CLR : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
	signal clk_outww: std_logic;
   signal salidaPC : std_logic_vector(15 downto 0);	
   signal salida_RD1 : std_logic_vector(15 downto 0);
	signal salida_RD2 : std_logic_vector(15 downto 0);
	signal salida_alu : std_logic_vector(15 downto 0);
	signal salida_D : std_logic_vector(15 downto 0);
	signal salida_instru : std_logic_vector(19 downto 0);
	--signal salida_instru : std_logic_vector(24 downto 0);
	
   -- Clock period definitions
   constant CLK_period : time := 5 ns;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PrincipalEscomips PORT MAP (
          CLR => CLR,
          CLK => CLK,
			 CLK_outww => clk_outww,
          PC => salidaPC,
			 Instruccion => salida_instru,
			  rd1 => salida_RD1,
			  rd2 => salida_RD2,
			  D => salida_D,
			  ALUout =>salida_alu
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
 

    stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		CLR <= '1';
		WAIT UNTIL RISING_EDGE( CLK );
		--WAIT UNTIL RISING_EDGE( CLK );
		CLR <= '0';
      --wait for CLK_period*100*50000000;

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
