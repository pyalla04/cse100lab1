module lfsr16 (
    clk_i,
    rst_ni,
    next_i,
    rand_o
);
    input wire clk_i;
    input wire rst_ni;
    input wire next_i;
    output wire [15:0] rand_o;

    wire [15:0] rand_d;
    reg [15:0] rand_q;

    assign rand_d[15:1] = rand_q[14:0];
    assign rand_d[0] = ^(rand_q & 16'hd008);
    assign rand_o = rand_q;

    always @(posedge clk_i) begin
        if (!rst_ni) begin
            rand_q <= 1;
        end else if (next_i) begin
            rand_q <= rand_d;
        end
    end
endmodule
