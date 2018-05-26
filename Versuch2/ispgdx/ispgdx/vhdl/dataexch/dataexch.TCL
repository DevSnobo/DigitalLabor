#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file c:\isptools\ispsys\examples\isplsi_gal\ispgdx\vhdl\dataexch\dataexch.TCL
#-- Written on Wed Sep 20 17:52:12 2000


#-- begin a new section
project -new

#-- Device options
set_option -technology MACH
set_option -part M5-128

#-- add_file options
add_file -vhdl -lib work "dataexch.vhd"

#-- top module name
set_option -top_module dataexch

#simulation options
set_option -write_verilog true
set_option -write_vhdl true

#-- set result format/file last
project -result_file "dataexch.edi"

#-- error message log file
project -log_file dataexch.log

#-- let's save it
project -save dataexch.tc_

#-- run Synplify
project -run

#-- **************************************************

#-- exit from Synplify
exit
