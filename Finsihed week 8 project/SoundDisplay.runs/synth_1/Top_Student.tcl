# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {E:/Finsihed week 8 project/SoundDisplay.cache/wt} [current_project]
set_property parent.project_path {E:/Finsihed week 8 project/SoundDisplay.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {e:/Finsihed week 8 project/SoundDisplay.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/ADJ_CLOCK.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/Audio_Capture.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/BCD.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/D_FLIP.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/LED_WRITE.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/Oled_Display.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/volume_x1.v}
  {E:/Finsihed week 8 project/SoundDisplay.srcs/sources_1/new/Top_Student.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{E:/Finsihed week 8 project/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc}}
set_property used_in_implementation false [get_files {{E:/Finsihed week 8 project/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Top_Student -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top_Student.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_Student_utilization_synth.rpt -pb Top_Student_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
