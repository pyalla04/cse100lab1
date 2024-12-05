module cactus (
    clk_i,
    rst_ni,
    next_frame_i,
    spawn_i,
    rand_i,
    pixel_x_i,
    pixel_y_i,
    pixel_o
);
    reg _sv2v_0;
    input wire clk_i;
    input wire rst_ni;
    input wire next_frame_i;
    input wire spawn_i;
    input wire [1:0] rand_i;
    input wire [9:0] pixel_x_i;
    input wire [9:0] pixel_y_i;
    output reg pixel_o;
    localparam signed [31:0] CactusWidth = 15;
    localparam signed [31:0] CactusHeight = 33;
    localparam signed [31:0] CactusScaler = 2;
    localparam signed [31:0] dinorun_pkg_Ground = 400;
    localparam signed [31:0] CactusY = dinorun_pkg_Ground - (CactusHeight * CactusScaler);
    localparam signed [31:0] CactusSpeed = 8;
    reg [14:0] CACTUS0 [0:32];
    reg [14:0] CACTUS1 [0:32];
    reg [14:0] CACTUS2 [0:32];
    reg [14:0] CACTUS3 [0:32];

    initial $readmemb("cactus_0.memb", CACTUS0);
    initial $readmemb("cactus_1.memb", CACTUS1);
    initial $readmemb("cactus_2.memb", CACTUS2);
    initial $readmemb("cactus_3.memb", CACTUS3);

    reg signed [10:0] cactus_x_d;
    reg signed [10:0] cactus_x_q;
    reg [1:0] cactus_image_d;
    reg [1:0] cactus_image_q;

    always @(posedge clk_i) begin
        if (!rst_ni) begin
            cactus_x_q <= -CactusWidth * CactusScaler;
            cactus_image_q <= 0;
        end else begin
            cactus_x_q <= cactus_x_d;
            cactus_image_q <= cactus_image_d;
        end
    end

    wire off_screen;
    assign off_screen = cactus_x_q <= (-CactusWidth * CactusScaler);

    localparam signed [31:0] dinorun_pkg_ObstacleInitialX = 640;
    always_comb begin
        cactus_x_d = cactus_x_q;
        cactus_image_d = cactus_image_q;
        if (next_frame_i) begin
            if (!off_screen)
                cactus_x_d = cactus_x_q - CactusSpeed;
            else if (spawn_i) begin
                cactus_x_d = dinorun_pkg_ObstacleInitialX;
                cactus_image_d = rand_i;
            end
        end
    end

    wire pixel_x_in_range = (pixel_x_i >= cactus_x_q) && (pixel_x_i < (cactus_x_q + (CactusWidth * CactusScaler)));
    wire pixel_y_in_range = (pixel_y_i >= CactusY) && (pixel_y_i < (CactusY + (CactusHeight * CactusScaler)));
    wire pixel_in_range = pixel_x_in_range && pixel_y_in_range;
    wire [9:0] rom_x = 14 - ((pixel_x_i - cactus_x_q) / CactusScaler);
    wire [9:0] rom_y = (pixel_y_i - CactusY) / CactusScaler;

    always_comb begin
        pixel_o = 0;
        if (pixel_in_range)
            (* full_case, parallel_case *)
            case (cactus_image_q)
                0: pixel_o = CACTUS0[rom_y][rom_x];
                1: pixel_o = CACTUS1[rom_y][rom_x];
                2: pixel_o = CACTUS2[rom_y][rom_x];
                3: pixel_o = CACTUS3[rom_y][rom_x];
                default: ;
            endcase
    end

    initial _sv2v_0 = 0;
endmodule
