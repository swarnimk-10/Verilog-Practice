module adder(
	input a, b, cin,
	output cout, sum );
    assign sum = a^b^cin;
    assign cout = (a&b) | (b&cin) | (cin&a);
endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	/*In Verilog, a genvar is a special data type used in generate loops. 
    It is typically used when creating repetitive hardware structures during synthesis, 
    such as multiple instances of a module or repeated logic. 
    genvar is designed specifically for controlling loops within the generate block, 
    and it allows for compile-time generation of hardware rather than runtime execution.

    Key Points:
    Syntax: A genvar is declared using the genvar keyword.
    Compile-Time: Unlike a reg or wire, a genvar variable exists only during the generation phase (at compile-time) and is not part of the actual synthesized hardware.
    Use Case: You usually use it to index loops that create multiple instances of modules or logic structures.
        */
    genvar i;
    adder add1(a[0], b[0], cin, cout[0], sum[0]);
    
    generate
        for(i=1; i<100;i=i+1) begin : adderblock
            adder add(a[i], b[i], cout[i-1], cout[i], sum[i]);
        end
    endgenerate
endmodule
