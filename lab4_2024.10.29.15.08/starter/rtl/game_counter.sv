
// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module game_counter (
    input  logic       clk_4_i,
    input  logic       rst_ni,
    input  logic       en_i,
    output logic [4:0] count_o
);


    // Internal signals for current and next state of the counter
    logic [4:0] count_d, count_q;

    // Assign output
    assign count_o = !rst_ni ? 5'b11111 : count_q;

    // Combinational logic for the next state
    always_comb begin
        // Default assignment: hold the current count
        count_d = count_q;

        // Decrement logic when enable is active
        if (en_i) begin
            // Decrement normally by 1
            count_d = count_q - 1;
        end

    end

    // Sequential logic to update the current state
    always_ff @(posedge clk_4_i) begin
        if (!rst_ni) begin
            // Reset logic: initialize to 1f (31)
            count_q <= 5'b11111;
        end else begin
            // Update the current state with the next state
            count_q <= count_d;
        end
    end

endmodule

