// Copyright (c) 2024 Ethan Sifferman.
// All rights reserved. Distribution Prohibited.

module tb import muladd_pkg::*;;

logic       clk_i;
logic       rst_ni = 0;

logic       in_ready_o;
logic       in_valid_i = 0;
logic [7:0] a_i, b_i, c_i;

logic [7:0] prodsum_o;
logic       prodsum_ready_i = 0;
logic       prodsum_valid_o;

muladd muladd (.*);

initial begin
    clk_i = 0;
    forever begin
        #1ns;
        clk_i = !clk_i;
    end
end

initial begin
    repeat(1000) @(posedge clk_i);
    $display("Timed out");
    $fatal;
end

logic in_handshake = 0;
logic prodsum_handshake = 0;
logic [7:0] result;

task automatic run(logic [7:0] a, logic [7:0] b, logic [7:0] c, logic [7:0] expected, int expected_cycles, string mode);

integer num_cycles = 0;
    fork begin
        while (!in_handshake) begin
            @(posedge clk_i); #1ps;
        end
        num_cycles++;
        while (!prodsum_valid_o) begin
            @(posedge clk_i); #1ps;
            num_cycles++;
        end
    end begin
        assert(mode inside {"safe", "unsafe", "slow"}) else $error("Unknown mode: %s", mode);
        #1ps;

        if (mode == "slow") begin
            in_valid_i <= 0;
            in_handshake <= 0;
            prodsum_ready_i <= 0;
            prodsum_handshake <= 0;
            repeat (2) @(posedge clk_i); #1ps;
        end

        $display("Sending %0d * %0d + %0d in mode \"%s\"", a, b, c, mode);

        in_valid_i <= 1;
        in_handshake <= in_ready_o;
        prodsum_ready_i <= (mode=="unsafe");
        prodsum_handshake <= 0;

        a_i <= a;
        b_i <= b;
        c_i <= c;
        @(posedge clk_i); #1ps;
        while (!in_handshake) begin
            @(posedge clk_i); #1ps;
            in_handshake <= (in_ready_o&&in_valid_i);
        end

        if (mode == "slow") begin
            in_valid_i <= 0;
            in_handshake <= 0;
            prodsum_ready_i <= 0;
            prodsum_handshake <= 0;
            repeat (2) @(posedge clk_i); #1ps;
        end

        in_valid_i <= (mode=="unsafe");
        in_handshake <= 0;
        prodsum_ready_i <= 1;
        prodsum_handshake <= prodsum_valid_o;

        result <= prodsum_o;
        a_i <= 0;
        b_i <= 0;
        c_i <= 0;
        @(posedge clk_i); #1ps;
        while (!prodsum_handshake) begin
            prodsum_handshake <= (prodsum_ready_i&&prodsum_valid_o);
            result <= prodsum_o;
            @(posedge clk_i); #1ps;
        end

        in_valid_i <= 0;
        in_handshake <= 0;
        prodsum_ready_i <= 0;
        prodsum_handshake <= 0;

        assert(expected == result) else $error("Expected %0d, Received %0d", expected, result);
        $display("Produced %0d after %0d cycles", result, num_cycles);
        assert(num_cycles == expected_cycles) else $error("Expected result after %0d cycles, but result took %0d cycles.", expected_cycles, num_cycles);

    end join
endtask

always begin
    $dumpfile("dump.fst");
    $dumpvars;
    $urandom(100);

    rst_ni <= 0;
    @(posedge clk_i);
    rst_ni <= 1;

    run(1, 2, 3, 5,    3, "safe");
    run(3, 4, 0, 12,   2, "safe");
    run(0, 1, 2, 2,    1, "safe");

    $display;

    run(2, 3, 4, 10,   3, "unsafe");
    run(5, 6, 0, 30,   2, "unsafe");
    run(0, 7, 8, 8,    1, "unsafe");

    $display;

    run(2, 3, 4, 10,   3, "slow");
    run(5, 6, 0, 30,   2, "slow");
    run(0, 7, 8, 8,    1, "slow");

    $finish;
end

endmodule
