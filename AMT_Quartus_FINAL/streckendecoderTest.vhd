LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY streckendecoderTest IS
    PORT (
        reset           : IN STD_LOGIC; 
        clock           : IN STD_LOGIC;
        barcode_clock   : IN STD_LOGIC;
        barcode_data    : IN STD_LOGIC;
        nextdata        : IN STD_LOGIC; 
        ready           : OUT STD_LOGIC;
        data_0          : OUT STD_LOGIC;
        data_1          : OUT STD_LOGIC
    );
END streckendecoderTest;

architecture Behavioral OF streckendecoderTest IS
    type tState is      (   
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
signal sCurrentState : tState;
signal sCurrentStateN : tState;
signal sData_0, sData_1: STD_LOGIC;
signal sReady : STD_LOGIC;
signal sFahrstrecke_0 : STD_LOGIC;
signal sFahrstrecke_1 : STD_LOGIC;
signal sFahrstrecke_2 : STD_LOGIC;
signal sFahrstrecke_3 : STD_LOGIC;
signal sFahrstrecke_4 : STD_LOGIC;
signal sFahrstrecke_5 : STD_LOGIC;
signal sFahrstrecke_6 : STD_LOGIC;
signal sFahrstrecke_7 : STD_LOGIC;
signal sFahrstrecke_8 : STD_LOGIC;
signal sFahrstrecke_9 : STD_LOGIC;
signal sFahrstrecke_10 : STD_LOGIC;
signal sFahrstrecke_11 : STD_LOGIC;
signal sFahrstrecke_12 : STD_LOGIC;
signal sFahrstrecke_13 : STD_LOGIC;
signal sFahrstrecke_14 : STD_LOGIC;
signal sFahrstrecke_15 : STD_LOGIC;



BEGIN

	 PROCESS (clock,sCurrentStateN)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            sCurrentState <= sCurrentStateN;
        END IF;
    END PROCESS;

    PROCESS (reset,sCurrentState,barcode_clock, barcode_data, nextdata)
    BEGIN
        IF (reset='0') THEN
            sCurrentStateN <= z_Standby;
            sReady <= '0';
				data_0 <= '0';
				data_1 <= '0';
				sFahrstrecke_0 <= '0';
				sFahrstrecke_1 <= '0';
				sFahrstrecke_2 <= '0';
				sFahrstrecke_3 <= '0';
				sFahrstrecke_4 <= '0';
				sFahrstrecke_5 <= '0';
				sFahrstrecke_6 <= '0';
				sFahrstrecke_7 <= '0';
				sFahrstrecke_8 <= '0';
				sFahrstrecke_9 <= '0';
				sFahrstrecke_10 <= '0';
				sFahrstrecke_11 <= '0';
				sFahrstrecke_12 <= '0';
				sFahrstrecke_13 <= '0';
				sFahrstrecke_14 <= '0';
				sFahrstrecke_15 <= '0';
	
        ELSE
				sReady <= '0';
				data_0 <= '0';
				data_1 <= '0';
            CASE sCurrentState IS
                WHEN z_Standby           =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit0WAIT;
                                                                sFahrstrecke_0 <= barcode_data;
                                            else sCurrentStateN <= z_Standby;	    
                                            end if;
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
														  
                WHEN z_decoded_bit0WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit0;
                                            else sCurrentStateN <= z_decoded_bit0WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                when z_decoded_bit0      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit1WAIT; 
                                                                sFahrstrecke_1 <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit0;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit1WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit1;
                                            else sCurrentStateN <= z_decoded_bit1WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit1      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit2WAIT;
                                                                sFahrstrecke_2 <= barcode_data;          
                                            else sCurrentStateN <= z_decoded_bit1;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 WHEN z_decoded_bit2WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit2;
                                            else sCurrentStateN <= z_decoded_bit2WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                when z_decoded_bit2      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit3WAIT;
                                                                sFahrstrecke_3 <= barcode_data;                                                                
                                            else sCurrentStateN <= z_decoded_bit2;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit3WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit3;
                                            else sCurrentStateN <= z_decoded_bit3WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit3      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit4WAIT;
                                                                sFahrstrecke_4 <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit3;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit4WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit4;
                                            else sCurrentStateN <= z_decoded_bit4WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit4      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit5WAIT;
                                                                sFahrstrecke_5 <= barcode_data;                                                                
                                            else sCurrentStateN <= z_decoded_bit4;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit5WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit5;
                                            else sCurrentStateN <= z_decoded_bit5WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit5      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit6WAIT;
                                                                sFahrstrecke_6 <= barcode_data;
                                            else sCurrentStateN <= z_decoded_bit5;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit6WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit6;
                                            else sCurrentStateN <= z_decoded_bit6WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0'; 
					 when z_decoded_bit6      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit7WAIT;
                                                                sFahrstrecke_7 <= barcode_data;                                                                
                                            else sCurrentStateN <= z_decoded_bit6;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit7WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit7;
                                            else sCurrentStateN <= z_decoded_bit7WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit7      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit8WAIT;
                                                                sFahrstrecke_8 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit7;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit8WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit8;
                                            else sCurrentStateN <= z_decoded_bit8WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit8      =>  if (barcode_clock='1') then
                                                                sCurrentStateN <= z_decoded_bit9WAIT;
                                                                sFahrstrecke_9 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit8;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit9WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit9;
                                            else sCurrentStateN <= z_decoded_bit9WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit9      =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit10WAIT;
                                                                sFahrstrecke_10 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit9;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit10WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit10;
                                            else sCurrentStateN <= z_decoded_bit10WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit10     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit11WAIT;
                                                                sFahrstrecke_11 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit10;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0'; 
                WHEN z_decoded_bit11WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit11;
                                            else sCurrentStateN <= z_decoded_bit11WAIT;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit11     =>  if (barcode_clock='1') then
                                                                sCurrentStateN <= z_decoded_bit12WAIT;
                                                                sFahrstrecke_12 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit11;    
                                            end if; 
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit12WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit12;
                                            else sCurrentStateN <= z_decoded_bit12WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit12     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit13WAIT;
                                                                sFahrstrecke_13 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit12;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit13WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit13;
                                            else sCurrentStateN <= z_decoded_bit13WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit13     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_decoded_bit14WAIT;
                                                                sFahrstrecke_14 <= barcode_data; 
                                            else sCurrentStateN <= z_decoded_bit13;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                WHEN z_decoded_bit14WAIT  =>  if (barcode_clock='0') then 
                                                                sCurrentStateN <= z_decoded_bit14;
                                            else sCurrentStateN <= z_decoded_bit14WAIT;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
					 when z_decoded_bit14     =>  if (barcode_clock='1') then 
                                                                sCurrentStateN <= z_output_command0;
                                                                sFahrstrecke_15 <= barcode_data;  
                                            else sCurrentStateN <= z_decoded_bit14;    
                                            end if;  
														  sReady <= '0';
														  data_0 <= '0';
														  data_1 <= '0';
                when z_output_command0  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command0WAIT; 
                                            else sCurrentStateN <= z_output_command0;    
                                            end if;  
														  data_0 <= sFahrstrecke_0;
														  data_1 <= sFahrstrecke_1;
														  sReady <= '1';
                when z_output_command0WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command1; 
																 
                                            else sCurrentStateN <= z_output_command0WAIT;    
                                            end if;
														  data_0 <= sFahrstrecke_0;
														  data_1 <= sFahrstrecke_1;
														  sReady <= '1';
					 when z_output_command1  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command1WAIT; 
                                            else sCurrentStateN <= z_output_command1;    
                                            end if;  
														  data_0 <= sFahrstrecke_2;
														  data_1 <= sFahrstrecke_3;
														 sReady <= '1';
														  
                when z_output_command1WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command2; 
                                            else sCurrentStateN <= z_output_command1WAIT;    
                                            end if;   
														  data_0 <= sFahrstrecke_2;
														  data_1 <= sFahrstrecke_3;
														  sReady <= '1';
					 when z_output_command2  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command2WAIT; 
                                            else sCurrentStateN <= z_output_command2;    
                                            end if;   
														  data_0 <= sFahrstrecke_4;
														  data_1 <= sFahrstrecke_5;  
														  sReady <= '1';
                when z_output_command2WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command3; 
                                            else sCurrentStateN <= z_output_command2WAIT;    
                                            end if;   
														  data_0 <= sFahrstrecke_4;
														  data_1 <= sFahrstrecke_5;
														  sReady <= '1';
					 when z_output_command3  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command3WAIT; 
                                            else sCurrentStateN <= z_output_command3;    
                                            end if;   
														  data_0 <= sFahrstrecke_6;
														  data_1 <= sFahrstrecke_7;  
														  sReady <= '1';
                when z_output_command3WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command4; 
                                            else sCurrentStateN <= z_output_command3WAIT;    
                                            end if;   
														  data_0 <= sFahrstrecke_6;
														  data_1 <= sFahrstrecke_7;
														  sReady <= '1';
					 when z_output_command4  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command4WAIT; 
                                            else sCurrentStateN <= z_output_command4;    
                                            end if;   
														  data_0 <= sFahrstrecke_8;
														  data_1 <= sFahrstrecke_9;  
														  sReady <= '1';
                when z_output_command4WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command5; 
                                            else sCurrentStateN <= z_output_command4WAIT;    
                                            end if;   
														  data_0 <= sFahrstrecke_8;
														  data_1 <= sFahrstrecke_9;   
														  sReady <= '1';
					 when z_output_command5  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command5WAIT; 
                                            else sCurrentStateN <= z_output_command5;    
                                            end if;   
														  data_0 <= sFahrstrecke_10;
														  data_1 <= sFahrstrecke_11;  
														  sReady <= '1';
                when z_output_command5WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command6; 
                                            else sCurrentStateN <= z_output_command5WAIT;    
                                            end if; 
														  data_0 <= sFahrstrecke_10;
														  data_1 <= sFahrstrecke_11;  
														  sReady <= '1';
					 when z_output_command6  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command6WAIT; 
                                            else sCurrentStateN <= z_output_command6;    
                                            end if;    
														  data_0 <= sFahrstrecke_12;
														  data_1 <= sFahrstrecke_13; 
														  sReady <= '1';
                when z_output_command6WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_output_command7; 
                                            else sCurrentStateN <= z_output_command6WAIT;    
                                            end if;    
														  data_0 <= sFahrstrecke_12;
														  data_1 <= sFahrstrecke_13;    
														  sReady <= '1';										
                when z_output_command7  =>  if (nextdata='0') then 
																 sCurrentStateN <= z_output_command7WAIT; 
                                            else sCurrentStateN <= z_output_command7;    
                                            end if;    
														  data_0 <= sFahrstrecke_14;
														  data_1 <= sFahrstrecke_15;
														  sReady <= '1';
                when z_output_command7WAIT  =>  if (nextdata='1') then 
																 sCurrentStateN <= z_finished; 
                                            else sCurrentStateN <= z_output_command7WAIT;    
                                            end if;     
														  data_0 <= sFahrstrecke_14;
														  data_1 <= sFahrstrecke_15;  
														  sReady <= '1';
					when z_finished         =>  sCurrentStateN <= z_finished;  
														  data_0 <= '0';
														  data_1 <= '0';
														  sReady <= '1';
					
					when others => sReady <= '1';
										data_0 <= '0';
										data_1 <= '0';

														  
            END CASE;					 

        END IF; 
	  END PROCESS;
	 
	ready   <=  sReady;
end architecture;