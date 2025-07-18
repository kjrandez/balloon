# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/june/Documents/balloon/balloon_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/june/Documents/balloon/balloon_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {balloon_platform}\
-hw {/home/june/Documents/balloon/balloon_fpga/system.xsa}\
-out {/home/june/Documents/balloon}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {balloon_platform}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform clean
platform clean
platform generate
platform generate -domains zynq_fsbl 
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform generate
platform generate
platform clean
platform generate
