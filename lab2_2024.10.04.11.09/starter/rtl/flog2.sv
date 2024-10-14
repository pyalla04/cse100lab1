module flog2(input [7:0] a, 
output reg[2:0] b);
assign b = a[7] == 1'b1 ? 3'b111:
a[6] == 1'b1 ? 3'b110:
a[5] == 1'b1 ? 3'b101:
a[4] == 1'b1 ? 3'b100:
a[3] == 1'b1 ? 3'b011:
a[2] == 1'b1 ? 3'b010:
a[1] == 1'b1 ? 3'b001:3'b000;





/*
always @* begin
    for(bit [2:0]i = 0; i <= 7; i = i + 1) begin
        if(a[i] == 1'b1) begin
            b <= i;
        end

    end
    
end
*/


endmodule;