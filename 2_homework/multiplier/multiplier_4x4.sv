module multiplier_4x4 (
    input  logic [3:0] A, B,
    output logic [7:0] P
);

    logic [3:0] P0;
    logic [3:0] P1;
    logic [3:0] P2;
    logic [3:0] P3;

    logic [7:0] shift_P0;
    logic [7:0] shift_P1;
    logic [7:0] shift_P2;
    logic [7:0] shift_P3;

    logic [7:0] SUM_1;
    logic [7:0] SUM_2;

    logic       carry1;
    logic       carry2;

    multiplier_2x2 inst_P0 (
        .A(A[1:0]),
        .B(B[1:0]),
        .P(P0)
    );

    multiplier_2x2 inst_P1 (
        .A(A[3:2]),
        .B(B[1:0]),
        .P(P1)
    );

    multiplier_2x2 inst_P2 (
        .A(A[1:0]),
        .B(B[3:2]),
        .P(P2)
    );

    multiplier_2x2 inst_P3 (
        .A(A[3:2]),
        .B(B[3:2]),
        .P(P3)
    );

    assign shift_P0 = {4'b0000, P0};
    assign shift_P1 = {2'b00, P1, 2'b00};
    assign shift_P2 = {2'b00, P2, 2'b00};
    assign shift_P3 = {P3, 4'b0000};

    full_adder_8bit inst_SUM1 (
        .A    (shift_P0),
        .B    (shift_P1),
        .Cin  (1'b0),
        .Cout (carry1),
        .S    (SUM_1)
    );

    full_adder_8bit inst_SUM2 (
        .A    (shift_P2),
        .B    (shift_P3),
        .Cin  (1'b0),
        .Cout (carry2),
        .S    (SUM_2)
    );

    full_adder_8bit inst_SUM3 (
        .A    (SUM_1),
        .B    (SUM_2),
        .Cin  (1'b0),
        .Cout (),
        .S    (P)
    );

endmodule