library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timer is
	generic 
	(
	--- Eingangsfrequenz in kHz (default = 10 MHz)
	gInputClockFreq : INTEGER := 10000;	
	--- Verzoegerung in ms (default = 1000ms)
	gDelay : Integer := 1000
	);
	port
	(
		-- input clock
		clock_in					: in 	std_logic;
		delayStart				: in  std_logic;
		-- output clock
		delayOut				: out std_logic
		
	);
-- end interface declaration
end timer;

architecture counters of timer is

	SIGNAL	count				: INTEGER range 0 to (gDelay* gInputClockFreq+100);
	SIGNAL  	clock_tmp		: STD_LOGIC;

BEGIN

PROCESS (clock_in, delayStart)
	BEGIN
		IF rising_edge(clock_in) THEN
			IF (count = (0) and delayStart = '1') THEN
			   count <= 1;
			ELSIF (count < gDelay * gInputClockFreq and count > 0) THEN
				count <= count + 1;
			ELSE
			   count <= 0;
			END IF;
		END IF;
		IF count = gDelay * gInputClockFreq THEN
			clock_tmp <= '1';
		ELSE
			clock_tmp <= '0';
		END IF;	
	END PROCESS;

delayOut  <= clock_tmp;

end counters;
