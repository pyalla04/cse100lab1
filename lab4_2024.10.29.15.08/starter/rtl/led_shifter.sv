// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module led_shifter (
    input  logic        clk_i,
    input  logic        rst_ni,

    input  logic        shift_i,

    input  logic [15:0] switches_i,
    input  logic        load_i,

    input  logic        off_i,
    output logic [15:0] leds_o
);


    // 16-bit shift register
    logic [15:0] leds_q, leds_d;

    // Logic for the shift operation and parallel load
    assign leds_d = (load_i) ? switches_i :
                    (shift_i) ? {leds_q[14:0], 1'b1} : leds_q;

    // Sequential logic for updating the shift register on clock edge
    always_ff @(posedge clk_i) begin
        if (!rst_ni)
            leds_q <= 16'b0;  // Initialize to 0 on reset
        else
            leds_q <= leds_d;
    end

    // Connect the output
    assign leds_o = (off_i) ? 16'b0 :
                    leds_q;

endmodule
