# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.runs/synth_1/top_level_vga.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 2
set_param synth.incrementalSynthesisCache C:/Users/haide/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-20756-haider/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.cache/wt [current_project]
set_property parent.project_path C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_verilog -library xil_defaultlib {
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/DigitToSeg.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/XADCdemo.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/clock.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/counter3bit.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/decoder3_8.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/h_count.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/mover.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/mux4_4bus.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/pixel_gen.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/segClkDevider.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/imports/hdl/sevensegdecoder.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/v_count.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/vga_sync.v
  C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/new/top_level_vga.v
}
read_ip -quiet C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/sources_1/ip/xadc_wiz_0/xadc_wiz_0.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/constrs_1/imports/constraints/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/haide/Downloads/Basys3-Joystick-Interfacing-main/Basys3-Joystick-Interfacing-main/test.srcs/constrs_1/imports/constraints/Basys3_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top top_level_vga -part xc7a35tcpg236-1
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_level_vga.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_level_vga_utilization_synth.rpt -pb top_level_vga_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
