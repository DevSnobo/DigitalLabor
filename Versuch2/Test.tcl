
########## Tcl recorder starts at 04/19/18 10:54:51 ##########

set version "2.0"
set proj_dir "C:/ispLEVER_Classic2_0/examples"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"test.vhd\" -o \"test.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/19/18 10:54:51 ###########


########## Tcl recorder starts at 04/19/18 10:56:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/vhd2jhd\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/funktionstabelle.vhd\" -o \"funktionstabelle.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/vhd2jhd\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/or.vhd\" -o \"or.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/vhd2jhd\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/und3.vhd\" -o \"und3.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/vhd2jhd\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/halbad.vhd\" -o \"halbad.jhd\" -m \"$install_dir/ispcpld/generic/lib/vhd/location.map\" -p \"$install_dir/ispcpld/generic/lib\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/19/18 10:56:11 ###########


########## Tcl recorder starts at 04/19/18 11:04:16 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj test -mod UND3_ent -out \"UND3_ent\" -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht -p \"$install_dir/ispcpld/generic\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/und3.vhd\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/19/18 11:04:16 ###########


########## Tcl recorder starts at 04/19/18 11:05:15 ##########

# Commands to make the Process: 
# Hierarchy Browser
# - none -
# Application to view the Process: 
# Hierarchy Browser
if [runCmd "\"$cpld_bin/hierbro\" \"test.jid\"  UND3_ent"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/19/18 11:05:15 ###########


########## Tcl recorder starts at 04/19/18 11:07:29 ##########

# Commands to make the Process: 
# Synplify Synthesize VHDL File
if [catch {open UND3_ent.cmd w} rspFile] {
	puts stderr "Cannot create response file UND3_ent.cmd: $rspFile"
} else {
	puts $rspFile "STYFILENAME: test.sty
PROJECT: UND3_ent
WORKING_PATH: \"$proj_dir\"
MODULE: UND3_ent
VHDL_FILE_LIST: \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/und3.vhd\"
OUTPUT_FILE_NAME: UND3_ent
SUFFIX_NAME: edi
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/Synpwrap\" -e UND3_ent -target ispGAL -pro "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete UND3_ent.cmd

########## Tcl recorder end at 04/19/18 11:07:29 ###########


########## Tcl recorder starts at 04/23/18 13:52:00 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj test -mod UND3_ent -out \"UND3_ent\" -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht -p \"$install_dir/ispcpld/generic\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/und3.vhd\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/23/18 13:52:00 ###########


########## Tcl recorder starts at 04/23/18 13:52:54 ##########

# Commands to make the Process: 
# VHDL Test Bench Template
if [runCmd "\"$cpld_bin/vhd2naf\" -tfi -proj test -mod UND3_ent -out \"UND3_ent\" -tpl \"$install_dir/ispcpld/generic/vhdl/testbnch.tft\" -ext vht -p \"$install_dir/ispcpld/generic\" \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/und3.vhd\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/23/18 13:52:54 ###########


########## Tcl recorder starts at 04/23/18 13:55:12 ##########

# Commands to make the Process: 
# Aldec VHDL Functional Simulation
if [catch {open udo._sp w} rspFile] {
	puts stderr "Cannot create response file udo._sp: $rspFile"
} else {
	puts $rspFile "# ispLever System simulation template: UND3_tbfa.udo.
# You may edit this file to control your simulation.
# You may specify your waveforms.
add wave *
# You may specify your simulation run time.
run 1000 ns
"
	close $rspFile
}
if [catch {open UND3_tb._sp w} rspFile] {
	puts stderr "Cannot create response file UND3_tb._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#stimulus vhdl UND3_ent UND3_tb.vhd
#insert # NOTE: Do not edit this file.
#insert # Auto generated by VHDL Functional Simulation Models
#insert #
#insert design create work .
#insert design open work
#insert adel -all
#unixpath
#do 
#unixpath $install_dir/ispcpld/generic/verilog
#libfile generic.vlb
#vlogdef test.h
#unixpath
#insert source {$cpld_bin/chipsim_cmd.tcl}
#prjInfo test.sty
#vlogSrc 
#unixpath
#vcomSrc  \"../../Users/RobinFritz/Downloads/Versuch 1/VHDL/und3.vhd\"
#vcom UND3_tb.vhd
#insert vsim +access +r %<StimModule>%
#youdo UND3_tbfa.udo
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"UND3_tb._sp\" \"UND3_tb.fado\" \"udo._sp\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete udo._sp
file delete UND3_tb._sp
# Application to view the Process: 
# Aldec VHDL Functional Simulation
if [catch {open UND3_tb_activehdl_user.do w} rspFile] {
	puts stderr "Cannot create response file UND3_tb_activehdl_user.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
"
	close $rspFile
}
if [catch {open UND3_tb_activehdl.do w} rspFile] {
	puts stderr "Cannot create response file UND3_tb_activehdl.do: $rspFile"
} else {
	puts $rspFile "set SIM_WORKING_FOLDER .
do -tcl UND3_tb.fado
"
	close $rspFile
}
if [runCmd "\"$install_dir/active-hdl/BIN/avhdl\" -do \"UND3_tb_activehdl.do\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/23/18 13:55:12 ###########

