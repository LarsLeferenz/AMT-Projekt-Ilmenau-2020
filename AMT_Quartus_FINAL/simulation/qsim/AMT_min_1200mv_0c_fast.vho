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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "09/12/2017 11:27:51"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	streckendecoder IS
    PORT (
	reset : IN std_logic;
	clock : IN std_logic;
	barcode_clock : IN std_logic;
	barcode_data : IN std_logic;
	nextdata : IN std_logic;
	ready : BUFFER std_logic;
	data_0 : BUFFER std_logic;
	data_1 : BUFFER std_logic
	);
END streckendecoder;

-- Design Ports Information
-- ready	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_0	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_1	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- barcode_clock	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- barcode_data	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nextdata	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF streckendecoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_barcode_clock : std_logic;
SIGNAL ww_barcode_data : std_logic;
SIGNAL ww_nextdata : std_logic;
SIGNAL ww_ready : std_logic;
SIGNAL ww_data_0 : std_logic;
SIGNAL ww_data_1 : std_logic;
SIGNAL \Selector26~6clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ready~output_o\ : std_logic;
SIGNAL \data_0~output_o\ : std_logic;
SIGNAL \data_1~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \nextdata~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \barcode_data~input_o\ : std_logic;
SIGNAL \barcode_clock~input_o\ : std_logic;
SIGNAL \sCurrentStateN.z_Standby~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_Standby~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit0WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit0WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit0~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit0~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit1WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit1WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit1~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit1~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit2WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit2WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit2~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit2~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit3WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit3WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit3~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit3~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit4WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit4WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit4~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit4~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit5WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit5WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit5~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit5~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit6WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit6WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit6~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit6~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit7WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit7WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit7~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit7~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit8WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit8WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit8~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit8~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit9WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit9WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit9~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit9~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit10WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit10WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit10~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit10~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit11WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit11WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit11~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit11~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit12WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit12WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit12~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit12~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit13WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit13WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit13~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit13~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit14WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit14WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_decoded_bit14~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_decoded_bit14~q\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_save~q\ : std_logic;
SIGNAL \Selector26~6_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command0~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command0WAIT~1_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command0WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command1~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command1~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command1WAIT~1_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command1WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command2~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command2~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command2WAIT~1_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command2WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command3~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command3~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command3WAIT~1_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command3WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command4~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command4~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command4WAIT~1_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command4WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command5~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command5~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command5WAIT~1_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command5WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command6~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command6~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command6WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command6WAIT~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command7~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command7~q\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command7WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_output_command7WAIT~q\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \sCurrentState.z_finished~q\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \Selector26~2_combout\ : std_logic;
SIGNAL \Selector26~1_combout\ : std_logic;
SIGNAL \Selector26~4_combout\ : std_logic;
SIGNAL \Selector26~3_combout\ : std_logic;
SIGNAL \Selector26~5_combout\ : std_logic;
SIGNAL \sReady~0_combout\ : std_logic;
SIGNAL \sFahrstrecke[2]~6_combout\ : std_logic;
SIGNAL \Selector26~6clkctrl_outclk\ : std_logic;
SIGNAL \sFahrstrecke[0]~7_combout\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command0WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command1WAIT~0_combout\ : std_logic;
SIGNAL \data_0~5_combout\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command2WAIT~0_combout\ : std_logic;
SIGNAL \sFahrstrecke[6]~4_combout\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command3WAIT~0_combout\ : std_logic;
SIGNAL \sFahrstrecke[4]~5_combout\ : std_logic;
SIGNAL \data_0~4_combout\ : std_logic;
SIGNAL \sFahrstrecke[12]~0_combout\ : std_logic;
SIGNAL \data_0~0_combout\ : std_logic;
SIGNAL \sFahrstrecke[8]~2_combout\ : std_logic;
SIGNAL \sFahrstrecke[10]~1_combout\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command5WAIT~0_combout\ : std_logic;
SIGNAL \sCurrentStateN.z_output_command4WAIT~0_combout\ : std_logic;
SIGNAL \data_0~1_combout\ : std_logic;
SIGNAL \sFahrstrecke[14]~3_combout\ : std_logic;
SIGNAL \data_0~2_combout\ : std_logic;
SIGNAL \data_0~3_combout\ : std_logic;
SIGNAL \data_0~6_combout\ : std_logic;
SIGNAL \sFahrstrecke[11]~10_combout\ : std_logic;
SIGNAL \sFahrstrecke[9]~9_combout\ : std_logic;
SIGNAL \data_1~1_combout\ : std_logic;
SIGNAL \sFahrstrecke[13]~8_combout\ : std_logic;
SIGNAL \data_1~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \data_1~2_combout\ : std_logic;
SIGNAL \sFahrstrecke[7]~12_combout\ : std_logic;
SIGNAL \sFahrstrecke[5]~11_combout\ : std_logic;
SIGNAL \data_1~3_combout\ : std_logic;
SIGNAL \sFahrstrecke[3]~14_combout\ : std_logic;
SIGNAL \sFahrstrecke[1]~13_combout\ : std_logic;
SIGNAL \data_1~4_combout\ : std_logic;
SIGNAL \data_1~5_combout\ : std_logic;
SIGNAL sFahrstreckeC : std_logic_vector(15 DOWNTO 0);
SIGNAL sFahrstrecke : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_reset <= reset;
ww_clock <= clock;
ww_barcode_clock <= barcode_clock;
ww_barcode_data <= barcode_data;
ww_nextdata <= nextdata;
ready <= ww_ready;
data_0 <= ww_data_0;
data_1 <= ww_data_1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Selector26~6clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Selector26~6_combout\);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X20_Y34_N23
\ready~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sReady~0_combout\,
	devoe => ww_devoe,
	o => \ready~output_o\);

-- Location: IOOBUF_X20_Y34_N9
\data_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_0~6_combout\,
	devoe => ww_devoe,
	o => \data_0~output_o\);

-- Location: IOOBUF_X29_Y34_N16
\data_1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \data_1~5_combout\,
	devoe => ww_devoe,
	o => \data_1~output_o\);

-- Location: IOIBUF_X25_Y34_N15
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G14
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X20_Y34_N15
\nextdata~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nextdata,
	o => \nextdata~input_o\);

-- Location: IOIBUF_X9_Y34_N22
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: IOIBUF_X23_Y34_N15
\barcode_data~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_barcode_data,
	o => \barcode_data~input_o\);

-- Location: IOIBUF_X23_Y34_N22
\barcode_clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_barcode_clock,
	o => \barcode_clock~input_o\);

-- Location: LCCOMB_X24_Y33_N18
\sCurrentStateN.z_Standby~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_Standby~0_combout\ = (\reset~input_o\ & ((\sCurrentState.z_Standby~q\) # (\barcode_clock~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datac => \sCurrentState.z_Standby~q\,
	datad => \barcode_clock~input_o\,
	combout => \sCurrentStateN.z_Standby~0_combout\);

-- Location: FF_X24_Y33_N19
\sCurrentState.z_Standby\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_Standby~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_Standby~q\);

