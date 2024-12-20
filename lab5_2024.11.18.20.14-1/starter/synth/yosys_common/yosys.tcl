# Copyright (c) 2024 Ethan Sifferman.
# All rights reserved. Distribution Prohibited.

yosys -import

read_verilog -sv synth/build/blackboxes.sv2v.v
read_verilog -sv -icells synth/build/rtl.sv2v.v

prep
opt
stat
write_verilog -noexpr -noattr -simple-lhs synth/yosys_common/build/synth.v
