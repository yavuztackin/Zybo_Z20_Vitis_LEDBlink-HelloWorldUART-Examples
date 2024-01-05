# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\YAVUZ\workspace\leddeneme\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\YAVUZ\workspace\leddeneme\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {leddeneme}\
-hw {C:\Users\YAVUZ\Desktop\Vivado Projects\Zybo_Z20_HelloWorld\design_1_wrapper_ledblinkdeneme.xsa}\
-proc {microblaze_0} -os {standalone} -out {C:/Users/YAVUZ/workspace}

platform write
platform generate -domains 
platform active {leddeneme}
platform generate
platform active {leddeneme}
catch {platform remove anotherone}
catch {platform remove design_1_wrapper}
platform generate -domains 
