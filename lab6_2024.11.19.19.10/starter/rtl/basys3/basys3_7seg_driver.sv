module basys3_7seg_driver (
    input  wire        clk_1k_i,
    input  wire        rst_ni,
    input  wire        digit0_en_i,
    input  wire [3:0]  digit0_i,
    input  wire        digit1_en_i,
    input  wire [3:0]  digit1_i,
    input  wire        digit2_en_i,
    input  wire [3:0]  digit2_i,
    input  wire        digit3_en_i,
    input  wire [3:0]  digit3_i,
    output reg  [3:0]  anode_o,
    output wire [6:0]  segments_o
);

    // Counter for digit selection
    reg [1:0] counter_q;
    wire [1:0] counter_d;

    assign counter_d = counter_q + 2'b01;

    always @(posedge clk_1k_i or negedge rst_ni) begin
        if (!rst_ni)
            counter_q <= 2'b00;
        else
            counter_q <= counter_d;
    end

    // Current digit and decoded segment signals
    reg [3:0] current_digit;
    wire [6:0] decoded_segments;

    // Instantiate 7-segment decoder
    hex7seg hex7seg_inst (
        .d3(current_digit[3]),
        .d2(current_digit[2]),
        .d1(current_digit[1]),
        .d0(current_digit[0]),
        .A(decoded_segments[0]),
        .B(decoded_segments[1]),
        .C(decoded_segments[2]),
        .D(decoded_segments[3]),
        .E(decoded_segments[4]),
        .F(decoded_segments[5]),
        .G(decoded_segments[6])
    );

    // Enable signal for segment display
    reg segments_en;

    assign segments_o = segments_en ? ~decoded_segments : ~7'b0;

    always_comb begin
        // Default values
        anode_o = 4'b1111;
        current_digit = 4'bxxxx;
        segments_en = 1'b0;

        // Select active digit and control signals
        case (counter_q)
            2'b00: begin
                current_digit = digit0_i;
                anode_o[0] = ~digit0_en_i;
                segments_en = digit0_en_i;
            end
            2'b01: begin
                current_digit = digit1_i;
                anode_o[1] = ~digit1_en_i;
                segments_en = digit1_en_i;
            end
            2'b10: begin
                current_digit = digit2_i;
                anode_o[2] = ~digit2_en_i;
                segments_en = digit2_en_i;
            end
            2'b11: begin
                current_digit = digit3_i;
                anode_o[3] = ~digit3_en_i;
                segments_en = digit3_en_i;
            end
            default: ; // No action
        endcase
    end

endmodule
