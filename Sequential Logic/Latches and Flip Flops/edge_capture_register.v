module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_prev; // Store previous input values

    always @(posedge clk) begin
        if (reset) begin
            out <= 32'b0; // Synchronous reset clears all output bits
        end 
        else begin
            // Capture the 1-to-0 transition
            out <= (out | (in_prev & ~in)); 
        end
            in_prev <= in; // Update previous state of 'in'
    end
	/*
	out <= (out | (in_prev & ~in));: Once a 1-to-0 transition is detected, 
	the corresponding bit in out is set to 1 and will remain 1 until reset. 
	The bitwise OR (|) ensures that previously set bits in out remain unchanged.
	*/
endmodule
