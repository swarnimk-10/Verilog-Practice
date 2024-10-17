module top_module (
    input clk,
    input d,
    output q
);
    reg q_pos, q_neg;  // Two registers for positive and negative edges

    // Positive edge flip-flop
    always @(posedge clk) begin
        q_pos <= d;
    end

    // Negative edge flip-flop
    always @(negedge clk) begin
        q_neg <= d;
    end

    // Output logic: choose between positive and negative edge flip-flop outputs
    always @(*) begin
        if (clk)
            q = q_pos;  // Output positive edge flip-flop when clock is high
        else
            q = q_neg;  // Output negative edge flip-flop when clock is low
    end
endmodule
/*
The output q might appear to be delayed because the value of q is not updated immediately when the input d changes. 
Instead, it is updated only on the rising or falling edge of the clock, depending on the flip-flop capturing the input 
(q_pos on the rising edge and q_neg on the falling edge). Additionally, the output selection logic 
(q = q_pos when clk is high and q = q_neg when clk is low) depends on the state of the clock, creating a small delay 
between input changes and output reflection.
*/