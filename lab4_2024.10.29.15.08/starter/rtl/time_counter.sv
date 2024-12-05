
// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module time_counter (
    input  logic       clk_4_i,
    input  logic       rst_ni,
    input  logic       en_i,
    output logic [4:0] count_o
);

    // Internal signal declarations
    logic [4:0] count_d, count_q;

    // Assign output
    assign count_o = count_q;

    // Combinational logic for next state
    always_comb begin
        // Initialize count_d to avoid X state
        count_d = count_q;

        if (en_i) begin
            // Increment count when enabled
            count_d = count_q + 1;
        end

    end

    // Sequential logic for updating the current state
    always_ff @(posedge clk_4_i) begin
        if (!rst_ni) begin
            // Reset logic: initialize to 0
            count_q <= 5'b00000;
        end else begin
            // Update current state with next state
            count_q <= count_d;
        end
    end

endmodule


