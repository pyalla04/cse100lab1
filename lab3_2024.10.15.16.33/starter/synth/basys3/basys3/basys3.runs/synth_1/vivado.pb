
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:032

00:00:062	
515.0472	
198.082Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3/basys3.srcs/utils_1/imports/synth_1/screensaver.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
~C:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3/basys3.srcs/utils_1/imports/synth_1/screensaver.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
a
Command: %s
53*	vivadotcl20
.synth_design -top basys3 -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 
Z
$Part: %s does not have CEAM library.966*device2
xc7a35tcpg236-1Z21-9227h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
O
#Helper process launched with PID %s4824*oasys2
268744Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 1367.000 ; gain = 448.543
h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
hsync2
wire2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
518@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
vsync2
wire2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
528@Z8-11241h px� 
�
.redeclaration of ANSI port '%s' is not allowed7382*oasys2
vga_green_o2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
868@Z8-11121h px� 
�
)'%s' was previously declared with a range5241*oasys2
vga_green_o2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
868@Z8-8983h px� 
�
.redeclaration of ANSI port '%s' is not allowed7382*oasys2

vga_blue_o2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
918@Z8-11121h px� 
�
)'%s' was previously declared with a range5241*oasys2

vga_blue_o2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
918@Z8-8983h px� 
�
.identifier '%s' is used before its declaration4750*oasys2

position_y2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
298@Z8-6901h px� 
�
.identifier '%s' is used before its declaration4750*oasys2

position_x2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
298@Z8-6901h px� 
�
synthesizing module '%s'%s4497*oasys2
basys32
 2Q
MC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3.sv2
48@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
screensaver2
 2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
58@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
images2
 2H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
48@Z8-6157h px� 
e
%s
*synth2M
K	Parameter IMAGE_ROM_SIZE bound to: 32'sb00000000000000000100101100000000 
h p
x
� 
�
%s, ignoring3604*oasys2z
xcould not open $readmem data file 'rubylith.memh'; please make sure the file is added to project and has read permission2H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
228@Z8-4445h px� 
�
%s, ignoring3604*oasys2v
tcould not open $readmem data file 'slug.memh'; please make sure the file is added to project and has read permission2H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
238@Z8-4445h px� 
�
%s, ignoring3604*oasys2x
vcould not open $readmem data file 'vivado.memh'; please make sure the file is added to project and has read permission2H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
248@Z8-4445h px� 
�
%s, ignoring3604*oasys2w
ucould not open $readmem data file 'finch.memh'; please make sure the file is added to project and has read permission2H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
258@Z8-4445h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
images2
 2
02
12H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
48@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	vga_timer2
 2K
GC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/vga_timer.sv2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	vga_timer2
 2
02
12K
GC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/vga_timer.sv2
68@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
screensaver2
 2
02
12M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
58@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
basys32
 2
02
12Q
MC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3.sv2
48@Z8-6155h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
image0_rdata2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
248@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
image1_rdata2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
258@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
image2_rdata2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
268@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
image3_rdata2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
278@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
r_image_sel2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
688@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
w_hsync2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
438@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
w_vsync2
screensaver2M
IC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/screensaver.sv2
448@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2

clk_25_1752
basys32Q
MC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3.sv2
208@Z8-3848h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[14]2
imagesZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[13]2
imagesZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[12]2
imagesZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[11]2
imagesZ8-7129h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[10]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[9]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[8]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[7]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[6]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[5]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[4]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[3]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[2]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[1]2
imagesZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
rom_addr_i[0]2
imagesZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2	
clk_1002
basys3Z8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:06 . Memory (MB): peak = 1476.465 ; gain = 558.008
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:03 ; elapsed = 00:00:06 . Memory (MB): peak = 1476.465 ; gain = 558.008
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:03 ; elapsed = 00:00:06 . Memory (MB): peak = 1476.465 ; gain = 558.008
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1476.4652
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2Y
UC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/Basys3_Master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2Y
UC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/Basys3_Master.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2W
UC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/Basys3_Master.xdc2
.Xil/basys3_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1561.4492
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0022

1561.4492
0.000Z17-268h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:12 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:12 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:04 ; elapsed = 00:00:12 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
7
%s
*synth2
Start Preparing Guide Design
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
�The reference checkpoint %s is not suitable for use with incremental synthesis for this design. Please regenerate the checkpoint for this design with -incremental_synth switch in the same Vivado session that synth_design has been run. Synthesis will continue with the default flow4740*oasys2�
~C:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3/basys3.srcs/utils_1/imports/synth_1/screensaver.dcpZ8-6895h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Doing Graph Differ : Time (s): cpu = 00:00:04 ; elapsed = 00:00:12 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Preparing Guide Design : Time (s): cpu = 00:00:04 ; elapsed = 00:00:12 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:12 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
C
%s
*synth2+
)

Incremental Synthesis Report Summary:

h p
x
� 
<
%s
*synth2$
"1. Incremental synthesis run: no

h p
x
� 
O
%s
*synth27
5   Reason for not running incremental synthesis : 


h p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 2     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 5     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 7     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2'
%screensaver/images/image0_rdata_q_reg2
122
42H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
338@Z8-3936h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2'
%screensaver/images/image1_rdata_q_reg2
122
42H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
348@Z8-3936h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2'
%screensaver/images/image2_rdata_q_reg2
122
42H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
358@Z8-3936h px� 
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2'
%screensaver/images/image3_rdata_q_reg2
122
42H
DC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/rtl/images.sv2
368@Z8-3936h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2	
clk_1002
basys3Z8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:04 ; elapsed = 00:00:14 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:05 ; elapsed = 00:00:18 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:18 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:05 ; elapsed = 00:00:18 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|      |Cell |Count |
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|1     |OBUF |    14|
h px� 
0
%s*synth2
+------+-----+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 1 critical warnings and 6 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:01 ; elapsed = 00:00:20 . Memory (MB): peak = 1561.449 ; gain = 558.008
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:05 ; elapsed = 00:00:21 . Memory (MB): peak = 1561.449 ; gain = 642.992
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1561.4492
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1561.4492
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
U
%Synth Design complete | Checksum: %s
562*	vivadotcl2	
609b79cZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272
362
52
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:062

00:00:262

1561.4492

1042.473Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002

00:00:002

1561.4492
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2k
iC:/Users/pooja/Downloads/lab3_2024.10.15.16.33/starter/synth/basys3/basys3/basys3.runs/synth_1/basys3.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2W
Ureport_utilization -file basys3_utilization_synth.rpt -pb basys3_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Oct 22 20:07:03 2024Z17-206h px� 


End Record