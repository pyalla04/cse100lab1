module vga_timer (
    clk_i,
    rst_ni,
    hsync_o,
    vsync_o,
    visible_o,
    position_x_o,
    position_y_o
);
    parameter signed [31:0] H_VISIBLE = 640;
    parameter signed [31:0] H_FRONT = 16;
    parameter signed [31:0] H_SYNC = 96;
    parameter signed [31:0] H_BACK = 48;
    localparam signed [31:0] WHOLE_LINE =
        ((H_VISIBLE + H_FRONT) + H_SYNC) + H_BACK;
    parameter signed [31:0] V_VISIBLE = 480;
    parameter signed [31:0] V_FRONT = 10;
    parameter signed [31:0] V_SYNC = 2;
    parameter signed [31:0] V_BACK = 33;
    localparam signed [31:0] WHOLE_FRAME =
        ((V_VISIBLE + V_FRONT) + V_SYNC) + V_BACK;

    input wire clk_i;
    input wire rst_ni;
    output wire hsync_o;
    output wire vsync_o;
    output wire visible_o;
    output wire [$clog2(H_VISIBLE) - 1:0] position_x_o;
    output wire [$clog2(V_VISIBLE) - 1:0] position_y_o;

    wire [$clog2(WHOLE_LINE) - 1:0] x_counter_d;
    reg [$clog2(WHOLE_LINE) - 1:0] x_counter_q;
    wire [$clog2(WHOLE_FRAME) - 1:0] y_counter_d;
    reg [$clog2(WHOLE_FRAME) - 1:0] y_counter_q;

    assign x_counter_d =
        (x_counter_q == (WHOLE_LINE - 1)) ? 0 : x_counter_q + 1;

    assign y_counter_d =
        (x_counter_q != (WHOLE_LINE - 1)) ? y_counter_q :
        (y_counter_q == (WHOLE_FRAME - 1)) ? 0 : y_counter_q + 1;

    wire hvisible;
    wire vvisible;

    assign hvisible = (x_counter_q < H_VISIBLE) && rst_ni;
    assign vvisible = (y_counter_q < V_VISIBLE) && rst_ni;
    assign visible_o = hvisible & vvisible;

    assign hsync_o = ~(
        (((H_VISIBLE + H_FRONT) <= x_counter_q) &&
        (x_counter_q < ((H_VISIBLE + H_FRONT) + H_SYNC))) && rst_ni
    );

    assign vsync_o = ~(
        (((V_VISIBLE + V_FRONT) <= y_counter_q) &&
        (y_counter_q < ((V_VISIBLE + V_FRONT) + V_SYNC))) && rst_ni
    );

    function automatic [$clog2(H_VISIBLE) - 1:0] sv2v_cast_60BAD;
        input reg [$clog2(H_VISIBLE) - 1:0] inp;
        sv2v_cast_60BAD = inp;
    endfunction

    assign position_x_o = sv2v_cast_60BAD(x_counter_q);

    function automatic [$clog2(V_VISIBLE) - 1:0] sv2v_cast_5F333;
        input reg [$clog2(V_VISIBLE) - 1:0] inp;
        sv2v_cast_5F333 = inp;
    endfunction

    assign position_y_o = sv2v_cast_5F333(y_counter_q);

    always @(posedge clk_i) begin
        if (!rst_ni) begin
            x_counter_q <= (H_VISIBLE + H_FRONT) + H_SYNC;
            y_counter_q <= (V_VISIBLE + V_FRONT) + V_SYNC;
        end else begin
            x_counter_q <= x_counter_d;
            y_counter_q <= y_counter_d;
        end
    end
endmodule
