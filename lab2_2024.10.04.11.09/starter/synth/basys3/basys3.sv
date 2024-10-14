module basys3 (
    input wire [15:0] sw,        // 16 switches
    input wire btnU, btnL, btnD, btnR,  // 4 directional buttons
    output wire [7:0] led        // 8 LEDs
);

    // Internal signal declarations
    wire [7:0] a_i;              // Operand A
    wire [7:0] b_i;              // Operand B
    wire [3:0] operation_i;      // ALU operation input
    wire [7:0] y_o;              // ALU output

    // Connect switches to ALU operands
    assign a_i = sw[7:0];        // Bottom 8 switches to operand A
    assign b_i = sw[15:8];       // Top 8 switches to operand B

    // Connect directional buttons to ALU operation input
    assign operation_i = {btnU, btnL, btnD, btnR};

    // Instantiate the ALU
    alu u_alu (.a_i(a_i),.b_i(b_i),.operation_i(operation_i),.y_o(y_o));

    // Connect ALU output to LEDs
    assign led = y_o;

endmodule
