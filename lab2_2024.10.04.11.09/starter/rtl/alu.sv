
module alu (
    input  logic [7:0] a_i,
    input  logic [7:0] b_i,
    input  logic [3:0] operation_i,
    output logic [7:0] y_o
);

    // Instantiate the flog2 and sqrt modules
    logic [3:0] flog2_result;
    flog2 flog2_inst (
        .a_i(a_i),
        .y_o(flog2_result)
    );

    logic [7:0] sqrt_result;
    sqrt sqrt_inst (
        .a_i(a_i),
        .y_o(sqrt_result)
    );

    // Internal results of the add and sub operations
    logic [7:0] add_result;
    logic [7:0] sub_result;

    assign add_result = a_i + b_i;
    assign sub_result = a_i - b_i;

    // Multiplex between the operations using assign statements
    assign y_o = (operation_i == 4'b0001) ? add_result :
                 (operation_i == 4'b0010) ? sub_result :
                 (operation_i == 4'b0100) ? {4'b0000, flog2_result} :
                 (operation_i == 4'b1000) ? sqrt_result : 8'b0;

endmodule
