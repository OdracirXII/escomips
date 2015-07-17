LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SimulacionEscomips IS
END SimulacionEscomips;
 
ARCHITECTURE behavior OF SimulacionEscomips IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PrincipalEscomips
    PORT(
         CLR : IN  std_logic;
         CLK : IN  std_logic;
         salida : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLR : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(16 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PrincipalEscomips PORT MAP (
          CLR => CLR,
          CLK => CLK,
          salida => salida
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
