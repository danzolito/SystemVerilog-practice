module multiplexer_4_1 (
    input  logic       IN0, IN1, IN2, IN3,
    input  logic [1:0] SEL,

    output logic       OUT

);

    always_comb begin
        case(SEL)
        2'b00:       OUT = IN0;
        2'b01:       OUT = IN1;
        2'b10:       OUT = IN2;
        2'b11:       OUT = IN3;
        endcase
    end

endmodule
