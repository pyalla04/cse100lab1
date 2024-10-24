
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

logic [$clog2(IMAGE_ROM_SIZE)-1:0] rom_addr;

logic [11:0] image0_rdata;
logic [11:0] image1_rdata;
logic [11:0] image2_rdata;
logic [11:0] image3_rdata;

assign rom_addr = (((position_y >> 2)*IMAGE_WIDTH) + (position_x >> 2));

images #(
    .IMAGE_ROM_SIZE(IMAGE_ROM_SIZE)
) images (
    .clk_i(clk_i),
    .rom_addr_i(rom_addr),
    // outputs are produced 1 cycle after rom_addr_i
    .image0_rdata_o(image0_rdata),
    .image1_rdata_o(image1_rdata),
    .image2_rdata_o(image2_rdata),
    .image3_rdata_o(image3_rdata)
);

wire w_hsync;
wire w_vsync;
wire visible;
wire [8:0] position_x;
wire [7:0] position_y;
vga_timer vga_timer_isnt (
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .hsync_o(w_hsync),
    .vsync_o(w_vsync),
    .visible_o(visible),
    .position_x_o(position_x),
    .position_y_o(position_y)
);

reg r_vsync;
reg r_hsync;
always_ff @(posedge clk_i) begin
    r_vsync <= w_vsync;
    r_hsync <= w_hsync;
end

assign vga_hsync_o = r_hsync;
assign vga_vsync_o = r_vsync;

reg [3:0] r_image_sel;
always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
        r_image_sel <= 4'b0001;
    end else begin
        r_image_sel <= image_select_i;
    end
end


assign vga_red_o  = r_image_sel == 1 ? image0_rdata[3:0] : 
                    r_image_sel == 2 ? image1_rdata[3:0] : 
                    r_image_sel == 4 ? image2_rdata[3:0] : 
                    image3_rdata[3:0];

assign vga_green_o  = r_image_sel == 1 ? image0_rdata[7:4] : 
                     r_image_sel == 2 ? image1_rdata[7:4] : 
                     r_image_sel == 4 ? image2_rdata[7:4] : 
                     image3_rdata[7:4];

assign vga_blue_o  =  r_image_sel == 1 ? image0_rdata[11:8] : 
                     r_image_sel == 2 ? image1_rdata[11:8] : 
                     r_image_sel == 4 ? image2_rdata[11:8] : 
                     image3_rdata[11:8];


endmodule

