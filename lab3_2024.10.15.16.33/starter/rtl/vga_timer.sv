// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.
// https://vesa.org/vesa-standards/
// http://tinyvga.com/vga-timing
module vga_timer (
// TODO
// possible ports list:
input logic clk_i,
input logic rst_ni,
output logic hsync_o,
output logic vsync_o,
output logic visible_o,
output logic [9:0] position_x_o,
output logic [8:0] position_y_o
);
//Horizontal params
localparam int H_DISPLAY = 640;
localparam int H_FP = 16;
localparam int H_SYNC = 96;
//parameter H_BP = 48;
localparam int H_TOTAL = 800;
//Vertical params
localparam int V_DISPLAY = 480;
localparam int V_FP = 10;
localparam int V_SYNC = 2;
//parameter V_BP = 33;
localparam int V_TOTAL = 525;

wire [9:0]h_display_d;
wire [4:0]h_fp_d;
wire [6:0]h_sync_cnst_d;
wire [9:0]h_total_d;
logic active_region_d;
wire [8:0]v_display_d;
wire [3:0]v_fp_d;

wire [1:0]v_sync_cnst_d;
wire [9:0]v_total_d;
// Horizontal and Vertical counters
reg [9:0] h_count_q;
reg [9:0] v_count_q;
wire [9:0] h_count_r_d;
wire [9:0] v_count_r_d;
wire [9:0] h_count_d;
wire [9:0] v_count_d;
logic h_sync_chk_d;
logic h_sync_chk_d1;
logic h_sync_chk_d2;
logic v_sync_chk_d;
logic v_sync_chk_d1;
logic v_sync_chk_d2;
logic set_d;
logic reset_d;
logic h_sync_d1;
logic v_sync_d1;
logic h_sync_d;
logic v_sync_d;
assign h_sync_d = !h_sync_d1;
assign v_sync_d = !v_sync_d1;
assign h_display_d = H_DISPLAY;
assign h_fp_d = H_FP;
assign h_sync_cnst_d = H_SYNC;
assign h_total_d = H_TOTAL;
assign v_display_d = V_DISPLAY;
assign v_fp_d = V_FP;
assign v_sync_cnst_d = V_SYNC;
assign v_total_d = V_TOTAL;
assign position_x_o = (h_count_r_d < h_display_d) ? h_count_r_d : 1'b0;
assign position_y_o = (v_count_r_d < v_display_d) ? v_count_r_d : 1'b0;
assign active_region_d = (h_count_r_d < h_display_d && v_count_r_d < v_display_d);
assign h_sync_chk_d1 = h_count_r_d >= h_display_d + h_fp_d;
assign h_sync_chk_d2 = h_count_r_d < h_display_d + h_fp_d + h_sync_cnst_d;

assign h_sync_chk_d = h_sync_chk_d1 && h_sync_chk_d2;
assign h_sync_d1 = h_sync_chk_d1 && h_sync_chk_d2;
assign v_sync_chk_d1 = v_count_r_d >= v_display_d + v_fp_d;
assign v_sync_chk_d2 = v_count_r_d < v_display_d + v_fp_d + v_sync_cnst_d;
assign v_sync_chk_d = v_sync_chk_d1 && v_sync_chk_d2;
assign v_sync_d1 = v_sync_chk_d1 && v_sync_chk_d2;
assign h_count_d = (h_count_r_d == h_total_d - 1) ? 1'b0 : h_count_r_d + 1'b1;
assign v_count_d = (v_count_r_d==v_total_d - 1 && h_count_d==1'b0)? 1'b0: v_count_r_d+1'b1;
assign set_d = 1'b1;
assign reset_d = 1'b0;
//video active area
reg active_region_q;
always_ff @(posedge clk_i) begin
if(!rst_ni) begin
active_region_q <= 1'b0;
end else begin
active_region_q <= active_region_d;
end
end
assign visible_o = active_region_q;
assign h_count_r_d = h_count_q;
assign v_count_r_d = v_count_q;
// Horizontal h_sync
reg h_sync_q;
always_ff @(posedge clk_i) begin
if(!rst_ni) begin
h_count_q <= reset_d;
h_sync_q <= set_d;
end else begin
if(h_count_r_d == h_total_d - 1)
h_count_q <= h_count_d;
else
h_count_q <= h_count_d;
// Generate hsync (active low)
if(h_sync_chk_d == 1'b1)
h_sync_q <= h_sync_d;
else
h_sync_q <= h_sync_d;

end
end

assign hsync_o = h_sync_q;
// Vertical v_sync
reg v_sync_q;
always_ff @(posedge clk_i) begin
if(!rst_ni) begin
v_count_q <= reset_d;
v_sync_q <= set_d;
end else begin
if (h_count_r_d == h_total_d - 1) begin
if(v_count_r_d == v_total_d - 1)
v_count_q <= v_count_d;
else
v_count_q <= v_count_d;
end
// Generate hsync (active low)
if(v_sync_chk_d == 1'b1)
v_sync_q <= v_sync_d;
else
v_sync_q <= v_sync_d;
end
end
assign vsync_o = v_sync_q;
endmodule
