module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1, w4;
    wire [15:0] w2, w3;
    add16 inst1(a[15:0], b[15:0], 0, w2, w1);
    add16 inst2(a[31:16], b[31:16], w1, w3, w4);
    assign sum = {w3, w2};
endmodule
