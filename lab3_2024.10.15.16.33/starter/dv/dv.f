// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

dv/tb.sv
dv/mmcm_100_to_25_175.sv

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
