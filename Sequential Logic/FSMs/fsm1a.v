module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out
);  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // Combinational always block
        // State transition logic
        if (state == A && in == 1)
            next_state = A;  // Use blocking assignment (=)
        else if (state == A && in == 0)
            next_state = B;
        else if (state == B && in == 0)
            next_state = A;
        else
            next_state = B;
    end

    always @(posedge clk or posedge areset) begin    // Sequential always block
        // State flip-flops with asynchronous reset
        if (areset)
            state <= B;
        else
            state <= next_state;
    end

    assign out = (state == B); // Output logic

endmodule
