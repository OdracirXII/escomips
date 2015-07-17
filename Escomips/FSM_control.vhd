library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_control is
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
end FSM_control;

architecture Behavioral of FSM_control is
	TYPE ESTADOS IS(A);
	SIGNAL EDO_ACT, EDO_SIG: ESTADOS;
	
begin
--	process(clr,clk)begin
--		if(clr='1')then
--			edo_actual<=A;
--		elsif( rising_edge(clk))then
--			edo_actual<=edo_sig;
--		end if;
--	end process;
	
	TRANSICION: PROCESS(CLK, CLR)
	BEGIN
		IF(CLR='1') THEN
			EDO_ACT <= A;
		ELSIF(RISING_EDGE(CLK)) THEN
			EDO_ACT <= EDO_SIG;
		END IF;
	END PROCESS TRANSICION;
	
	
	AUTOMATA : PROCESS(TIPOR,BEQ,BNEQ,BLT,BLE,BGT,BGET,NA,EQ,NEQ,LT,LE,GT,GET,EDO_ACT)
	BEGIN
		SM 	<= '0';
		SDOPC <= '0';
		CASE( EDO_ACT ) IS
			WHEN A => EDO_SIG <= A;
				IF( TIPOR = '0' )THEN
					IF( BEQ = '1' )THEN
						IF( NA = '1' )THEN
							SM <= '1';
						ELSE
							IF( EQ = '1' )THEN
								SM 	<= '1';
								SDOPC <= '1';
							ELSE
								SM <= '1';
							END IF;
						END IF;
					ELSIF( BNEQ = '1' )THEN
						IF( NA = '1' )THEN
							SM <= '1';
						ELSE
							IF( NEQ = '1' )THEN
								SM 	<= '1';
								SDOPC <= '1';
							ELSE
								SM <= '1';
							END IF;
						END IF;
					ELSIF( BGT = '1' )THEN
							IF( NA = '1' )THEN
							SM <= '1';
						ELSE
							IF( GT = '1' )THEN
								SM 	<= '1';
								SDOPC <= '1';
							ELSE
								SM <= '1';
							END IF;
						END IF;
					ELSIF( BGET = '1' )THEN
							IF( NA = '1' )THEN
							SM <= '1';
						ELSE
							IF( GET = '1' )THEN
								SM 	<= '1';
								SDOPC <= '1';
							ELSE
								SM <= '1';
							END IF;
						END IF;
					ELSIF( BLT = '1' )THEN
							IF( NA = '1' )THEN
							SM <= '1';
						ELSE
							IF( LT = '1' )THEN
								SM 	<= '1';
								SDOPC <= '1';
							ELSE
								SM <= '1';
							END IF;
						END IF;
					ELSIF( BLE = '1' )THEN
						IF( NA = '1' )THEN
							SM <= '1';
						ELSE
							IF( LE = '1' )THEN
								SM 	<= '1';
								SDOPC <= '1';
							ELSE
								SM <= '1';
							END IF;
						END IF;
					ELSE
						SM 	<= '1';
						SDOPC <= '1';
					END IF;
				END IF;
		END CASE;
	END PROCESS AUTOMATA;
	
	
	
	
	
	
	
	
	
	
	
	
--	process(TipoR ,beq , bneq , blt ,ble,  bgt , bget, eq , neq , lt , le , gt , get, na,  clk, edo_actual)
--		begin
--		sdopc <='0';
--		sm<='0';
--			case( edo_actual) is
--				when  A=>	edo_sig<=A;
--						if(tipoR='0')then
--							if(beq='1')then ---
--								if(clk='1')then
--									sdopc<='1';
--								else
--									if(eq='1')then
--										sdopc<='1';
--										sm<='1';
--									else
--										sdopc<='0';
--										sm<='0';
--									end if;
--								end if;
--								--pegar los elsif para cada salto
--							ELSIF( BNEQ = '1' )THEN
--								IF( NA = '1' )THEN
--									SM <= '1';
--								ELSE
--									IF( NEQ = '1' )THEN
--										SM 	<= '1';
--										SDOPC <= '1';
--									ELSE
--										SM <= '1';
--									END IF;
--								END IF;
--							ELSIF( BGT = '1' )THEN
--									IF( NA = '1' )THEN
--									SM <= '1';
--								ELSE
--									IF( GT = '1' )THEN
--										SM 	<= '1';
--										SDOPC <= '1';
--									ELSE
--										SM <= '1';
--									END IF;
--								END IF;
--							ELSIF( BGET = '1' )THEN
--									IF( NA = '1' )THEN
--									SM <= '1';
--								ELSE
--									IF( GET = '1' )THEN
--										SM 	<= '1';
--										SDOPC <= '1';
--									ELSE
--										SM <= '1';
--									END IF;
--								END IF;
--							ELSIF( BLT = '1' )THEN
--									IF( NA = '1' )THEN
--									SM <= '1';
--								ELSE
--									IF( LT = '1' )THEN
--										SM 	<= '1';
--										SDOPC <= '1';
--									ELSE
--										SM <= '1';
--									END IF;
--								END IF;
--							ELSIF( BLE = '1' )THEN
--								IF( NA = '1' )THEN
--									SM <= '1';
--								ELSE
--									IF( LE = '1' )THEN
--										SM 	<= '1';
--										SDOPC <= '1';
--									ELSE
--										SM <= '1';
--									END IF;
--								END IF;
--							ELSE
--								SM 	<= '1';
--								SDOPC <= '1';
--							END IF;
--						END IF;
--				END CASE;
--							
--	end process;
------	
----	TRANSICION: PROCESS(CLK, CLR)
----	BEGIN
----		IF(CLR='1') THEN
----			edo_actual <= A;
----		ELSIF(RISING_EDGE(CLK)) THEN
----			edo_sig <= EDO_SIG;
----		END IF;
----	END PROCESS TRANSICION;
----	



end Behavioral;

