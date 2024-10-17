module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (a|c) & (a | ~b | ~c);
endmodule
//you focus on zeroes. and a is written as ~a.