-- Location: LCCOMB_X24_Y33_N16
\sCurrentStateN.z_decoded_bit0WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit0WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit0WAIT~q\) # (!\sCurrentState.z_Standby~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit0WAIT~q\,
	datad => \sCurrentState.z_Standby~q\,
	combout => \sCurrentStateN.z_decoded_bit0WAIT~0_combout\);

-- Location: FF_X24_Y33_N17
\sCurrentState.z_decoded_bit0WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit0WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit0WAIT~q\);

-- Location: LCCOMB_X24_Y33_N30
\sCurrentStateN.z_decoded_bit0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit0~0_combout\ = (\reset~input_o\ & (!\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit0~q\) # (\sCurrentState.z_decoded_bit0WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit0~q\,
	datad => \sCurrentState.z_decoded_bit0WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit0~0_combout\);

-- Location: FF_X24_Y33_N31
\sCurrentState.z_decoded_bit0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit0~q\);

-- Location: LCCOMB_X23_Y33_N10
\sCurrentStateN.z_decoded_bit1WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit1WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit0~q\) # (\sCurrentState.z_decoded_bit1WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \sCurrentState.z_decoded_bit0~q\,
	datac => \sCurrentState.z_decoded_bit1WAIT~q\,
	datad => \reset~input_o\,
	combout => \sCurrentStateN.z_decoded_bit1WAIT~0_combout\);

-- Location: FF_X23_Y33_N11
\sCurrentState.z_decoded_bit1WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit1WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit1WAIT~q\);

-- Location: LCCOMB_X23_Y33_N18
\sCurrentStateN.z_decoded_bit1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit1~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit1~q\) # (\sCurrentState.z_decoded_bit1WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit1~q\,
	datad => \sCurrentState.z_decoded_bit1WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit1~0_combout\);

-- Location: FF_X23_Y33_N19
\sCurrentState.z_decoded_bit1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit1~q\);

-- Location: LCCOMB_X23_Y33_N2
\sCurrentStateN.z_decoded_bit2WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit2WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit1~q\) # (\sCurrentState.z_decoded_bit2WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \sCurrentState.z_decoded_bit1~q\,
	datac => \sCurrentState.z_decoded_bit2WAIT~q\,
	datad => \reset~input_o\,
	combout => \sCurrentStateN.z_decoded_bit2WAIT~0_combout\);

-- Location: FF_X23_Y33_N3
\sCurrentState.z_decoded_bit2WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit2WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit2WAIT~q\);

-- Location: LCCOMB_X23_Y33_N24
\sCurrentStateN.z_decoded_bit2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit2~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit2~q\) # (\sCurrentState.z_decoded_bit2WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit2~q\,
	datad => \sCurrentState.z_decoded_bit2WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit2~0_combout\);

-- Location: FF_X23_Y33_N25
\sCurrentState.z_decoded_bit2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit2~q\);

-- Location: LCCOMB_X23_Y33_N16
\sCurrentStateN.z_decoded_bit3WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit3WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit2~q\) # (\sCurrentState.z_decoded_bit3WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \sCurrentState.z_decoded_bit2~q\,
	datac => \sCurrentState.z_decoded_bit3WAIT~q\,
	datad => \reset~input_o\,
	combout => \sCurrentStateN.z_decoded_bit3WAIT~0_combout\);

-- Location: FF_X23_Y33_N17
\sCurrentState.z_decoded_bit3WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit3WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit3WAIT~q\);

-- Location: LCCOMB_X23_Y33_N20
\sCurrentStateN.z_decoded_bit3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit3~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit3~q\) # (\sCurrentState.z_decoded_bit3WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit3~q\,
	datad => \sCurrentState.z_decoded_bit3WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit3~0_combout\);

-- Location: FF_X23_Y33_N21
\sCurrentState.z_decoded_bit3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit3~q\);

-- Location: LCCOMB_X26_Y33_N18
\sCurrentStateN.z_decoded_bit4WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit4WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit4WAIT~q\) # (\sCurrentState.z_decoded_bit3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit4WAIT~q\,
	datad => \sCurrentState.z_decoded_bit3~q\,
	combout => \sCurrentStateN.z_decoded_bit4WAIT~0_combout\);

-- Location: FF_X26_Y33_N19
\sCurrentState.z_decoded_bit4WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit4WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit4WAIT~q\);

-- Location: LCCOMB_X26_Y33_N6
\sCurrentStateN.z_decoded_bit4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit4~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit4~q\) # (\sCurrentState.z_decoded_bit4WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit4~q\,
	datad => \sCurrentState.z_decoded_bit4WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit4~0_combout\);

-- Location: FF_X26_Y33_N7
\sCurrentState.z_decoded_bit4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit4~q\);

-- Location: LCCOMB_X26_Y33_N20
\sCurrentStateN.z_decoded_bit5WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit5WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit4~q\) # (\sCurrentState.z_decoded_bit5WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_decoded_bit4~q\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit5WAIT~q\,
	datad => \barcode_clock~input_o\,
	combout => \sCurrentStateN.z_decoded_bit5WAIT~0_combout\);

-- Location: FF_X26_Y33_N21
\sCurrentState.z_decoded_bit5WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit5WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit5WAIT~q\);

-- Location: LCCOMB_X26_Y33_N28
\sCurrentStateN.z_decoded_bit5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit5~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit5~q\) # (\sCurrentState.z_decoded_bit5WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit5~q\,
	datad => \sCurrentState.z_decoded_bit5WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit5~0_combout\);

-- Location: FF_X26_Y33_N29
\sCurrentState.z_decoded_bit5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit5~q\);

-- Location: LCCOMB_X26_Y33_N2
\sCurrentStateN.z_decoded_bit6WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit6WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit5~q\) # (\sCurrentState.z_decoded_bit6WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \sCurrentState.z_decoded_bit5~q\,
	datac => \sCurrentState.z_decoded_bit6WAIT~q\,
	datad => \barcode_clock~input_o\,
	combout => \sCurrentStateN.z_decoded_bit6WAIT~0_combout\);

-- Location: FF_X26_Y33_N3
\sCurrentState.z_decoded_bit6WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit6WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit6WAIT~q\);

-- Location: LCCOMB_X26_Y33_N22
\sCurrentStateN.z_decoded_bit6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit6~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit6~q\) # (\sCurrentState.z_decoded_bit6WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit6~q\,
	datad => \sCurrentState.z_decoded_bit6WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit6~0_combout\);

-- Location: FF_X26_Y33_N23
\sCurrentState.z_decoded_bit6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit6~q\);

-- Location: LCCOMB_X24_Y32_N0
\sCurrentStateN.z_decoded_bit7WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit7WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit7WAIT~q\) # (\sCurrentState.z_decoded_bit6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit7WAIT~q\,
	datad => \sCurrentState.z_decoded_bit6~q\,
	combout => \sCurrentStateN.z_decoded_bit7WAIT~0_combout\);

-- Location: FF_X24_Y32_N1
\sCurrentState.z_decoded_bit7WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit7WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit7WAIT~q\);

-- Location: LCCOMB_X24_Y32_N2
\sCurrentStateN.z_decoded_bit7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit7~0_combout\ = (\reset~input_o\ & (!\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit7~q\) # (\sCurrentState.z_decoded_bit7WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit7~q\,
	datad => \sCurrentState.z_decoded_bit7WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit7~0_combout\);

