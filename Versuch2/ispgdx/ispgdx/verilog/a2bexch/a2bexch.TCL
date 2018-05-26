#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file c:\isptools\ispcpld\examples\ispgdx\verilog\a2bexch\a2bexch.TCL
#-- Written on Mon Dec 04 15:49:28 2000


#-- begin a new section
project -new

#-- Device options
set_option -technology MACH
set_option -part M5-128

#-- add_file options
add_file -verilog "C:\\ISPTOOLS\\SYNPLIFY\\LIB\\CPLD\\lattice.v"
add_file -verilog "C:\\ISPTOOLS\\ISPCPLD\\generic\\verilog\\synplify\\generic.v"
add_file -verilog "a2bexch.v"

#-- top module name
set_option -top_module a2bexch

#simulation options
set_option -write_verilog true
set_option -write_vhdl true

#-- set result format/file last
project -result_file "a2bexch.edi"

#-- error message log file
project -log_file a2bexch.log

#-- let's save it
project -save a2bexch.tc_

#-- run Synplify
project -run

#-- **************************************************

#-- exit from Synplify
exit
