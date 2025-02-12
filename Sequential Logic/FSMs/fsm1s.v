// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
	parameter A=0, B=1;
    //A parameter in Verilog is a constant used to define values that do not change during simulation or synthesis.
    //It helps improve code readability and flexibility.
    reg present_state, next_state;

    always @(*) begin    // Combinational always block
        // State transition logic
        if (present_state == A && in == 1)
            next_state = A;  // Use blocking assignment (=)
        else if (present_state == A && in == 0)
            next_state = B;
        else if (present_state == B && in == 0)
            next_state = A;
        else
            next_state = B;
    end

    always @(posedge clk) begin    // Sequential always block
        // State flip-flops with asynchronous reset
        if (reset)
            present_state <= B;
        else
            present_state <= next_state;
    end

    assign out = (present_state == B); // Output logic

endmodule