-- Location: FF_X24_Y32_N3
\sCurrentState.z_decoded_bit7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit7~q\);

-- Location: LCCOMB_X24_Y32_N10
\sCurrentStateN.z_decoded_bit8WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit8WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit7~q\) # (\sCurrentState.z_decoded_bit8WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \sCurrentState.z_decoded_bit7~q\,
	datac => \sCurrentState.z_decoded_bit8WAIT~q\,
	datad => \barcode_clock~input_o\,
	combout => \sCurrentStateN.z_decoded_bit8WAIT~0_combout\);

-- Location: FF_X24_Y32_N11
\sCurrentState.z_decoded_bit8WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit8WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit8WAIT~q\);

-- Location: LCCOMB_X24_Y32_N6
\sCurrentStateN.z_decoded_bit8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit8~0_combout\ = (\reset~input_o\ & (!\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit8~q\) # (\sCurrentState.z_decoded_bit8WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit8~q\,
	datad => \sCurrentState.z_decoded_bit8WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit8~0_combout\);

-- Location: FF_X24_Y32_N7
\sCurrentState.z_decoded_bit8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit8~q\);

-- Location: LCCOMB_X24_Y32_N24
\sCurrentStateN.z_decoded_bit9WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit9WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit9WAIT~q\) # (\sCurrentState.z_decoded_bit8~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit9WAIT~q\,
	datad => \sCurrentState.z_decoded_bit8~q\,
	combout => \sCurrentStateN.z_decoded_bit9WAIT~0_combout\);

-- Location: FF_X24_Y32_N25
\sCurrentState.z_decoded_bit9WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit9WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit9WAIT~q\);

-- Location: LCCOMB_X24_Y32_N16
\sCurrentStateN.z_decoded_bit9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit9~0_combout\ = (\reset~input_o\ & (!\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit9~q\) # (\sCurrentState.z_decoded_bit9WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit9~q\,
	datad => \sCurrentState.z_decoded_bit9WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit9~0_combout\);

-- Location: FF_X24_Y32_N17
\sCurrentState.z_decoded_bit9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit9~q\);

-- Location: LCCOMB_X23_Y32_N24
\sCurrentStateN.z_decoded_bit10WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit10WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit10WAIT~q\) # (\sCurrentState.z_decoded_bit9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit10WAIT~q\,
	datad => \sCurrentState.z_decoded_bit9~q\,
	combout => \sCurrentStateN.z_decoded_bit10WAIT~0_combout\);

-- Location: FF_X23_Y32_N25
\sCurrentState.z_decoded_bit10WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit10WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit10WAIT~q\);

-- Location: LCCOMB_X23_Y32_N16
\sCurrentStateN.z_decoded_bit10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit10~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit10~q\) # (\sCurrentState.z_decoded_bit10WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit10~q\,
	datad => \sCurrentState.z_decoded_bit10WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit10~0_combout\);

-- Location: FF_X23_Y32_N17
\sCurrentState.z_decoded_bit10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit10~q\);

-- Location: LCCOMB_X23_Y32_N10
\sCurrentStateN.z_decoded_bit11WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit11WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit11WAIT~q\) # (\sCurrentState.z_decoded_bit10~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit11WAIT~q\,
	datad => \sCurrentState.z_decoded_bit10~q\,
	combout => \sCurrentStateN.z_decoded_bit11WAIT~0_combout\);

-- Location: FF_X23_Y32_N11
\sCurrentState.z_decoded_bit11WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit11WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit11WAIT~q\);

-- Location: LCCOMB_X23_Y32_N2
\sCurrentStateN.z_decoded_bit11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit11~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit11~q\) # (\sCurrentState.z_decoded_bit11WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit11~q\,
	datad => \sCurrentState.z_decoded_bit11WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit11~0_combout\);

-- Location: FF_X23_Y32_N3
\sCurrentState.z_decoded_bit11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit11~q\);

-- Location: LCCOMB_X23_Y32_N28
\sCurrentStateN.z_decoded_bit12WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit12WAIT~0_combout\ = (\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit12WAIT~q\) # (\sCurrentState.z_decoded_bit11~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit12WAIT~q\,
	datad => \sCurrentState.z_decoded_bit11~q\,
	combout => \sCurrentStateN.z_decoded_bit12WAIT~0_combout\);

-- Location: FF_X23_Y32_N29
\sCurrentState.z_decoded_bit12WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit12WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit12WAIT~q\);

-- Location: LCCOMB_X23_Y32_N14
\sCurrentStateN.z_decoded_bit12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit12~0_combout\ = (!\barcode_clock~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_decoded_bit12~q\) # (\sCurrentState.z_decoded_bit12WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_clock~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_decoded_bit12~q\,
	datad => \sCurrentState.z_decoded_bit12WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit12~0_combout\);

-- Location: FF_X23_Y32_N15
\sCurrentState.z_decoded_bit12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit12~q\);

-- Location: LCCOMB_X25_Y33_N2
\sCurrentStateN.z_decoded_bit13WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit13WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit13WAIT~q\) # (\sCurrentState.z_decoded_bit12~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit13WAIT~q\,
	datad => \sCurrentState.z_decoded_bit12~q\,
	combout => \sCurrentStateN.z_decoded_bit13WAIT~0_combout\);

-- Location: FF_X25_Y33_N3
\sCurrentState.z_decoded_bit13WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit13WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit13WAIT~q\);

-- Location: LCCOMB_X25_Y33_N10
\sCurrentStateN.z_decoded_bit13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit13~0_combout\ = (\reset~input_o\ & (!\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit13~q\) # (\sCurrentState.z_decoded_bit13WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit13~q\,
	datad => \sCurrentState.z_decoded_bit13WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit13~0_combout\);

-- Location: FF_X25_Y33_N11
\sCurrentState.z_decoded_bit13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit13~q\);

-- Location: LCCOMB_X25_Y33_N18
\sCurrentStateN.z_decoded_bit14WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit14WAIT~0_combout\ = (\reset~input_o\ & (\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit14WAIT~q\) # (\sCurrentState.z_decoded_bit13~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit14WAIT~q\,
	datad => \sCurrentState.z_decoded_bit13~q\,
	combout => \sCurrentStateN.z_decoded_bit14WAIT~0_combout\);

-- Location: FF_X25_Y33_N19
\sCurrentState.z_decoded_bit14WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_decoded_bit14WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit14WAIT~q\);

