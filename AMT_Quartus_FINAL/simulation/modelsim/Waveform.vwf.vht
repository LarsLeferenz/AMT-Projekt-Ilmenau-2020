-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "09/06/2017 08:46:35"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          streckendecoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY streckendecoder_vhd_vec_tst IS
END streckendecoder_vhd_vec_tst;
ARCHITECTURE streckendecoder_arch OF streckendecoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL barcode_clock : STD_LOGIC;
SIGNAL barcode_data : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL data_0 : STD_LOGIC;
SIGNAL data_1 : STD_LOGIC;
SIGNAL nextdata : STD_LOGIC;
SIGNAL ready : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT streckendecoder
	PORT (
	barcode_clock : IN STD_LOGIC;
	barcode_data : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	data_0 : OUT STD_LOGIC;
	data_1 : OUT STD_LOGIC;
	nextdata : IN STD_LOGIC;
	ready : OUT STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : streckendecoder
	PORT MAP (
-- list connections between master ports and signals
	barcode_clock => barcode_clock,
	barcode_data => barcode_data,
	clock => clock,
	data_0 => data_0,
	data_1 => data_1,
	nextdata => nextdata,
	ready => ready,
	reset => reset
	);

-- barcode_clock
t_prcs_barcode_clock: PROCESS
BEGIN
	barcode_clock <= '0';
	WAIT FOR 15000 ps;
	barcode_clock <= '1';
	WAIT FOR 5000 ps;
	FOR i IN 1 TO 98
	LOOP
		barcode_clock <= '0';
		WAIT FOR 5000 ps;
		barcode_clock <= '1';
		WAIT FOR 5000 ps;
	END LOOP;
WAIT;
END PROCESS t_prcs_barcode_clock;

-- barcode_data
t_prcs_barcode_data: PROCESS
BEGIN
	barcode_data <= '1';
WAIT;
END PROCESS t_prcs_barcode_data;

-- clock
t_prcs_clock: PROCESS
BEGIN
	clock <= '1';
	WAIT FOR 5000 ps;
	clock <= '0';
	WAIT FOR 1000 ps;
	clock <= '1';
	WAIT FOR 2000 ps;
	FOR i IN 1 TO 248
	LOOP
		clock <= '0';
		WAIT FOR 2000 ps;
		clock <= '1';
		WAIT FOR 2000 ps;
	END LOOP;
WAIT;
END PROCESS t_prcs_clock;

-- nextdata
t_prcs_nextdata: PROCESS
BEGIN
	nextdata <= '0';
	WAIT FOR 260000 ps;
	nextdata <= '1';
	WAIT FOR 6000 ps;
	nextdata <= '0';
	WAIT FOR 7000 ps;
	nextdata <= '1';
	WAIT FOR 7000 ps;
	FOR i IN 1 TO 51
	LOOP
		nextdata <= '0';
		WAIT FOR 7000 ps;
		nextdata <= '1';
		WAIT FOR 7000 ps;
	END LOOP;
	nextdata <= '0';
WAIT;
END PROCESS t_prcs_nextdata;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 10000 ps;
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END streckendecoder_arch;
