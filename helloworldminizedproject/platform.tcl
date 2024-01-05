# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\YAVUZ\workspace\helloworldminizedproject\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\YAVUZ\workspace\helloworldminizedproject\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {helloworldminizedproject}\
-hw {C:\Users\YAVUZ\Desktop\Vivado Projects\HelloWorld\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/Users/YAVUZ/workspace}

platform write
platform generate -domains 
platform active {helloworldminizedproject}
bsp reload
bsp config stdin "ps7_uart_1"
bsp config stdout "ps7_uart_1"
bsp write
platform generate
platform active {helloworldminizedproject}
platform generate