-- Location: LCCOMB_X25_Y33_N28
\sCurrentStateN.z_decoded_bit14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_decoded_bit14~0_combout\ = (\reset~input_o\ & (!\barcode_clock~input_o\ & ((\sCurrentState.z_decoded_bit14~q\) # (\sCurrentState.z_decoded_bit14WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_decoded_bit14~q\,
	datad => \sCurrentState.z_decoded_bit14WAIT~q\,
	combout => \sCurrentStateN.z_decoded_bit14~0_combout\);

-- Location: FF_X25_Y33_N29
\sCurrentState.z_decoded_bit14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \sCurrentStateN.z_decoded_bit14~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_decoded_bit14~q\);

-- Location: LCCOMB_X24_Y33_N0
\Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\barcode_clock~input_o\ & (((\sCurrentState.z_save~q\) # (\sCurrentState.z_decoded_bit14~q\)))) # (!\barcode_clock~input_o\ & (\barcode_data~input_o\ & (\sCurrentState.z_save~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \barcode_clock~input_o\,
	datac => \sCurrentState.z_save~q\,
	datad => \sCurrentState.z_decoded_bit14~q\,
	combout => \Selector15~0_combout\);

-- Location: FF_X24_Y33_N1
\sCurrentState.z_save\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Selector15~0_combout\,
	sclr => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_save~q\);

-- Location: LCCOMB_X24_Y33_N10
\Selector26~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~6_combout\ = (!\barcode_data~input_o\ & (!\barcode_clock~input_o\ & \sCurrentState.z_save~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_save~q\,
	combout => \Selector26~6_combout\);

-- Location: LCCOMB_X20_Y33_N28
\Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\Selector26~6_combout\) # ((\nextdata~input_o\ & \sCurrentState.z_output_command0~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datac => \sCurrentState.z_output_command0~q\,
	datad => \Selector26~6_combout\,
	combout => \Selector16~0_combout\);

-- Location: FF_X20_Y33_N29
\sCurrentState.z_output_command0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector16~0_combout\,
	sclr => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command0~q\);

-- Location: LCCOMB_X20_Y33_N2
\sCurrentStateN.z_output_command0WAIT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command0WAIT~1_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command0WAIT~q\) # (\sCurrentState.z_output_command0~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command0WAIT~q\,
	datad => \sCurrentState.z_output_command0~q\,
	combout => \sCurrentStateN.z_output_command0WAIT~1_combout\);

-- Location: FF_X20_Y33_N3
\sCurrentState.z_output_command0WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command0WAIT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command0WAIT~q\);

-- Location: LCCOMB_X20_Y33_N8
\sCurrentStateN.z_output_command1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command1~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command1~q\) # (\sCurrentState.z_output_command0WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command1~q\,
	datad => \sCurrentState.z_output_command0WAIT~q\,
	combout => \sCurrentStateN.z_output_command1~0_combout\);

-- Location: FF_X20_Y33_N9
\sCurrentState.z_output_command1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command1~q\);

-- Location: LCCOMB_X21_Y33_N28
\sCurrentStateN.z_output_command1WAIT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command1WAIT~1_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command1WAIT~q\) # (\sCurrentState.z_output_command1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command1WAIT~q\,
	datad => \sCurrentState.z_output_command1~q\,
	combout => \sCurrentStateN.z_output_command1WAIT~1_combout\);

-- Location: FF_X21_Y33_N29
\sCurrentState.z_output_command1WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command1WAIT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command1WAIT~q\);

-- Location: LCCOMB_X21_Y33_N2
\sCurrentStateN.z_output_command2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command2~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command2~q\) # (\sCurrentState.z_output_command1WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command2~q\,
	datad => \sCurrentState.z_output_command1WAIT~q\,
	combout => \sCurrentStateN.z_output_command2~0_combout\);

-- Location: FF_X21_Y33_N3
\sCurrentState.z_output_command2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command2~q\);

-- Location: LCCOMB_X21_Y33_N18
\sCurrentStateN.z_output_command2WAIT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command2WAIT~1_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command2WAIT~q\) # (\sCurrentState.z_output_command2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command2WAIT~q\,
	datad => \sCurrentState.z_output_command2~q\,
	combout => \sCurrentStateN.z_output_command2WAIT~1_combout\);

-- Location: FF_X21_Y33_N19
\sCurrentState.z_output_command2WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command2WAIT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command2WAIT~q\);

-- Location: LCCOMB_X21_Y33_N12
\sCurrentStateN.z_output_command3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command3~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command3~q\) # (\sCurrentState.z_output_command2WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command3~q\,
	datad => \sCurrentState.z_output_command2WAIT~q\,
	combout => \sCurrentStateN.z_output_command3~0_combout\);

-- Location: FF_X21_Y33_N13
\sCurrentState.z_output_command3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command3~q\);

-- Location: LCCOMB_X21_Y33_N6
\sCurrentStateN.z_output_command3WAIT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command3WAIT~1_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command3WAIT~q\) # (\sCurrentState.z_output_command3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command3WAIT~q\,
	datad => \sCurrentState.z_output_command3~q\,
	combout => \sCurrentStateN.z_output_command3WAIT~1_combout\);

-- Location: FF_X21_Y33_N7
\sCurrentState.z_output_command3WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command3WAIT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command3WAIT~q\);

-- Location: LCCOMB_X21_Y33_N24
\sCurrentStateN.z_output_command4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command4~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command4~q\) # (\sCurrentState.z_output_command3WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command4~q\,
	datad => \sCurrentState.z_output_command3WAIT~q\,
	combout => \sCurrentStateN.z_output_command4~0_combout\);

-- Location: FF_X21_Y33_N25
\sCurrentState.z_output_command4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command4~q\);

-- Location: LCCOMB_X20_Y33_N0
\sCurrentStateN.z_output_command4WAIT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command4WAIT~1_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command4WAIT~q\) # (\sCurrentState.z_output_command4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command4WAIT~q\,
	datad => \sCurrentState.z_output_command4~q\,
	combout => \sCurrentStateN.z_output_command4WAIT~1_combout\);

-- Location: FF_X20_Y33_N1
\sCurrentState.z_output_command4WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command4WAIT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command4WAIT~q\);

-- Location: LCCOMB_X20_Y33_N10
\sCurrentStateN.z_output_command5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command5~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command5~q\) # (\sCurrentState.z_output_command4WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command5~q\,
	datad => \sCurrentState.z_output_command4WAIT~q\,
	combout => \sCurrentStateN.z_output_command5~0_combout\);

-- Location: FF_X20_Y33_N11
\sCurrentState.z_output_command5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command5~q\);

-- Location: LCCOMB_X20_Y33_N20
\sCurrentStateN.z_output_command5WAIT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command5WAIT~1_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command5WAIT~q\) # (\sCurrentState.z_output_command5~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command5WAIT~q\,
	datad => \sCurrentState.z_output_command5~q\,
	combout => \sCurrentStateN.z_output_command5WAIT~1_combout\);

-- Location: FF_X20_Y33_N21
\sCurrentState.z_output_command5WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command5WAIT~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command5WAIT~q\);

-- Location: LCCOMB_X20_Y33_N6
\sCurrentStateN.z_output_command6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command6~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command6~q\) # (\sCurrentState.z_output_command5WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command6~q\,
	datad => \sCurrentState.z_output_command5WAIT~q\,
	combout => \sCurrentStateN.z_output_command6~0_combout\);

-- Location: FF_X20_Y33_N7
\sCurrentState.z_output_command6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command6~q\);

-- Location: LCCOMB_X20_Y33_N24
\sCurrentStateN.z_output_command6WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command6WAIT~0_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command6WAIT~q\) # (\sCurrentState.z_output_command6~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command6WAIT~q\,
	datad => \sCurrentState.z_output_command6~q\,
	combout => \sCurrentStateN.z_output_command6WAIT~0_combout\);

