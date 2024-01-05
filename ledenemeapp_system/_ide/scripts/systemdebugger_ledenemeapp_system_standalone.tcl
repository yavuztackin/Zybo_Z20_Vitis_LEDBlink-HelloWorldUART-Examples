# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\YAVUZ\workspace\ledenemeapp_system\_ide\scripts\systemdebugger_ledenemeapp_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\YAVUZ\workspace\ledenemeapp_system\_ide\scripts\systemdebugger_ledenemeapp_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351B4824AA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351B4824AA-23727093-0"}
fpga -file C:/Users/YAVUZ/workspace/ledenemeapp/_ide/bitstream/design_1_wrapper_ledblinkdeneme.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/YAVUZ/workspace/leddeneme/export/leddeneme/hw/design_1_wrapper_ledblinkdeneme.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/YAVUZ/workspace/ledenemeapp/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/Users/YAVUZ/workspace/ledenemeapp/Release/ledenemeapp.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
