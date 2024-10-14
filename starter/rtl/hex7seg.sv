// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module hex7seg(
    input  logic d3,d2,d1,d0,
    output logic A,B,C,D,E,F,G
);

    always_comb begin
        case ({d3,d2,d1,d0})
            4'h0: {A, B, C, D, E, F, G} = 7'b1111110;
            4'h1: {A, B, C, D, E, F, G} = 7'b0110000;
            4'h2: {A, B, C, D, E, F, G} = 7'b1101101;
            4'h3: {A, B, C, D, E, F, G} = 7'b1111001;
            4'h4: {A, B, C, D, E, F, G} = 7'b0110011;
            4'h5: {A, B, C, D, E, F, G} = 7'b1011011;
            4'h6: {A, B, C, D, E, F, G} = 7'b1011111;
            4'h7: {A, B, C, D, E, F, G} = 7'b1110000;
            4'h8: {A, B, C, D, E, F, G} = 7'b1111111;
            4'h9: {A, B, C, D, E, F, G} = 7'b1111011;
            4'hA: {A, B, C, D, E, F, G} = 7'b1110111;
            4'hB: {A, B, C, D, E, F, G} = 7'b0011111;
            4'hC: {A, B, C, D, E, F, G} = 7'b1001110;
            4'hD: {A, B, C, D, E, F, G} = 7'b0111101;
            4'hE: {A, B, C, D, E, F, G} = 7'b1001111;
            4'hF: {A, B, C, D, E, F, G} = 7'b1000111;
            default: {A, B, C, D, E, F, G} = 7'b0000000; // Blank display
        endcase
    end
endmodule
