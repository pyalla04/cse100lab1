module sqrt (
    input  logic [7:0] a_i,
    output logic [7:0] y_o
);

    logic [7:0] sqrt_rom [256];  // Changed dimension from [255:0] to [256]

    // Initialize the ROM from the precomputed sqrt.memh file
    initial begin
        $readmemh("sqrt.memh", sqrt_rom);
    end

    // Continuous assignment to get the square root from the ROM
    assign y_o = sqrt_rom[a_i];

endmodule