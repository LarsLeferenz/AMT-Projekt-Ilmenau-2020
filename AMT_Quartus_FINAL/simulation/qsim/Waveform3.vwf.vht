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
-- Generated on "09/21/2017 12:50:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          timer
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY timer_vhd_vec_tst IS
END timer_vhd_vec_tst;
ARCHITECTURE timer_arch OF timer_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock_in : STD_LOGIC;
SIGNAL delayOut : STD_LOGIC;
SIGNAL delayStart : STD_LOGIC;
COMPONENT timer
	PORT (
	clock_in : IN STD_LOGIC;
	delayOut : OUT STD_LOGIC;
	delayStart : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : timer
	PORT MAP (
-- list connections between master ports and signals
	clock_in => clock_in,
	delayOut => delayOut,
	delayStart => delayStart
	);

-- clock_in
t_prcs_clock_in: PROCESS
BEGIN
LOOP
	clock_in <= '0';
	WAIT FOR 10000 ps;
	clock_in <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock_in;

-- delayStart
t_prcs_delayStart: PROCESS
BEGIN
	delayStart <= '0';
	WAIT FOR 80000 ps;
	delayStart <= '1';
WAIT;
END PROCESS t_prcs_delayStart;
END timer_arch;
