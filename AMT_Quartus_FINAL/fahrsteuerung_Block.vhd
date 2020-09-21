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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"
-- CREATED		"Fri Aug 11 11:18:32 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY fahrsteuerung_Block IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		xkl :  IN  STD_LOGIC;
		xkr :  IN  STD_LOGIC;
		xll :  IN  STD_LOGIC;
		xlr :  IN  STD_LOGIC;
		sl :  IN  STD_LOGIC;
		sr :  IN  STD_LOGIC;
		dl :  IN  STD_LOGIC;
		dr :  IN  STD_LOGIC;
		ac :  IN  STD_LOGIC;
		yml :  OUT  STD_LOGIC;
		ymr :  OUT  STD_LOGIC;
		ymlr :  OUT  STD_LOGIC;
		ymrr :  OUT  STD_LOGIC;
		cl :  OUT  STD_LOGIC;
		cr :  OUT  STD_LOGIC;
		fk :  OUT  STD_LOGIC;
		z0 :  OUT  STD_LOGIC;
		z1 :  OUT  STD_LOGIC;
		z2 :  OUT  STD_LOGIC;
		z3 :  OUT  STD_LOGIC
	);
END fahrsteuerung_Block;

ARCHITECTURE bdf_type OF fahrsteuerung_Block IS 

COMPONENT fahrsteuerung
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 xkl : IN STD_LOGIC;
		 xkr : IN STD_LOGIC;
		 xll : IN STD_LOGIC;
		 xlr : IN STD_LOGIC;
		 sl : IN STD_LOGIC;
		 sr : IN STD_LOGIC;
		 dl : IN STD_LOGIC;
		 dr : IN STD_LOGIC;
		 ac : IN STD_LOGIC;
		 countready : IN STD_LOGIC;
		 yml : OUT STD_LOGIC;
		 ymr : OUT STD_LOGIC;
		 ymlr : OUT STD_LOGIC;
		 ymrr : OUT STD_LOGIC;
		 cl : OUT STD_LOGIC;
		 cr : OUT STD_LOGIC;
		 fk : OUT STD_LOGIC;
		 z0 : OUT STD_LOGIC;
		 z1 : OUT STD_LOGIC;
		 z2 : OUT STD_LOGIC;
		 count : OUT STD_LOGIC;
		 z3 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT prescaler
GENERIC (gInputClockFreq : INTEGER;
			gOutputClockFreq : INTEGER
			);
	PORT(clock_in : IN STD_LOGIC;
		 clock_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : fahrsteuerung
PORT MAP(reset => reset,
		 clock => clock,
		 xkl => xkl,
		 xkr => xkr,
		 xll => xll,
		 xlr => xlr,
		 sl => sl,
		 sr => sr,
		 dl => dl,
		 dr => dr,
		 ac => ac,
		 countready => SYNTHESIZED_WIRE_0,
		 yml => yml,
		 ymr => ymr,
		 ymlr => ymlr,
		 ymrr => ymrr,
		 cl => cl,
		 cr => cr,
		 fk => fk,
		 z0 => z0,
		 z1 => z1,
		 z2 => z2,
		 count => SYNTHESIZED_WIRE_2,
		 z3 => z3);


b2v_inst1 : prescaler
GENERIC MAP(gInputClockFreq => 10000000,
			gOutputClockFreq => 2
			)
PORT MAP(clock_in => SYNTHESIZED_WIRE_1,
		 clock_out => SYNTHESIZED_WIRE_0);


SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_2 AND clock;


END bdf_type;