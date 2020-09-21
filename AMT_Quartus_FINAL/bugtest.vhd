LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bugtest IS
    PORT (
        reset           : IN STD_LOGIC; 
        clock           : IN STD_LOGIC;
        barcode_clock   : IN STD_LOGIC;
        barcode_data    : IN STD_LOGIC;
		  ready 				: OUT STD_LOGIC
    );
END bugtest;

architecture Behavioral OF bugtest IS
    type tState is      (   
                        z_Standby,
								z_decoded_bit0WAIT,
								z_decoded_bit0,
                        z_finished
                    );
signal sCurrentState : tState;
signal sCurrentStateN : tState;
signal sData_0, sData_1: STD_LOGIC;
signal sReady : STD_LOGIC;
signal sFahrstrecke : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');


BEGIN
	 PROCESS (clock,sCurrentStateN)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            sCurrentState <= sCurrentStateN;
        END IF;
    END PROCESS;

    PROCESS (reset,sCurrentState,barcode_clock, barcode_data)
    BEGIN
        IF (reset='0') THEN
            sCurrentStateN <= z_Standby;
            sReady <= '0';
				sFahrstrecke <= (others => '0');
	
        ELSE
				sReady <= '0';
            CASE sCurrentState IS
                WHEN z_Standby           =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit0WAIT;
                                                                sFahrstrecke(0) <= barcode_data;
                                            else sCurrentStateN <= z_Standby;	    
                                            end if;
														  sReady <= '0';
														  
                WHEN z_decoded_bit0WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_finished;
                                            else sCurrentStateN <= z_decoded_bit0WAIT;    
                                            end if; 
														  sReady <= '0';
					 when z_decoded_bit0      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_finished; 
                                                                sFahrstrecke(1) <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit0;    
                                            end if; 
														  sReady <= '0';

					 when z_finished         =>  sCurrentStateN <= z_finished;  
														  
														  sReady <= sFahrstrecke(0);

														  
            END CASE;					 

        END IF; 
	  END PROCESS;
	 
	ready   <=  sReady;
end architecture;