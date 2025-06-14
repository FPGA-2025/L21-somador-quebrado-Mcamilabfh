module fadd (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire s,
    output wire cout
);

    wire s1, c1, c2;

    hadd u1 (
        .a(a),
        .b(b),
        .s(s1),
        .c(c1)
    );

    hadd u2 (
        .a(s1),
        .b(cin),
        .s(s),
        .c(c2)
    );

    assign cout = c1 | c2;

endmodule