-- Location: FF_X20_Y33_N25
\sCurrentState.z_output_command6WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command6WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command6WAIT~q\);

-- Location: LCCOMB_X20_Y33_N26
\sCurrentStateN.z_output_command7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command7~0_combout\ = (\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command7~q\) # (\sCurrentState.z_output_command6WAIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command7~q\,
	datad => \sCurrentState.z_output_command6WAIT~q\,
	combout => \sCurrentStateN.z_output_command7~0_combout\);

-- Location: FF_X20_Y33_N27
\sCurrentState.z_output_command7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command7~q\);

-- Location: LCCOMB_X20_Y33_N18
\sCurrentStateN.z_output_command7WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command7WAIT~0_combout\ = (!\nextdata~input_o\ & (\reset~input_o\ & ((\sCurrentState.z_output_command7WAIT~q\) # (\sCurrentState.z_output_command7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datab => \reset~input_o\,
	datac => \sCurrentState.z_output_command7WAIT~q\,
	datad => \sCurrentState.z_output_command7~q\,
	combout => \sCurrentStateN.z_output_command7WAIT~0_combout\);

-- Location: FF_X20_Y33_N19
\sCurrentState.z_output_command7WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sCurrentStateN.z_output_command7WAIT~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_output_command7WAIT~q\);

-- Location: LCCOMB_X20_Y33_N22
\Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\sCurrentState.z_finished~q\) # ((\nextdata~input_o\ & \sCurrentState.z_output_command7WAIT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nextdata~input_o\,
	datac => \sCurrentState.z_finished~q\,
	datad => \sCurrentState.z_output_command7WAIT~q\,
	combout => \Selector25~0_combout\);

-- Location: FF_X20_Y33_N23
\sCurrentState.z_finished\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Selector25~0_combout\,
	sclr => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sCurrentState.z_finished~q\);

-- Location: LCCOMB_X20_Y33_N12
\Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\sCurrentState.z_output_command7~q\) # ((\sCurrentState.z_output_command0~q\) # ((\sCurrentState.z_finished~q\) # (\sCurrentState.z_output_command6WAIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command7~q\,
	datab => \sCurrentState.z_output_command0~q\,
	datac => \sCurrentState.z_finished~q\,
	datad => \sCurrentState.z_output_command6WAIT~q\,
	combout => \Selector26~0_combout\);

-- Location: LCCOMB_X21_Y33_N22
\Selector26~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~2_combout\ = (\sCurrentState.z_output_command3WAIT~q\) # ((\sCurrentState.z_output_command4~q\) # ((\sCurrentState.z_output_command3~q\) # (\sCurrentState.z_output_command2WAIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command3WAIT~q\,
	datab => \sCurrentState.z_output_command4~q\,
	datac => \sCurrentState.z_output_command3~q\,
	datad => \sCurrentState.z_output_command2WAIT~q\,
	combout => \Selector26~2_combout\);

-- Location: LCCOMB_X21_Y33_N16
\Selector26~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~1_combout\ = (\sCurrentState.z_output_command1~q\) # ((\sCurrentState.z_output_command1WAIT~q\) # ((\sCurrentState.z_output_command0WAIT~q\) # (\sCurrentState.z_output_command2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command1~q\,
	datab => \sCurrentState.z_output_command1WAIT~q\,
	datac => \sCurrentState.z_output_command0WAIT~q\,
	datad => \sCurrentState.z_output_command2~q\,
	combout => \Selector26~1_combout\);

-- Location: LCCOMB_X20_Y33_N16
\Selector26~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~4_combout\ = (\sCurrentState.z_output_command6~q\) # ((\sCurrentState.z_output_command4WAIT~q\) # ((\sCurrentState.z_output_command5WAIT~q\) # (\sCurrentState.z_output_command5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command6~q\,
	datab => \sCurrentState.z_output_command4WAIT~q\,
	datac => \sCurrentState.z_output_command5WAIT~q\,
	datad => \sCurrentState.z_output_command5~q\,
	combout => \Selector26~4_combout\);

-- Location: LCCOMB_X24_Y33_N24
\Selector26~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~3_combout\ = (\sCurrentState.z_output_command7WAIT~q\) # ((\sCurrentState.z_save~q\ & (!\barcode_clock~input_o\ & !\barcode_data~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command7WAIT~q\,
	datab => \sCurrentState.z_save~q\,
	datac => \barcode_clock~input_o\,
	datad => \barcode_data~input_o\,
	combout => \Selector26~3_combout\);

-- Location: LCCOMB_X21_Y33_N8
\Selector26~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~5_combout\ = (\Selector26~2_combout\) # ((\Selector26~1_combout\) # ((\Selector26~4_combout\) # (\Selector26~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector26~2_combout\,
	datab => \Selector26~1_combout\,
	datac => \Selector26~4_combout\,
	datad => \Selector26~3_combout\,
	combout => \Selector26~5_combout\);

