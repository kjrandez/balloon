# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/june/Documents/balloon/balloon_system/_ide/scripts/systemdebugger_balloon_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/june/Documents/balloon/balloon_system/_ide/scripts/systemdebugger_balloon_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/june/Documents/balloon/balloon_platform/export/balloon_platform/hw/system.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
stop
targets -set -nocase -filter {name =~ "*A9*#0"}
rst -processor
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/june/Documents/balloon/balloon_os/Debug/balloon_os.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
