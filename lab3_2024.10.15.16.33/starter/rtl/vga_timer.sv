// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

// https://vesa.org/vesa-standards/
// http://tinyvga.com/vga-timing
module vga_timer (
    // TODO
    // possible ports list:
    input  logic       clk_i,
    input  logic       rst_ni,
    output logic       hsync_o,
    output logic       vsync_o,
    output logic       visible_o,
    output logic [8:0] position_x_o,
    output logic [7:0] position_y_o
);

//Horizontal params
localparam H_DISPLAY = 640;
localparam H_FP      = 16;
localparam H_SYNC    = 96;
//parameter H_BP      = 48;
localparam H_TOTAL   = 800;

//Vertical params
localparam V_DISPLAY = 480;
localparam V_FP      = 10;
localparam V_SYNC    = 2;
//parameter V_BP      = 33;
localparam V_TOTAL   = 525;

// Horizontal and Vertical counters
reg [9:0] h_count;
reg [9:0] v_count; 

assign position_x_o = (h_count < H_DISPLAY) ? h_count : 0; 
assign position_y_o = (v_count < V_DISPLAY) ? v_count : 0; 


//video active area
reg active_region;
always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
        active_region <= 0;
    end else begin
        active_region <= (h_count < H_DISPLAY && v_count < V_DISPLAY);
    end
end
assign visible_o = active_region;

// Horizontal h_sync
reg h_sync;
always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
        h_count <= 0;
        h_sync  <= 1;
    end else begin
        if(h_count == H_TOTAL - 1)
            h_count <= 0;
        else    
            h_count <= h_count + 1;

        // Generate hsync (active low)
        if(h_count >= H_DISPLAY + H_FP && h_count < H_DISPLAY + H_FP + H_SYNC)
            h_sync <= 0;
        else
            h_sync <= 1;
    end
end

assign hsync_o = h_sync;
// Vertical v_sync
reg v_sync;
always_ff @(posedge clk_i or negedge rst_ni) begin
    if(!rst_ni) begin
        v_count <= 0;
        v_sync  <= 1;
    end else begin
        if (h_count == H_TOTAL - 1) begin
            if(v_count == V_TOTAL - 1)
                v_count <= 0;
            else    
                v_count <= v_count + 1;
        end

        // Generate hsync (active low)
        if(v_count >= V_DISPLAY + V_FP && v_count < V_DISPLAY + V_FP + V_SYNC)
            v_sync <= 0;
        else
            v_sync <= 1;
    end
end

assign vsync_o = v_sync;

endmodule
