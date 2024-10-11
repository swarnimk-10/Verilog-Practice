module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout, cout1;
    wire [15:0] sum2, sum3;
    add16 inst1(a[15:0], b[15:0], 0, sum[15:0], cout);
    add16 inst2(a[31:16], b[31:16], 0, sum2, cout1);
    add16 inst3(a[31:16], b[31:16], 1, sum3, cout1);
    
    always @(*) begin
        case (cout)
            0: sum[31:16] = sum2;
            1: sum[31:16] = sum3;
        endcase
    end
endmodule
