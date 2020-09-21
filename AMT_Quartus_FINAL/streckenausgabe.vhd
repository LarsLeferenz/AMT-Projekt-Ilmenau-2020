LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY streckenausgabe IS
    PORT (											--Schnittstellendefinition
        reset           : IN STD_LOGIC; 
        clock           : IN STD_LOGIC;
		  Fahrstrecke		: IN STD_LOGIC_VECTOR (15 downto 0);      
		  ready           : IN STD_LOGIC;
		  timerreturn  	: IN STD_LOGIC;
		  timerstart		: OUT STD_LOGIC;
        st					: OUT STD_LOGIC;
        n					: OUT STD_LOGIC_VECTOR (3 downto 0);
		  a					: OUT STD_LOGIC;
		  b					: OUT STD_LOGIC;
		  c					: OUT STD_LOGIC;
		  d					: OUT STD_LOGIC;
		  e					: OUT STD_LOGIC;
		  f					: OUT STD_LOGIC;
		  g					: OUT STD_LOGIC		  

    );
END streckenausgabe;

architecture Behavioral OF streckenausgabe IS
    type tState is      (   					-- Definition der Zustände
                        z_Standby,
								z_read,
								z_wait,
								z_set,
								z_finished
                    );
						  
-- Variablendeklaration
signal sCurrentState : tState; 
signal sCurrentStateN : tState;
signal sData_0, sData_1: STD_LOGIC;
signal sReady : STD_LOGIC;
signal sFahrstrecke : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal sFahrstreckeC : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal zahl, zahln : INTEGER;


BEGIN

-- Prozess 1: Clock
	 PROCESS (clock,sCurrentStateN)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            sCurrentState <= sCurrentStateN;
        END IF;
    END PROCESS;
	 
-- Prozess 2: Automat
    PROCESS (reset,sCurrentState)
    BEGIN
        IF (reset='0') THEN 								-- Reset
            sCurrentStateN <= z_Standby;
				zahl <= 0;
				zahln <=0;
	
        ELSE 													-- Automat
            CASE sCurrentState IS
                WHEN z_Standby           => if (ready='1') then
                                                                sCurrentStateN <= z_read;
                                                                st <= '1';
                                            else sCurrentStateN <= z_Standby;	
																 st <= '0';
                                            end if;
														 
														  
					 WHEN z_read           	  => if (Fahrstrecke(zahl)='0' AND Fahrstrecke(zahl+1) = '0') then
																a <= '1';
																b <= '0';
																c <= '1';
																d <= '1';
																e <= '0';
																f <= '1';
																g <= '1';
                                            elsif(Fahrstrecke(zahl)='0' AND Fahrstrecke(zahl+1) = '1') then
																a <= '0';
																b <= '0';
																c <= '0';
																d <= '1';
																e <= '1';
																f <= '1';
																g <= '0';
														  elsif(Fahrstrecke(zahl)='1' AND Fahrstrecke(zahl+1) = '0') then
																a <= '1';
																b <= '1';
																c <= '1';
																d <= '0';
																e <= '1';
																f <= '1';
																g <= '1';
                                            else
																a <= '1';
																b <= '0';
																c <= '1';
																d <= '1';
																e <= '1';
																f <= '1';
																g <= '0';
														  end if;
														  
														  if (zahl = 0) then
																n <= "0001";
														  elsif(zahl = 2)then
																n <= "0010";
														  elsif(zahl = 4)then
																n <= "0011";
														  elsif(zahl = 6)then
																n <= "0100";
														  elsif(zahl = 8)then
																n <= "0101";
														  elsif(zahl = 10)then
																n <= "0110";
														  elsif(zahl = 12)then
																n <= "0111";
														  else
																n <= "1000";
														  end if;
														  
														  sCurrentStateN <= z_wait;
														  st <= '1';
														  timerstart <= '1';

					 WHEN z_wait           => if (timerreturn ='1' and zahl = 14) then
																sCurrentStateN <= z_finished;
														  elsif (timerreturn = '1') then
																scurrentStateN <= z_set;
                                            else sCurrentStateN <= z_wait;	    
                                            end if;
														  zahln <= zahl + 2;
														  st <= '1';
														  
					 WHEN z_set            =>    scurrentStateN <= z_read;
														  zahl <= zahln;
														  st <= '1';
														  
					 WHEN z_finished         =>  st <= '0';
														  sCurrentStateN <= z_finished;
														  
            END CASE;					 

        END IF; 
	  END PROCESS;

end architecture;