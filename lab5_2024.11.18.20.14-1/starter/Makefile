# Copyright (c) 2024 Ethan Sifferman.
# All rights reserved. Distribution Prohibited.

export YOSYS_DATDIR := $(shell yosys-config --datdir)
RTL := $(shell \
 YOSYS_DATDIR=$(YOSYS_DATDIR) \
 python3 scripts/convert_filelist.py rtl/rtl.f \
)

TOP := tb

sim:
	verilator dv/lint/verilator.lint --Mdir ${TOP}_$@_dir -f rtl/rtl.f -f dv/dv.f --binary --top ${TOP}
	./${TOP}_$@_dir/V${TOP} +verilator+rand+reset+0
	./${TOP}_$@_dir/V${TOP} +verilator+rand+reset+1
	./${TOP}_$@_dir/V${TOP} +verilator+rand+reset+2

lint:
	verilator dv/lint/verilator.lint --lint-only -f rtl/rtl.f -f dv/dv.f --top muladd
	verible-verilog-lint \
	 --waiver_files dv/lint/verible.waiver \
	 --rules_config dv/lint/verible.lint \
	 --autofix=inplace-interactive \
	 ${RTL}

synth/build/rtl.sv2v.v: ${RTL} scripts/convert_filelist.py rtl/rtl.f
	mkdir -p $(dir $@)
	sv2v ${RTL} -w $@ -DSYNTHESIS

synth/build/blackboxes.sv2v.v: synth/blackboxes.sv
	mkdir -p $(dir $@)
	sv2v $< -w $@ -DSYNTHESIS

synth/yosys_common/build/synth.v: synth/build/rtl.sv2v.v synth/build/blackboxes.sv2v.v synth/yosys_common/yosys.tcl
	mkdir -p $(dir $@)
	yosys -p 'tcl synth/yosys_common/yosys.tcl' -l synth/yosys_common/build/yosys.log

gls: synth/yosys_common/build/synth.v
	verilator dv/lint/verilator.lint --Mdir ${TOP}_$@_dir -f synth/yosys_common/gls.f -f dv/dv.f --binary --top ${TOP}
	./${TOP}_$@_dir/V${TOP} +verilator+rand+reset+0
	./${TOP}_$@_dir/V${TOP} +verilator+rand+reset+1
	./${TOP}_$@_dir/V${TOP} +verilator+rand+reset+2

clean:
	rm -rf \
	 dump.fst \
	 *sim_dir *gls_dir \
	 synth/build \
	 synth/yosys_common/build
