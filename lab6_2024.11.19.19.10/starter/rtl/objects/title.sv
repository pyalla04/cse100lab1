module title (
	pixel_x_i,
	pixel_y_i,
	pixel_o
);
	reg _sv2v_0;
	input wire [9:0] pixel_x_i;
	input wire [9:0] pixel_y_i;
	output reg pixel_o;
	localparam signed [31:0] TitleWidth = 47;
	localparam signed [31:0] TitleHeight = 7;
	localparam signed [31:0] TitleScaler = 13;
	localparam signed [31:0] TitleY = 70;
	localparam signed [31:0] dinorun_pkg_ScreenWidth = 640;
	localparam signed [31:0] TitleX = (dinorun_pkg_ScreenWidth - (TitleWidth * TitleScaler)) / 2;
	reg [46:0] TITLE_MEM [0:6];
	initial $readmemb("title.memb", TITLE_MEM);
	wire pixel_x_in_range = (pixel_x_i >= TitleX) && (pixel_x_i < (TitleX + (TitleWidth * TitleScaler)));
	wire pixel_y_in_range = (pixel_y_i >= TitleY) && (pixel_y_i < (TitleY + (TitleHeight * TitleScaler)));
	wire pixel_in_range = pixel_x_in_range && pixel_y_in_range;
	wire [9:0] rom_x = 46 - ((pixel_x_i - TitleX) / TitleScaler);
	wire [9:0] rom_y = (pixel_y_i - TitleY) / TitleScaler;
	always @(*) begin
		if (_sv2v_0)
			;
		pixel_o = 0;
		if (pixel_in_range)
			pixel_o = TITLE_MEM[rom_y][rom_x];
	end
	initial _sv2v_0 = 0;
endmodule
