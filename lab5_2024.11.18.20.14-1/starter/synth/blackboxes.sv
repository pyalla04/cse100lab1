// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

(* blackbox *)
module mul (
    input  logic       clk_i,
    input  logic       rst_ni,

    input  logic       in_valid_i,

    input  logic [7:0] a_i, b_i,
    output logic [7:0] prod_o,
    output logic       prod_valid_o
);
endmodule

(* blackbox *)
module add (
    input  logic       clk_i,

    input  logic [7:0] a_i, b_i,
    output logic [7:0] sum_o
);
endmodule
