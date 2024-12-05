module dinorun (
    clk_25_175_i,
    rst_ni,
    start_i,
    up_i,
    down_i,
    digit0_en_o,
    digit0_o,
    digit1_en_o,
    digit1_o,
    digit2_en_o,
    digit2_o,
    digit3_en_o,
    digit3_o,
    vga_red_o,
    vga_green_o,
    vga_blue_o,
    vga_hsync_o,
    vga_vsync_o
);
    reg _sv2v_0;
    input wire clk_25_175_i;
    input wire rst_ni;
    input wire start_i;
    input wire up_i;
    input wire down_i;
    output wire digit0_en_o;
    output wire [3:0] digit0_o;
    output wire digit1_en_o;
    output wire [3:0] digit1_o;
    output wire digit2_en_o;
    output wire [3:0] digit2_o;
    output wire digit3_en_o;
    output wire [3:0] digit3_o;
    output wire [3:0] vga_red_o;
    output wire [3:0] vga_green_o;
    output wire [3:0] vga_blue_o;
    output wire vga_hsync_o;
    output wire vga_vsync_o;
    reg [1:0] state_d;
    reg [1:0] state_q;
    reg [7:0] flashing_timer_d;
    reg [7:0] flashing_timer_q;
    wire hit = (state_q == 2'd2) || (state_q == 2'd3);
    always @(posedge clk_25_175_i)
        if (!rst_ni) begin
            state_q <= 2'd0;
            flashing_timer_q <= 0;
        end
        else begin
            state_q <= state_d;
            flashing_timer_q <= flashing_timer_d;
        end

    wire next_frame;
    reg [3:0] vga_red_d;
    reg [3:0] vga_red_q;
    reg [3:0] vga_blue_d;
    reg [3:0] vga_blue_q;
    reg [3:0] vga_green_d;
    reg [3:0] vga_green_q;
    wire vga_visible_d;
    reg vga_visible_q;
    wire vga_hsync_d;
    reg vga_hsync_q;
    wire vga_vsync_d;
    reg vga_vsync_q;
    wire vsync_edge;

    assign next_frame = vsync_edge && !hit;

    edge_detector edge_detector(
        .clk_i(clk_25_175_i),
        .data_i(vga_vsync_q),
        .edge_o(vsync_edge)
    );

    always @(posedge clk_25_175_i) begin
        vga_red_q <= vga_red_d;
        vga_green_q <= vga_green_d;
        vga_blue_q <= vga_blue_d;
        vga_visible_q <= vga_visible_d;
        vga_hsync_q <= vga_hsync_d;
        vga_vsync_q <= vga_vsync_d;
    end

    assign vga_red_o = (vga_visible_q ? vga_red_q : 0);
    assign vga_green_o = (vga_visible_q ? vga_green_q : 0);
    assign vga_blue_o = (vga_visible_q ? vga_blue_q : 0);
    assign vga_hsync_o = vga_hsync_q;
    assign vga_vsync_o = vga_vsync_q;

    wire [15:0] lfsr16_rand;
    lfsr16 lfsr16(
        .clk_i(clk_25_175_i),
        .rst_ni(rst_ni),
        .next_i(next_frame),
        .rand_o(lfsr16_rand)
    );

    wire [9:0] pixel_x;
    wire [9:0] pixel_y;
    vga_timer vga_timer(
        .clk_i(clk_25_175_i),
        .rst_ni(rst_ni),
        .hsync_o(vga_hsync_d),
        .vsync_o(vga_vsync_d),
        .visible_o(vga_visible_d),
        .position_x_o(pixel_x),
        .position_y_o(pixel_y)
    );

    reg reset_objects_n;
    wire drawing_dino;
    wire dino_enable;
    assign dino_enable = (state_q != 2'd2) || flashing_timer_q[3];

    dino dino(
        .clk_i(clk_25_175_i),
        .rst_ni(rst_ni),
        .next_frame_i(next_frame),
        .up_i(up_i),
        .down_i(down_i),
        .hit_i(hit),
        .pixel_x_i(pixel_x),
        .pixel_y_i(pixel_y),
        .pixel_o(drawing_dino)
    );

    wire spawn_cactus0;
    wire drawing_cactus0;
    cactus cactus0(
        .clk_i(clk_25_175_i),
        .rst_ni(reset_objects_n),
        .next_frame_i(next_frame),
        .spawn_i(spawn_cactus0),
        .rand_i(lfsr16_rand[1:0]),
        .pixel_x_i(pixel_x),
        .pixel_y_i(pixel_y),
        .pixel_o(drawing_cactus0)
    );
    assign spawn_cactus0 = (state_q == 2'd1) && (lfsr16_rand[12:8] == 5'b00000);

    wire spawn_cactus1;
    wire drawing_cactus1;
    cactus cactus1(
        .clk_i(clk_25_175_i),
        .rst_ni(reset_objects_n),
        .next_frame_i(next_frame),
        .spawn_i(spawn_cactus1),
        .rand_i(lfsr16_rand[1:0]),
        .pixel_x_i(pixel_x),
        .pixel_y_i(pixel_y),
        .pixel_o(drawing_cactus1)
    );
    assign spawn_cactus1 = (state_q == 2'd1) && (lfsr16_rand[11:7] == 5'b11111);

    wire drawing_cactus = drawing_cactus0 || drawing_cactus1;

    wire spawn_bird;
    wire drawing_bird;
    bird bird(
        .clk_i(clk_25_175_i),
        .rst_ni(reset_objects_n),
        .next_frame_i(next_frame),
        .spawn_i(spawn_bird),
        .rand_i(lfsr16_rand[1:0]),
        .pixel_x_i(pixel_x),
        .pixel_y_i(pixel_y),
        .pixel_o(drawing_bird)
    );
    assign spawn_bird = (state_q == 2'd1) && (lfsr16_rand[11:6] == 6'b101010);

    wire collision = drawing_dino && (drawing_cactus || drawing_bird);
    always_comb begin
        if (_sv2v_0)
            ;
        reset_objects_n = rst_ni;
        state_d = state_q;
        flashing_timer_d = 0;
        (* full_case, parallel_case *)
        case (state_q)
            2'd0:
                if (start_i)
                    state_d = 2'd1;
            2'd1:
                if (collision) begin
                    state_d = 2'd2;
                    flashing_timer_d = 60;
                end
            2'd2: begin
                flashing_timer_d = flashing_timer_q;
                if (vsync_edge) begin
                    flashing_timer_d = flashing_timer_d - 1;
                    if (flashing_timer_d == 0)
                        state_d = 2'd3;
                end
            end
            2'd3:
                if (start_i) begin
                    state_d = 2'd1;
                    reset_objects_n = 0;
                end
                else if (down_i || up_i) begin
                    state_d = 2'd0;
                    reset_objects_n = 0;
                end
            default:
                ;
        endcase
    end

    wire drawing_title;
    title title(
        .pixel_x_i(pixel_x),
        .pixel_y_i(pixel_y),
        .pixel_o(drawing_title)
    );

    localparam signed [31:0] dinorun_pkg_Ground = 400;
    always_comb begin
        if (_sv2v_0)
            ;
        vga_red_d = 0;
        vga_green_d = 0;
        vga_blue_d = 0;
        if (drawing_title && (state_q == 2'd0))
            {vga_red_d, vga_green_d, vga_blue_d} = 12'hb0f;
        else if (drawing_bird)
            {vga_red_d, vga_green_d, vga_blue_d} = 12'h00f;
        else if (drawing_dino && dino_enable)
            {vga_red_d, vga_green_d, vga_blue_d} = 12'h070;
        else if (drawing_cactus)
            {vga_red_d, vga_green_d, vga_blue_d} = 12'h0f0;
        else if (pixel_y < 396)
            {vga_red_d, vga_green_d, vga_blue_d} = 12'hfb5;
        else
            {vga_red_d, vga_green_d, vga_blue_d} = 12'h931;
    end

    reg score_enable = next_frame && (state_q == 2'd1);
    score_counter score_counter(
        .clk_i(clk_25_175_i),
        .rst_ni(reset_objects_n),
        .en_i(score_enable),
        .digit0_o(digit0_o),
        .digit1_o(digit1_o),
        .digit2_o(digit2_o),
        .digit3_o(digit3_o)
    );

    assign digit0_en_o = 1;
    assign digit1_en_o = 1;
    assign digit2_en_o = 1;
    assign digit3_en_o = 1;

    initial _sv2v_0 = 0;
endmodule
