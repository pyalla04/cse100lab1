
// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module screensaver (
    input  logic       clk_i,
    input  logic       rst_ni,
    input  logic [3:0] image_select_i,
    output logic [3:0] vga_red_o,
    output logic [3:0] vga_blue_o,
    output logic [3:0] vga_green_o,
    output logic       vga_hsync_o,
    output logic       vga_vsync_o
);

localparam int IMAGE_WIDTH = 160;
localparam int IMAGE_HEIGHT = 120;
localparam int IMAGE_ROM_SIZE = (IMAGE_WIDTH * IMAGE_HEIGHT);

wire w_hsync_d;
wire w_vsync_d;
wire visible;
wire [9:0] position_x;
wire [8:0] position_y;

reg w_vsync_q;
reg w_hsync_q;
reg [3:0] image_select_q;

logic [$clog2(IMAGE_ROM_SIZE)-1:0] rom_addr;

logic [11:0] image0_rdata_d;
logic [11:0] image1_rdata_d;
logic [11:0] image2_rdata_d;
logic [11:0] image3_rdata_d;

logic [11:0] image0_rdata_q;
logic [11:0] image1_rdata_q;
logic [11:0] image2_rdata_q;
logic [11:0] image3_rdata_q;

wire [3:0] image_select_d;

vga_timer vga_timer_isnt (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .hsync_o(w_hsync_d),
    .vsync_o(w_vsync_d),
    .visible_o(visible),
    .position_x_o(position_x),
    .position_y_o(position_y)
);

assign rom_addr = (((position_y >> 2)*IMAGE_WIDTH) + (position_x >> 2));

images #(
    .IMAGE_ROM_SIZE(IMAGE_ROM_SIZE)
) images (
    .clk_i(clk_i),
    .rom_addr_i(rom_addr),
    // outputs are produced 1 cycle after rom_addr_i
    .image0_rdata_o(image0_rdata_d),
    .image1_rdata_o(image1_rdata_d),
    .image2_rdata_o(image2_rdata_d),
    .image3_rdata_o(image3_rdata_d)
);

always_ff @(posedge clk_i) begin
    w_vsync_q <= w_vsync_d;
    w_hsync_q <= w_hsync_d;
end

assign vga_hsync_o = w_hsync_q;
assign vga_vsync_o = w_vsync_q;

assign image_select_d = image_select_i;

assign vga_blue_o  = image_select_q == 1 ? image0_rdata_q[3:0] :
                    image_select_q == 2 ? image1_rdata_q[3:0] :
                    image_select_q == 4 ? image2_rdata_q[3:0] :
                    image3_rdata_q[3:0];

assign vga_green_o  = image_select_q == 1 ? image0_rdata_q[7:4] :
                     image_select_q == 2 ? image1_rdata_q[7:4] :
                     image_select_q == 4 ? image2_rdata_q[7:4] :
                     image3_rdata_q[7:4];

assign vga_red_o  =  image_select_q == 1 ? image0_rdata_q[11:8] :
                     image_select_q == 2 ? image1_rdata_q[11:8] :
                     image_select_q == 4 ? image2_rdata_q[11:8] :
                     image3_rdata_q[11:8];

always_ff @(posedge clk_i) begin
    if(!rst_ni) begin
        image_select_q <= 4'b0001;
    end else begin
      if(|image_select_d == 1'b1) begin
        image_select_q <= image_select_d;
      end
    end
end

always_ff @(posedge clk_i) begin
        // Update VGA outputs based on the selected image
        if(image_select_q == 4'b0001) begin
           image0_rdata_q <= image0_rdata_d;
            end
         else if(image_select_q == 4'b0010) begin
           image1_rdata_q <= image1_rdata_d;
            end
         else if(image_select_q == 4'b0100) begin
           image2_rdata_q <= image2_rdata_d;
            end
         else if(image_select_q == 4'b1000) begin
           image3_rdata_q <= image3_rdata_d;
            end
        end

endmodule
