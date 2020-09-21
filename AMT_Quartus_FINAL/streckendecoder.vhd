LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY streckendecoder IS
    GENERIC(
		gClockFreq: Integer := 10_000_000 -- in Hz
		); 
	 PORT (											--SChnittstellendefinition
        reset           : IN STD_LOGIC; 
        clock           : IN STD_LOGIC;
        barcode_clock   : IN STD_LOGIC;
        barcode_data    : IN STD_LOGIC;
        nextdata        : IN STD_LOGIC; 
        ready           : OUT STD_LOGIC;
        data_0          : OUT STD_LOGIC;
        data_1          : OUT STD_LOGIC;
		  stop				: OUT STD_LOGIC;
		  Fahrstrecke		: OUT STD_LOGIC_VECTOR (15 downto 0)
    );
END streckendecoder;

architecture Behavioral OF streckendecoder IS
    type tState is      (   					-- Definition der Zustände7
								z_init,
                        z_Standby,
								z_decoded_bit0WAIT,
                        z_decoded_bit0,
                        z_decoded_bit1WAIT,
                        z_decoded_bit1,
                        z_decoded_bit2WAIT,
                        z_decoded_bit2,
                        z_decoded_bit3WAIT,
                        z_decoded_bit3,
                        z_decoded_bit4WAIT,
                        z_decoded_bit4,
                        z_decoded_bit5WAIT,
                        z_decoded_bit5,
                        z_decoded_bit6WAIT,
                        z_decoded_bit6,
                        z_decoded_bit7WAIT,
                        z_decoded_bit7,
                        z_decoded_bit8WAIT,
                        z_decoded_bit8,
                        z_decoded_bit9WAIT,
                        z_decoded_bit9,
                        z_decoded_bit10WAIT,
                        z_decoded_bit10,
                        z_decoded_bit11WAIT,
                        z_decoded_bit11,
                        z_decoded_bit12WAIT,
                        z_decoded_bit12,
                        z_decoded_bit13WAIT,
                        z_decoded_bit13,
                        z_decoded_bit14WAIT,
								z_decoded_bit14,
								z_save,
								z_saveWAIT,
                        z_output_command0,
								z_output_command0WAIT,
                        z_output_command1,
								z_output_command1WAIT,
                        z_output_command2,
								z_output_command2WAIT,
                        z_output_command3,
								z_output_command3WAIT,
                        z_output_command4,
								z_output_command4WAIT,
                        z_output_command5,
								z_output_command5WAIT,
                        z_output_command6,
								z_output_command6WAIT,
								z_output_command7,
								z_output_command7WAIT,
                        z_finished
                    );
						  
-- Variablendeklaration
signal sCurrentState : tState; 
signal sCurrentStateN : tState;
signal sData_0, sData_1: STD_LOGIC;
signal sReady : STD_LOGIC;
signal sFahrstrecke : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal sFahrstreckeC : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal delaystart : STD_LOGIC;
signal delaycount : Integer range 0 to 10 * gClockFreq;
signal delayFinished : STD_LOGIC;


BEGIN

