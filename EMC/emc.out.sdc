## Generated SDC file "emc.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

## DATE    "Fri Sep 14 13:56:42 2018"

##
## DEVICE  "EP4CE6E22C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {crsclk50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clock}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {inst|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 1 -divide_by 5 -master_clock {crsclk50} [get_pins {inst|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {inst|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {inst|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 2 -master_clock {crsclk50} [get_pins {inst|altpll_component|auto_generated|pll1|clk[1]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {crsclk50}] -rise_to [get_clocks {crsclk50}] -setup 1.000  
set_clock_uncertainty -rise_from [get_clocks {crsclk50}] -fall_to [get_clocks {crsclk50}] -setup 1.000  
set_clock_uncertainty -fall_from [get_clocks {crsclk50}] -rise_to [get_clocks {crsclk50}] -setup 1.000  
set_clock_uncertainty -fall_from [get_clocks {crsclk50}] -fall_to [get_clocks {crsclk50}] -setup 1.000  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_AM}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Aabc[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Aabc[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Aabc[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Alarm[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Alarm[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Alarm[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Alarm[3]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_BM}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Babc[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Babc[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Babc[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Home[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Home[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Home[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Home[3]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[3]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[4]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[5]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[6]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[7]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[8]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[9]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[10]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[11]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[12]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[13]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[14]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Input[15]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[3]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[4]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[5]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[6]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_LimitPN[7]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Xabc[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Xabc[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Xabc[2]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Yabc[0]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Yabc[1]}]
set_input_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Yabc[2]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {ADirIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {APlsIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {BDirIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {BPlsIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Enable[0]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Enable[1]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Enable[2]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Enable[3]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[0]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[1]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[2]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[3]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[4]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[5]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[6]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[7]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[8]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[9]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[10]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[11]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[12]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[13]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[14]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_IO_Output[15]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Reset[0]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Reset[1]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Reset[2]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {EX_Reset[3]}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {XDirIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {XPlsIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {YDirIO}]
set_output_delay -add_delay  -clock [get_clocks {crsclk50}]  8.000 [get_ports {YPlsIO}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

