`timescale 1ns/1ps

module tb();

    reg [3:0] num1;
    reg [3:0] num2;
    wire [3:0] out;
    wire       cout;

    add u0 (
        .num1 (num1),
        .num2 (num2),
        .out  (out),
        .cout (cout)
    );

    // Tarefa auxiliar pra facilitar leitura
    task testar;
        input [3:0] a, b;
        input [4:0] esperado; // soma total esperada (com carry)
        begin
            num1 = a;
            num2 = b;
            #10;

            if ({cout, out} == esperado)
                $display("OK   : %2d + %2d = %2d (carry = %b)", a, b, out, cout);
            else
                $display("ERRO : %2d + %2d = %2d (carry = %b), esperado: %2d (carry = %b)", 
                          a, b, out, cout, esperado[3:0], esperado[4]);
        end
    endtask

    initial begin
        $dumpfile("saida.vcd");
        $dumpvars(0, tb);

        testar(4'b0000, 4'b0000, 5'd0);   //  0 +  0 =  0
        testar(4'b0001, 4'b0010, 5'd3);   //  1 +  2 =  3
        testar(4'b1111, 4'b0001, 5'd16);  // 15 +  1 = 16 (carry = 1, out = 0)
        testar(4'b1010, 4'b0101, 5'd15);  // 10 +  5 = 15
        testar(4'b1111, 4'b1111, 5'd30);  // 15 + 15 = 30 (carry = 1, out = 14)

        $finish;
    end

endmodule