-- Prozess 1: Clock
	 PROCESS (clock,sCurrentStateN)
    BEGIN
		  if (reset = '0') then
				sCurrentState <= z_init;
        elsIF (clock='1' AND clock'event) THEN
            sCurrentState <= sCurrentStateN;
        END IF;
    END PROCESS;
	 
-- Prozess 2: Automat
    PROCESS (reset,sCurrentState,barcode_clock, barcode_data, nextdata)
    BEGIN
												-- Automat

            CASE sCurrentState IS
						 
					 when z_init 				 => sCurrentStateN <= z_Standby;
															sReady <= '0';
															data_0 <= '0';
															data_1 <= '0';
															sFahrstrecke <= "0000000000000000";
															delayStart <= '0';
															
                WHEN z_Standby           =>  if (barcode_clock='1') then 											-- Einlesen der Daten
                                                                sCurrentStateN <= z_decoded_bit0WAIT;
                                                                sFahrstrecke(0) <= barcode_data;
                                            else sCurrentStateN <= z_Standby;	    
                                            end if;
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit0WAIT  =>  if (barcode_clock='0') then 											-- Warten auf LOW Flanke
                                                                sCurrentStateN <= z_decoded_bit0;
                                            else sCurrentStateN <= z_decoded_bit0WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                when z_decoded_bit0      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit1WAIT; 
                                                                sFahrstrecke(1) <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit0;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit1WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit1;
                                            else sCurrentStateN <= z_decoded_bit1WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit1      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit2WAIT;
                                                                sFahrstrecke(2) <= barcode_data;          
                                            else sCurrentStateN <= z_decoded_bit1;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 WHEN z_decoded_bit2WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit2;
                                            else sCurrentStateN <= z_decoded_bit2WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                when z_decoded_bit2      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit3WAIT;
                                                                sFahrstrecke(3) <= barcode_data;                                                                
                                            else sCurrentStateN <= z_decoded_bit2;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit3WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit3;
                                            else sCurrentStateN <= z_decoded_bit3WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit3      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit4WAIT;
                                                                sFahrstrecke(4) <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit3;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit4WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit4;
                                            else sCurrentStateN <= z_decoded_bit4WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit4      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit5WAIT;
                                                                sFahrstrecke(5) <= barcode_data;                                                                
                                            else sCurrentStateN <= z_decoded_bit4;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit5WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit5;
                                            else sCurrentStateN <= z_decoded_bit5WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit5      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit6WAIT;
                                                                sFahrstrecke(6) <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit5;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit6WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit6;
                                            else sCurrentStateN <= z_decoded_bit6WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit6      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit7WAIT;
                                                                sFahrstrecke(7) <= barcode_data;                                                                
                                            else sCurrentStateN <= z_decoded_bit6;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit7WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit7;
                                            else sCurrentStateN <= z_decoded_bit7WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit7      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit8WAIT;
                                                                sFahrstrecke(8) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit7;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit8WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit8;
                                            else sCurrentStateN <= z_decoded_bit8WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit8      =>  if (barcode_clock='1') then
                                                                sCurrentStateN <= z_decoded_bit9WAIT;
                                                                sFahrstrecke(9) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit8;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit9WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit9;
                                            else sCurrentStateN <= z_decoded_bit9WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit9      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit10WAIT;
                                                                sFahrstrecke(10) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit9;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit10WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit10;
                                            else sCurrentStateN <= z_decoded_bit10WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit10     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit11WAIT;
                                                                sFahrstrecke(11) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit10;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0'; 
														  delayStart <= '0';
														  
                WHEN z_decoded_bit11WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit11;
                                            else sCurrentStateN <= z_decoded_bit11WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit11     =>  if (barcode_clock='1') then
                                                                sCurrentStateN <= z_decoded_bit12WAIT;
                                                                sFahrstrecke(12) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit11;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit12WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit12;
                                            else sCurrentStateN <= z_decoded_bit12WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit12     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit13WAIT;
                                                                sFahrstrecke(13) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit12;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit13WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit13;
                                            else sCurrentStateN <= z_decoded_bit13WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit13     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit14WAIT;
                                                                sFahrstrecke(14) <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit13;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
                WHEN z_decoded_bit14WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit14;
                                            else sCurrentStateN <= z_decoded_bit14WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_decoded_bit14     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_save;
                                                                sFahrstrecke(15) <= barcode_data;  
                                            else sCurrentStateN <= z_decoded_bit14;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  stop <= '0';
														  delayStart <= '0';
														  
					 when z_save 				 =>  if(barcode_clock = '0' AND barcode_data = '0') then     	-- Uebertragen der Daten
																					 sCurrentStateN <= z_saveWAIT;
																			else   sCurrentStateN <= z_save;
																			end if;
																					 data_0 <= '0';
																					 data_1 <= '0';
																					 stop <= '0';
																					 sReady <= '0';
																					 delayStart <= '1';
					 
					 when z_saveWAIT         => if(delayfinished = '1') then
																sCurrentStateN <= z_output_command0;
															else sCurrentStateN <= z_saveWAIT;
															end if;
															data_0 <= sFahrstreckeC(0);
															data_1 <= sFahrstreckeC(1);
															delayStart <= '0';
															stop <= '1';
															sReady <= '0';
					 
                when z_output_command0  =>  if (nextdata = '0') then 												-- Ausgeben der Daten
																 sCurrentStateN <= z_output_command0WAIT; 
                                            else sCurrentStateN <= z_output_command0;    
                                            end if;  
														  data_0 <= sFahrstreckeC(0);
														  data_1 <= sFahrstreckeC(1);
														  sReady <= '1';
														  stop <= '0';
														  
                when z_output_command0WAIT  =>  if (nextdata='1') then 											--Warten auf HIGH Flanke
																 sCurrentStateN <= z_output_command1; 
																 
                                            else sCurrentStateN <= z_output_command0WAIT;    
                                            end if;
														  data_0 <= sFahrstreckeC(0);
														  data_1 <= sFahrstreckeC(1);
														  sReady <= '1';
														  
					 when z_output_command1  =>  if (nextdata='0') then 												--Naechste Daten ausgeben
																 sCurrentStateN <= z_output_command1WAIT; 
                                            else sCurrentStateN <= z_output_command1;    
                                            end if;  
														  data_0 <= sFahrstreckeC(2);
														  data_1 <= sFahrstreckeC(3);
														 sReady <= '1';
														  
                when z_output_command1WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command2; 
                                            else sCurrentStateN <= z_output_command1WAIT;    
                                            end if;   
														  data_0 <= sFahrstreckeC(2);
														  data_1 <= sFahrstreckeC(3);
														  sReady <= '1';
														  
					 when z_output_command2  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command2WAIT; 
                                            else sCurrentStateN <= z_output_command2;    
                                            end if;   
														  data_0 <= sFahrstreckeC(4);
														  data_1 <= sFahrstreckeC(5);  
														  sReady <= '1';
														  
                when z_output_command2WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command3; 
                                            else sCurrentStateN <= z_output_command2WAIT;    
                                            end if;   
														  data_0 <= sFahrstreckeC(4);
														  data_1 <= sFahrstreckeC(5);
														  sReady <= '1';
														  
					 when z_output_command3  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command3WAIT; 
                                            else sCurrentStateN <= z_output_command3;    
                                            end if;   
														  data_0 <= sFahrstreckeC(6);
														  data_1 <= sFahrstreckeC(7);  
														  sReady <= '1';
														  
                when z_output_command3WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command4; 
                                            else sCurrentStateN <= z_output_command3WAIT;    
                                            end if;   
														  data_0 <= sFahrstreckeC(6);
														  data_1 <= sFahrstreckeC(7);
														  sReady <= '1';
														  
					 when z_output_command4  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command4WAIT; 
                                            else sCurrentStateN <= z_output_command4;    
                                            end if;   
														  data_0 <= sFahrstreckeC(8);
														  data_1 <= sFahrstreckeC(9);  
														  sReady <= '1';
														  
                when z_output_command4WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command5; 
                                            else sCurrentStateN <= z_output_command4WAIT;    
                                            end if;   
														  data_0 <= sFahrstreckeC(8);
														  data_1 <= sFahrstreckeC(9);   
														  sReady <= '1';
														  
					 when z_output_command5  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command5WAIT; 
                                            else sCurrentStateN <= z_output_command5;    
                                            end if;   
														  data_0 <= sFahrstreckeC(10);
														  data_1 <= sFahrstreckeC(11);  
														  sReady <= '1';
														  
                when z_output_command5WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command6; 
                                            else sCurrentStateN <= z_output_command5WAIT;    
                                            end if; 
														  data_0 <= sFahrstreckeC(10);
														  data_1 <= sFahrstreckeC(11);  
														  sReady <= '1';
														  
					 when z_output_command6  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command6WAIT; 
                                            else sCurrentStateN <= z_output_command6;    
                                            end if;    
														  data_0 <= sFahrstreckeC(12);
														  data_1 <= sFahrstreckeC(13); 
														  sReady <= '1';
														  
                when z_output_command6WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command7; 
                                            else sCurrentStateN <= z_output_command6WAIT;    
                                            end if;    
														  data_0 <= sFahrstreckeC(12);
														  data_1 <= sFahrstreckeC(13);    
														  sReady <= '1';		
														  
                when z_output_command7  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command7WAIT; 
                                            else sCurrentStateN <= z_output_command7;    
                                            end if;    
														  data_0 <= sFahrstreckeC(14);
														  data_1 <= sFahrstreckeC(15);
														  sReady <= '1';
														  
                when z_output_command7WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_finished; 
                                            else sCurrentStateN <= z_output_command7WAIT;    
                                            end if;     
														  data_0 <= sFahrstreckeC(14);
														  data_1 <= sFahrstreckeC(15);  
														  sReady <= '1';
														  
					when z_finished         =>  sCurrentStateN <= z_finished;  							-- Endzustand
														  data_0 <= '0';
														  data_1 <= '0';
														  sReady <= '1';
					
					when others => sReady <= '1'; 																--Default Zustand
										data_0 <= '0';
										data_1 <= '0';
														  
            END CASE;					 

END PROCESS;
	Fahrstrecke <= sFahrstrecke;
	sFahrstreckeC <= sFahrstrecke;
	ready   <=  sReady; --Feste Logik
	
PROCESS (clock, delayStart, reset)
	BEGIN
		if (reset = '0' ) then
			delaycount <= 0;
			delayFinished <= '0';
		elsIF rising_edge(clock) THEN
			IF (delayCount = 0 and delayStart = '1') THEN
			   delayCount <= 1;
			ELSIF (delayCount < 5 * gClockFreq and delayCount > 0) THEN
				delaycount <= delaycount + 1;
			ELSIF(delayStart ='0') then
				delaycount <= 0;
			END IF;
		
		
			IF (delayCount = 5 * gClockFreq)then
				delayFinished <= '1';
			ELSE
				delayFinished <= '0';
			END IF;
		END IF;
	END PROCESS;
	
end architecture;