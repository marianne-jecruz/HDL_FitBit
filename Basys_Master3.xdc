set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# load_bcditches
set_property PACKAGE_PIN V17 [get_ports {mode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {mode[0]}]    
set_property PACKAGE_PIN V16 [get_ports {mode[1]}]			
	set_property IOSTANDARD LVCMOS33 [get_ports {mode[1]}]    	

set_property PACKAGE_PIN V2 [get_ports {sw_value[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[0]}]
set_property PACKAGE_PIN T3 [get_ports {sw_value[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[1]}]
set_property PACKAGE_PIN T2 [get_ports {sw_value[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[2]}]
set_property PACKAGE_PIN R3 [get_ports {sw_value[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[3]}]
set_property PACKAGE_PIN W2 [get_ports {sw_value[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[4]}]
set_property PACKAGE_PIN U1 [get_ports {sw_value[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[5]}]
set_property PACKAGE_PIN T1 [get_ports {sw_value[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[6]}]
set_property PACKAGE_PIN R2 [get_ports {sw_value[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw_value[7]}]


	
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
set_property PACKAGE_PIN W6 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U8 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V5 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]

set_property PACKAGE_PIN V7 [get_ports dp]							
	set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
## LEDs
set_property PACKAGE_PIN U16 [get_ports {out}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out}]


