// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

rtl/muladd_pkg.sv
${YOSYS_DATDIR}/simlib.v

dv/models/mul.sv
dv/models/add.sv
dv/tb.sv

--timing
-j 0
-Wall
--assert
--trace-fst
--trace-structs
--main-top-name "-"

// Run with +verilator+rand+reset+2
--x-assign unique
--x-initial unique
