module add (
    input wire [3:0] num1,
    input wire [3:0] num2,
    output wire [3:0] out,
    output wire cout
);

    wire cout0, cout1, cout2;

    fadd u0 (
        .a(num1[0]),
        .b(num2[0]),
        .cin(1'b0),
        .s(out[0]),
        .cout(cout0)
    );

    fadd u1 (
        .a(num1[1]),
        .b(num2[1]),
        .cin(cout0),
        .s(out[1]),
        .cout(cout1)
    );

    fadd u2 (
        .a(num1[2]),
        .b(num2[2]),
        .cin(cout1),
        .s(out[2]),
        .cout(cout2)
    );

    fadd u3 (
        .a(num1[3]),
        .b(num2[3]),
        .cin(cout2),
        .s(out[3]),
        .cout(cout)
    );

endmodule

