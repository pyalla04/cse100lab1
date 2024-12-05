module hex7seg (
    d3,
    d2,
    d1,
    d0,
    A,
    B,
    C,
    D,
    E,
    F,
    G
);
    // Inputs
    input wire d3;
    input wire d2;
    input wire d1;
    input wire d0;

    // Outputs
    output wire A;
    output wire B;
    output wire C;
    output wire D;
    output wire E;
    output wire F;
    output wire G;

    // Assignments
    assign A = !(((((~d3 & ~d2 & ~d1 & d0) | (~d3 & d2 & ~d1 & ~d0)) |
                   (d3 & ~d2 & d1 & d0)) |
                  (d3 & d2 & ~d1 & d0)));

    assign B = !((((((~d3 & d2 & ~d1 & d0) | (~d3 & d2 & d1 & ~d0)) |
                    (d3 & ~d2 & d1 & d0)) |
                   (d3 & d2 & ~d1 & ~d0)) |
                  ((d3 & d2 & d1 & ~d0) |
                   (d3 & d2 & d1 & d0))));

    assign C = !(((((~d3 & ~d2 & d1 & ~d0) | (d3 & d2 & ~d1 & ~d0)) |
                   (d3 & d2 & d1 & ~d0)) |
                  (d3 & d2 & d1 & d0)));

    assign D = !((((((~d3 & ~d2 & ~d1 & d0) | (~d3 & d2 & ~d1 & ~d0)) |
                    (~d3 & d2 & d1 & d0)) |
                   (d3 & ~d2 & d1 & ~d0)) |
                  (d3 & d2 & d1 & d0)));

    assign E = !(((((((~d3 & ~d2 & ~d1 & d0) | (~d3 & ~d2 & d1 & d0)) |
                     (~d3 & d2 & ~d1 & ~d0)) |
                    (~d3 & d2 & ~d1 & d0)) |
                   (~d3 & d2 & d1 & d0)) |
                  (d3 & ~d2 & ~d1 & d0)));

    assign F = !((((((~d3 & ~d2 & ~d1 & d0) | (~d3 & ~d2 & d1 & ~d0)) |
                    (~d3 & ~d2 & d1 & d0)) |
                   (~d3 & d2 & d1 & d0)) |
                  (d3 & d2 & ~d1 & d0)));

    assign G = !(((((~d3 & ~d2 & ~d1 & ~d0) | (~d3 & ~d2 & ~d1 & d0)) |
                   (~d3 & d2 & d1 & d0)) |
                  (d3 & d2 & ~d1 & ~d0)));
endmodule
