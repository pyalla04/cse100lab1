// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module basys3_7seg_driver (
    input              clk_1k_i,
    input              rst_ni,

    input  logic       digit0_en_i,
    input  logic [3:0] digit0_i,
    input  logic       digit1_en_i,
    input  logic [3:0] digit1_i,
    input  logic       digit2_en_i,
    input  logic [3:0] digit2_i,
    input  logic       digit3_en_i,
    input  logic [3:0] digit3_i,

    output logic [3:0] anode_o,
    output logic [6:0] segments_o
);


    // Declare state for digit selection (which digit is currently enabled)
    logic [3:0] digit_select_q;
    logic [3:0] digit_select_d;
    logic [3:0] current_digit;

    // 7-segment outputs
    logic A, B, C, D, E, F, G;

    assign digit_select_d = {digit3_en_i,digit2_en_i,digit1_en_i,digit0_en_i};

    // Anode control: Active low; enable one digit at a time
    always_ff @(posedge clk_1k_i) begin
        if (!rst_ni) begin
            digit_select_q <= digit_select_d; // Start with the first digit
        end else begin
            digit_select_q <= digit_select_d; // Cycle through the digits
        end
    end

    // Select the current digit based on the digit_select value
    always_comb begin
        case (digit_select_q)
            4'b0001: begin
                anode_o = 4'b1110; // Enable digit 0
                current_digit = digit0_i;
            end
            4'b0010: begin
                anode_o = 4'b1101; // Enable digit 1
                current_digit = digit1_i;
            end
            4'b0100: begin
                anode_o = 4'b1011; // Enable digit 2
                current_digit = digit2_i;
            end
            4'b1000: begin
                anode_o = 4'b0111; // Enable digit 3
                current_digit = digit3_i;
            end
            default: begin
                anode_o = 4'b1111; // Turn off all digits (default case)
                current_digit = 4'b0000; // Default to 0
            end
        endcase
    end

    // Instantiate the hex7seg module to convert the current digit to 7-segment representation
    hex7seg hex7seg_inst (
        .d3(current_digit[3]), // Most significant bit
        .d2(current_digit[2]),
        .d1(current_digit[1]),
        .d0(current_digit[0]),
        .A(A), // Connect outputs
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G)
    );

    // Assign segment output to the output port based on the hex7seg outputs
    assign segments_o = {A, B, C, D, E, F, G};


endmodule
