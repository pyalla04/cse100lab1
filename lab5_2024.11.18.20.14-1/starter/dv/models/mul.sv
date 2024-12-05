// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module mul (
    input  logic       clk_i,
    input  logic       rst_ni,

    input  logic       in_valid_i,

    input  logic [7:0] a_i, b_i,
    output logic [7:0] prod_o,
    output logic       prod_valid_o
);

`ifdef SYNTHESIS
$error("Model is unsynthesizable.");
`else

int delay;
logic [7:0] internal_product;

always_ff @(posedge clk_i) begin
    if (!rst_ni) begin
        prod_valid_o <= 0;
        prod_o <= 0;
    end else if (in_valid_i) begin
        internal_product = a_i * b_i;
        prod_valid_o <= 0;
        delay = (internal_product != 0);
        while (delay--) @(posedge clk_i);
        prod_o <= internal_product;
        prod_valid_o <= 1;
    end
end

`endif

endmodule
