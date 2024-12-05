// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module lfsr (
    input  logic       clk_i,
    input  logic       rst_ni,

    input  logic       next_i,
    output logic [4:0] rand_o
);

 // 8-bit shift register
    logic [7:0] rand_q, rand_d;

    // XOR feedback from specified bits: rand_q[0], rand_q[5], rand_q[6], and rand_q[7]
    logic feedback;

    assign feedback = rand_q[0] ^ rand_q[5] ^ rand_q[6] ^ rand_q[7];

    // Update the next state of the LFSR
    assign rand_d = (next_i) ? {rand_q[6:0], feedback} : rand_q;

    // Sequential logic for updating the LFSR on the clock edge
    always_ff @(posedge clk_i) begin
        if (!rst_ni)
            rand_q <= 8'b00000001;  // Initialize to a non-zero state on reset
        else
            rand_q <= rand_d;
    end

    // Connect the output
    assign rand_o = rand_q;

endmodule