-- Location: LCCOMB_X20_Y33_N14
\sReady~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sReady~0_combout\ = (\reset~input_o\ & ((\Selector26~0_combout\) # (\Selector26~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector26~0_combout\,
	datab => \Selector26~5_combout\,
	datac => \reset~input_o\,
	combout => \sReady~0_combout\);

-- Location: LCCOMB_X23_Y33_N6
\sFahrstrecke[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[2]~6_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit1~q\,
	combout => \sFahrstrecke[2]~6_combout\);

-- Location: LCCOMB_X23_Y33_N4
\sFahrstrecke[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(2) = (\reset~input_o\ & ((\sFahrstrecke[2]~6_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[2]~6_combout\ & ((sFahrstrecke(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_data~input_o\,
	datac => sFahrstrecke(2),
	datad => \sFahrstrecke[2]~6_combout\,
	combout => sFahrstrecke(2));

-- Location: CLKCTRL_G12
\Selector26~6clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Selector26~6clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Selector26~6clkctrl_outclk\);

-- Location: LCCOMB_X23_Y33_N26
\sFahrstreckeC[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(2) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(2))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => sFahrstrecke(2),
	datac => sFahrstreckeC(2),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(2));

-- Location: LCCOMB_X24_Y33_N28
\sFahrstrecke[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[0]~7_combout\ = (\barcode_clock~input_o\ & !\sCurrentState.z_Standby~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_Standby~q\,
	combout => \sFahrstrecke[0]~7_combout\);

-- Location: LCCOMB_X24_Y33_N8
\sFahrstrecke[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(0) = (\reset~input_o\ & ((\sFahrstrecke[0]~7_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[0]~7_combout\ & ((sFahrstrecke(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_data~input_o\,
	datac => sFahrstrecke(0),
	datad => \sFahrstrecke[0]~7_combout\,
	combout => sFahrstrecke(0));

-- Location: LCCOMB_X23_Y33_N30
\sFahrstreckeC[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(0) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(0))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(0))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => sFahrstrecke(0),
	datac => sFahrstreckeC(0),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(0));

-- Location: LCCOMB_X20_Y33_N30
\sCurrentStateN.z_output_command0WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command0WAIT~0_combout\ = (\sCurrentState.z_output_command0~q\) # (\sCurrentState.z_output_command0WAIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sCurrentState.z_output_command0~q\,
	datad => \sCurrentState.z_output_command0WAIT~q\,
	combout => \sCurrentStateN.z_output_command0WAIT~0_combout\);

-- Location: LCCOMB_X21_Y33_N14
\sCurrentStateN.z_output_command1WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command1WAIT~0_combout\ = (\sCurrentState.z_output_command1~q\) # (\sCurrentState.z_output_command1WAIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command1~q\,
	datad => \sCurrentState.z_output_command1WAIT~q\,
	combout => \sCurrentStateN.z_output_command1WAIT~0_combout\);

-- Location: LCCOMB_X24_Y33_N2
\data_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~5_combout\ = (sFahrstreckeC(2) & ((\sCurrentStateN.z_output_command1WAIT~0_combout\) # ((sFahrstreckeC(0) & \sCurrentStateN.z_output_command0WAIT~0_combout\)))) # (!sFahrstreckeC(2) & (sFahrstreckeC(0) & 
-- (\sCurrentStateN.z_output_command0WAIT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(2),
	datab => sFahrstreckeC(0),
	datac => \sCurrentStateN.z_output_command0WAIT~0_combout\,
	datad => \sCurrentStateN.z_output_command1WAIT~0_combout\,
	combout => \data_0~5_combout\);

-- Location: LCCOMB_X21_Y33_N30
\sCurrentStateN.z_output_command2WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command2WAIT~0_combout\ = (\sCurrentState.z_output_command2~q\) # (\sCurrentState.z_output_command2WAIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sCurrentState.z_output_command2~q\,
	datad => \sCurrentState.z_output_command2WAIT~q\,
	combout => \sCurrentStateN.z_output_command2WAIT~0_combout\);

-- Location: LCCOMB_X26_Y33_N10
\sFahrstrecke[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[6]~4_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit5~q\,
	combout => \sFahrstrecke[6]~4_combout\);

-- Location: LCCOMB_X26_Y33_N4
\sFahrstrecke[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(6) = (\reset~input_o\ & ((\sFahrstrecke[6]~4_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[6]~4_combout\ & ((sFahrstrecke(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(6),
	datad => \sFahrstrecke[6]~4_combout\,
	combout => sFahrstrecke(6));

-- Location: LCCOMB_X26_Y33_N24
\sFahrstreckeC[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(6) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstrecke(6)))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstreckeC(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(6),
	datab => \reset~input_o\,
	datac => sFahrstrecke(6),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(6));

-- Location: LCCOMB_X21_Y33_N4
\sCurrentStateN.z_output_command3WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command3WAIT~0_combout\ = (\sCurrentState.z_output_command3~q\) # (\sCurrentState.z_output_command3WAIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentState.z_output_command3~q\,
	datad => \sCurrentState.z_output_command3WAIT~q\,
	combout => \sCurrentStateN.z_output_command3WAIT~0_combout\);

-- Location: LCCOMB_X23_Y33_N0
\sFahrstrecke[4]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[4]~5_combout\ = (\sCurrentState.z_decoded_bit3~q\ & \barcode_clock~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sCurrentState.z_decoded_bit3~q\,
	datad => \barcode_clock~input_o\,
	combout => \sFahrstrecke[4]~5_combout\);

-- Location: LCCOMB_X23_Y33_N14
\sFahrstrecke[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(4) = (\reset~input_o\ & ((\sFahrstrecke[4]~5_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[4]~5_combout\ & ((sFahrstrecke(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_data~input_o\,
	datac => sFahrstrecke(4),
	datad => \sFahrstrecke[4]~5_combout\,
	combout => sFahrstrecke(4));

-- Location: LCCOMB_X24_Y33_N22
\sFahrstreckeC[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(4) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(4))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(4))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => sFahrstrecke(4),
	datac => sFahrstreckeC(4),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(4));

-- Location: LCCOMB_X25_Y33_N16
\data_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~4_combout\ = (\sCurrentStateN.z_output_command2WAIT~0_combout\ & ((sFahrstreckeC(4)) # ((sFahrstreckeC(6) & \sCurrentStateN.z_output_command3WAIT~0_combout\)))) # (!\sCurrentStateN.z_output_command2WAIT~0_combout\ & (sFahrstreckeC(6) & 
-- (\sCurrentStateN.z_output_command3WAIT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentStateN.z_output_command2WAIT~0_combout\,
	datab => sFahrstreckeC(6),
	datac => \sCurrentStateN.z_output_command3WAIT~0_combout\,
	datad => sFahrstreckeC(4),
	combout => \data_0~4_combout\);

-- Location: LCCOMB_X23_Y32_N20
\sFahrstrecke[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[12]~0_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit11~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit11~q\,
	combout => \sFahrstrecke[12]~0_combout\);

-- Location: LCCOMB_X23_Y32_N26
\sFahrstrecke[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(12) = (\reset~input_o\ & ((\sFahrstrecke[12]~0_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[12]~0_combout\ & ((sFahrstrecke(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(12),
	datad => \sFahrstrecke[12]~0_combout\,
	combout => sFahrstrecke(12));

-- Location: LCCOMB_X23_Y32_N22
\sFahrstreckeC[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(12) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(12))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(12))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(12),
	datab => \reset~input_o\,
	datac => sFahrstreckeC(12),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(12));

-- Location: LCCOMB_X21_Y33_N10
\data_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~0_combout\ = (sFahrstreckeC(12) & ((\sCurrentState.z_output_command6~q\) # (\sCurrentState.z_output_command6WAIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(12),
	datac => \sCurrentState.z_output_command6~q\,
	datad => \sCurrentState.z_output_command6WAIT~q\,
	combout => \data_0~0_combout\);

-- Location: LCCOMB_X24_Y32_N18
\sFahrstrecke[8]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[8]~2_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit7~q\,
	combout => \sFahrstrecke[8]~2_combout\);

-- Location: LCCOMB_X24_Y32_N14
\sFahrstrecke[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(8) = (\reset~input_o\ & ((\sFahrstrecke[8]~2_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[8]~2_combout\ & ((sFahrstrecke(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(8),
	datad => \sFahrstrecke[8]~2_combout\,
	combout => sFahrstrecke(8));

-- Location: LCCOMB_X24_Y32_N12
\sFahrstreckeC[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(8) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstrecke(8)))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstreckeC(8)))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(8),
	datab => sFahrstrecke(8),
	datac => \reset~input_o\,
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(8));

-- Location: LCCOMB_X24_Y32_N20
\sFahrstrecke[10]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[10]~1_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit9~q\,
	combout => \sFahrstrecke[10]~1_combout\);

-- Location: LCCOMB_X24_Y32_N22
\sFahrstrecke[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(10) = (\reset~input_o\ & ((\sFahrstrecke[10]~1_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[10]~1_combout\ & ((sFahrstrecke(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(10),
	datad => \sFahrstrecke[10]~1_combout\,
	combout => sFahrstrecke(10));

-- Location: LCCOMB_X23_Y32_N6
\sFahrstreckeC[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(10) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstrecke(10)))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstreckeC(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(10),
	datab => \reset~input_o\,
	datac => sFahrstrecke(10),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(10));

-- Location: LCCOMB_X20_Y33_N4
\sCurrentStateN.z_output_command5WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command5WAIT~0_combout\ = (\sCurrentState.z_output_command5WAIT~q\) # (\sCurrentState.z_output_command5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sCurrentState.z_output_command5WAIT~q\,
	datad => \sCurrentState.z_output_command5~q\,
	combout => \sCurrentStateN.z_output_command5WAIT~0_combout\);

-- Location: LCCOMB_X21_Y33_N20
\sCurrentStateN.z_output_command4WAIT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sCurrentStateN.z_output_command4WAIT~0_combout\ = (\sCurrentState.z_output_command4WAIT~q\) # (\sCurrentState.z_output_command4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sCurrentState.z_output_command4WAIT~q\,
	datad => \sCurrentState.z_output_command4~q\,
	combout => \sCurrentStateN.z_output_command4WAIT~0_combout\);

-- Location: LCCOMB_X24_Y32_N8
\data_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~1_combout\ = (sFahrstreckeC(8) & ((\sCurrentStateN.z_output_command4WAIT~0_combout\) # ((sFahrstreckeC(10) & \sCurrentStateN.z_output_command5WAIT~0_combout\)))) # (!sFahrstreckeC(8) & (sFahrstreckeC(10) & 
-- (\sCurrentStateN.z_output_command5WAIT~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(8),
	datab => sFahrstreckeC(10),
	datac => \sCurrentStateN.z_output_command5WAIT~0_combout\,
	datad => \sCurrentStateN.z_output_command4WAIT~0_combout\,
	combout => \data_0~1_combout\);

-- Location: LCCOMB_X25_Y33_N20
\sFahrstrecke[14]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[14]~3_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit13~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit13~q\,
	combout => \sFahrstrecke[14]~3_combout\);

-- Location: LCCOMB_X25_Y33_N22
\sFahrstrecke[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(14) = (\reset~input_o\ & ((\sFahrstrecke[14]~3_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[14]~3_combout\ & ((sFahrstrecke(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_data~input_o\,
	datac => sFahrstrecke(14),
	datad => \sFahrstrecke[14]~3_combout\,
	combout => sFahrstrecke(14));

-- Location: LCCOMB_X25_Y33_N14
\sFahrstreckeC[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(14) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(14))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(14),
	datab => \reset~input_o\,
	datac => sFahrstreckeC(14),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(14));

-- Location: LCCOMB_X24_Y33_N6
\data_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~2_combout\ = (\sCurrentState.z_output_command7~q\) # (\sCurrentState.z_output_command7WAIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sCurrentState.z_output_command7~q\,
	datad => \sCurrentState.z_output_command7WAIT~q\,
	combout => \data_0~2_combout\);

-- Location: LCCOMB_X24_Y33_N14
\data_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~3_combout\ = (\data_0~0_combout\) # ((\data_0~1_combout\) # ((sFahrstreckeC(14) & \data_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_0~0_combout\,
	datab => \data_0~1_combout\,
	datac => sFahrstreckeC(14),
	datad => \data_0~2_combout\,
	combout => \data_0~3_combout\);

-- Location: LCCOMB_X25_Y33_N24
\data_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_0~6_combout\ = (\reset~input_o\ & ((\data_0~5_combout\) # ((\data_0~4_combout\) # (\data_0~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_0~5_combout\,
	datab => \data_0~4_combout\,
	datac => \reset~input_o\,
	datad => \data_0~3_combout\,
	combout => \data_0~6_combout\);

-- Location: LCCOMB_X23_Y32_N18
\sFahrstrecke[11]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[11]~10_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit10~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit10~q\,
	combout => \sFahrstrecke[11]~10_combout\);

-- Location: LCCOMB_X23_Y32_N30
\sFahrstrecke[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(11) = (\reset~input_o\ & ((\sFahrstrecke[11]~10_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[11]~10_combout\ & ((sFahrstrecke(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(11),
	datad => \sFahrstrecke[11]~10_combout\,
	combout => sFahrstrecke(11));

-- Location: LCCOMB_X23_Y32_N0
\sFahrstreckeC[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(11) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(11))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(11))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(11),
	datab => \reset~input_o\,
	datac => \Selector26~6clkctrl_outclk\,
	datad => sFahrstreckeC(11),
	combout => sFahrstreckeC(11));

-- Location: LCCOMB_X24_Y32_N28
\sFahrstrecke[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[9]~9_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit8~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit8~q\,
	combout => \sFahrstrecke[9]~9_combout\);

-- Location: LCCOMB_X24_Y32_N26
\sFahrstrecke[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(9) = (\reset~input_o\ & ((\sFahrstrecke[9]~9_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[9]~9_combout\ & ((sFahrstrecke(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(9),
	datad => \sFahrstrecke[9]~9_combout\,
	combout => sFahrstrecke(9));

-- Location: LCCOMB_X24_Y32_N4
\sFahrstreckeC[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(9) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstrecke(9)))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstreckeC(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => sFahrstreckeC(9),
	datac => sFahrstrecke(9),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(9));

-- Location: LCCOMB_X24_Y32_N30
\data_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_1~1_combout\ = (sFahrstreckeC(11) & ((\sCurrentStateN.z_output_command5WAIT~0_combout\) # ((sFahrstreckeC(9) & \sCurrentStateN.z_output_command4WAIT~0_combout\)))) # (!sFahrstreckeC(11) & (sFahrstreckeC(9) & 
-- ((\sCurrentStateN.z_output_command4WAIT~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(11),
	datab => sFahrstreckeC(9),
	datac => \sCurrentStateN.z_output_command5WAIT~0_combout\,
	datad => \sCurrentStateN.z_output_command4WAIT~0_combout\,
	combout => \data_1~1_combout\);

-- Location: LCCOMB_X23_Y32_N12
\sFahrstrecke[13]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[13]~8_combout\ = (\sCurrentState.z_decoded_bit12~q\ & \barcode_clock~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sCurrentState.z_decoded_bit12~q\,
	datad => \barcode_clock~input_o\,
	combout => \sFahrstrecke[13]~8_combout\);

-- Location: LCCOMB_X23_Y32_N8
\sFahrstrecke[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(13) = (\reset~input_o\ & ((\sFahrstrecke[13]~8_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[13]~8_combout\ & ((sFahrstrecke(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(13),
	datad => \sFahrstrecke[13]~8_combout\,
	combout => sFahrstrecke(13));

-- Location: LCCOMB_X23_Y32_N4
\sFahrstreckeC[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(13) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(13))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => sFahrstrecke(13),
	datac => sFahrstreckeC(13),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(13));

-- Location: LCCOMB_X21_Y33_N0
\data_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_1~0_combout\ = (sFahrstreckeC(13) & ((\sCurrentState.z_output_command6~q\) # (\sCurrentState.z_output_command6WAIT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sCurrentState.z_output_command6~q\,
	datac => sFahrstreckeC(13),
	datad => \sCurrentState.z_output_command6WAIT~q\,
	combout => \data_1~0_combout\);

-- Location: LCCOMB_X25_Y33_N0
\Selector15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit14~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit14~q\,
	combout => \Selector15~1_combout\);

-- Location: LCCOMB_X25_Y33_N8
\sFahrstrecke[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(15) = (\reset~input_o\ & ((\Selector15~1_combout\ & (\barcode_data~input_o\)) # (!\Selector15~1_combout\ & ((sFahrstrecke(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_data~input_o\,
	datac => sFahrstrecke(15),
	datad => \Selector15~1_combout\,
	combout => sFahrstrecke(15));

-- Location: LCCOMB_X25_Y33_N26
\sFahrstreckeC[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(15) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(15))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(15))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => sFahrstrecke(15),
	datac => sFahrstreckeC(15),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(15));

-- Location: LCCOMB_X24_Y33_N4
\data_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_1~2_combout\ = (\data_1~1_combout\) # ((\data_1~0_combout\) # ((sFahrstreckeC(15) & \data_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \data_1~1_combout\,
	datab => \data_1~0_combout\,
	datac => sFahrstreckeC(15),
	datad => \data_0~2_combout\,
	combout => \data_1~2_combout\);

-- Location: LCCOMB_X26_Y33_N16
\sFahrstrecke[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[7]~12_combout\ = (\sCurrentState.z_decoded_bit6~q\ & \barcode_clock~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sCurrentState.z_decoded_bit6~q\,
	datad => \barcode_clock~input_o\,
	combout => \sFahrstrecke[7]~12_combout\);

-- Location: LCCOMB_X26_Y33_N30
\sFahrstrecke[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(7) = (\reset~input_o\ & ((\sFahrstrecke[7]~12_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[7]~12_combout\ & ((sFahrstrecke(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(7),
	datad => \sFahrstrecke[7]~12_combout\,
	combout => sFahrstrecke(7));

-- Location: LCCOMB_X26_Y33_N8
\sFahrstreckeC[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(7) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(7))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(7))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(7),
	datab => \reset~input_o\,
	datac => sFahrstreckeC(7),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(7));

-- Location: LCCOMB_X26_Y33_N0
\sFahrstrecke[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[5]~11_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit4~q\,
	combout => \sFahrstrecke[5]~11_combout\);

-- Location: LCCOMB_X26_Y33_N14
\sFahrstrecke[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(5) = (\reset~input_o\ & ((\sFahrstrecke[5]~11_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[5]~11_combout\ & ((sFahrstrecke(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \barcode_data~input_o\,
	datab => \reset~input_o\,
	datac => sFahrstrecke(5),
	datad => \sFahrstrecke[5]~11_combout\,
	combout => sFahrstrecke(5));

-- Location: LCCOMB_X26_Y33_N26
\sFahrstreckeC[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(5) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstrecke(5)))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstreckeC(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstreckeC(5),
	datab => \reset~input_o\,
	datac => sFahrstrecke(5),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(5));

-- Location: LCCOMB_X25_Y33_N6
\data_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_1~3_combout\ = (\sCurrentStateN.z_output_command2WAIT~0_combout\ & ((sFahrstreckeC(5)) # ((\sCurrentStateN.z_output_command3WAIT~0_combout\ & sFahrstreckeC(7))))) # (!\sCurrentStateN.z_output_command2WAIT~0_combout\ & 
-- (\sCurrentStateN.z_output_command3WAIT~0_combout\ & (sFahrstreckeC(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentStateN.z_output_command2WAIT~0_combout\,
	datab => \sCurrentStateN.z_output_command3WAIT~0_combout\,
	datac => sFahrstreckeC(7),
	datad => sFahrstreckeC(5),
	combout => \data_1~3_combout\);

-- Location: LCCOMB_X23_Y33_N28
\sFahrstrecke[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[3]~14_combout\ = (\barcode_clock~input_o\ & \sCurrentState.z_decoded_bit2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \barcode_clock~input_o\,
	datad => \sCurrentState.z_decoded_bit2~q\,
	combout => \sFahrstrecke[3]~14_combout\);

-- Location: LCCOMB_X23_Y33_N12
\sFahrstrecke[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(3) = (\reset~input_o\ & ((\sFahrstrecke[3]~14_combout\ & ((\barcode_data~input_o\))) # (!\sFahrstrecke[3]~14_combout\ & (sFahrstrecke(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(3),
	datab => \barcode_data~input_o\,
	datac => \reset~input_o\,
	datad => \sFahrstrecke[3]~14_combout\,
	combout => sFahrstrecke(3));

-- Location: LCCOMB_X23_Y33_N22
\sFahrstreckeC[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(3) = ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(3))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(3))))) # (!\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(3),
	datab => \reset~input_o\,
	datac => sFahrstreckeC(3),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(3));

-- Location: LCCOMB_X24_Y33_N20
\sFahrstrecke[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \sFahrstrecke[1]~13_combout\ = (\sCurrentState.z_decoded_bit0~q\ & \barcode_clock~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sCurrentState.z_decoded_bit0~q\,
	datad => \barcode_clock~input_o\,
	combout => \sFahrstrecke[1]~13_combout\);

-- Location: LCCOMB_X24_Y33_N26
\sFahrstrecke[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstrecke(1) = (\reset~input_o\ & ((\sFahrstrecke[1]~13_combout\ & (\barcode_data~input_o\)) # (!\sFahrstrecke[1]~13_combout\ & ((sFahrstrecke(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \barcode_data~input_o\,
	datac => sFahrstrecke(1),
	datad => \sFahrstrecke[1]~13_combout\,
	combout => sFahrstrecke(1));

-- Location: LCCOMB_X25_Y33_N30
\sFahrstreckeC[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- sFahrstreckeC(1) = (\reset~input_o\ & ((GLOBAL(\Selector26~6clkctrl_outclk\) & (sFahrstrecke(1))) # (!GLOBAL(\Selector26~6clkctrl_outclk\) & ((sFahrstreckeC(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sFahrstrecke(1),
	datab => \reset~input_o\,
	datac => sFahrstreckeC(1),
	datad => \Selector26~6clkctrl_outclk\,
	combout => sFahrstreckeC(1));

-- Location: LCCOMB_X24_Y33_N12
\data_1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_1~4_combout\ = (\sCurrentStateN.z_output_command0WAIT~0_combout\ & ((sFahrstreckeC(1)) # ((sFahrstreckeC(3) & \sCurrentStateN.z_output_command1WAIT~0_combout\)))) # (!\sCurrentStateN.z_output_command0WAIT~0_combout\ & (sFahrstreckeC(3) & 
-- ((\sCurrentStateN.z_output_command1WAIT~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCurrentStateN.z_output_command0WAIT~0_combout\,
	datab => sFahrstreckeC(3),
	datac => sFahrstreckeC(1),
	datad => \sCurrentStateN.z_output_command1WAIT~0_combout\,
	combout => \data_1~4_combout\);

-- Location: LCCOMB_X25_Y33_N4
\data_1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_1~5_combout\ = (\reset~input_o\ & ((\data_1~2_combout\) # ((\data_1~3_combout\) # (\data_1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \data_1~2_combout\,
	datac => \data_1~3_combout\,
	datad => \data_1~4_combout\,
	combout => \data_1~5_combout\);

ww_ready <= \ready~output_o\;

ww_data_0 <= \data_0~output_o\;

ww_data_1 <= \data_1~output_o\;
END structure;


