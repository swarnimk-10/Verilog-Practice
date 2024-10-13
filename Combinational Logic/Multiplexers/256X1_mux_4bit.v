module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    assign out = in[sel*4 +: 4];
    /*
    sel*4 +: 4 is an indexed part-select in Verilog, where the syntax [start +: width] selects width bits 
    starting from start.
	Here, the start is sel*4, and the width is 4, which correctly selects 4 bits based on the value of sel.
	Indexing with Arithmetic Expressions:
When you write in[sel*4+3 : sel*4], you're asking Verilog to compute two different variable expressions (sel*4+3 and sel*4)
 to determine the start and end indices of the slice dynamically.
The synthesizer has difficulty confirming that this results in a constant-width part-select (4 bits in this case) 
because the range depends on the value of sel, which is a variable. Verilog synthesis tools are optimized to handle 
fixed ranges better than dynamic ranges.

Constant Width Requirement:
Verilog synthesis tools need to know that the width of the slice is always constant, regardless of the value of sel. 
If the tool can't determine the width (e.g., because both indices are variable), it throws an error like "is not a constant."

Solution: Indexed Vector Part Select (+: Syntax)
The +: operator (start +: width) in Verilog-2001 ensures that the width of the selected bits remains constant. 
This syntax tells the synthesizer that starting from the calculated base index (sel * 4), exactly 4 bits are selected.
For example, in[sel*4 +: 4] selects exactly 4 bits starting at sel*4. The +: 4 ensures the synthesizer knows the selected width is constant, 
even though the starting index is variable.
	*/
endmodule