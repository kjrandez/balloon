# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/june/Documents/balloon/balloon_system/_ide/scripts/systemdebugger_balloon_system_1_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/june/Documents/balloon/balloon_system/_ide/scripts/systemdebugger_balloon_system_1_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248B4AA3E" && level==0 && jtag_device_ctx=="jsn-Zed-210248B4AA3E-23727093-0"}
fpga -file /home/june/Documents/balloon/balloon_os/_ide/bitstream/system.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/june/Documents/balloon/balloon_platform/export/balloon_platform/hw/system.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/june/Documents/balloon/balloon_os/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/june/Documents/balloon/balloon_os/Debug/balloon_os.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
