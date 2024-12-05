// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module add (
    input  logic       clk_i,

    input  logic [7:0] a_i, b_i,
    output logic [7:0] sum_o
);

`ifdef SYNTHESIS
$error("Model is unsynthesizable.");
`else

logic [7:0] sum_d, sum_q;
assign sum_d = a_i + b_i;
assign sum_o = sum_q;

always_ff @(posedge clk_i) begin
    sum_q <= sum_d;
end

`endif

endmodule
