module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_prev; // Store previous state of input

    always @(posedge clk) begin
        pedge <= in & ~in_prev; // Set pedge if in changes from 0 to 1
        in_prev <= in; // Update previous input state
    end
    /*
    Code Breakdown
Module Declaration:

The module top_module has three ports: clk (the clock signal), in (an 8-bit input vector), and pedge (an 8-bit output vector).
Registers:

reg [7:0] in_prev: This register stores the previous state of the in vector. It is used to detect changes between clock cycles.
Always Block:

always @(posedge clk): This block triggers on the rising edge of the clock signal.
Edge Detection:
pedge <= in & ~in_prev;: This line updates the pedge output. It uses a bitwise AND to check where in is 1 while in_prev is 0. 
This condition indicates a transition from 0 to 1 for each bit in in.
Updating Previous State:
in_prev <= in;: After processing, this line updates in_prev to hold the current state of in for the next clock cycle.
Summary
In essence, the code detects positive edges in each bit of an 8-bit input vector and outputs a corresponding signal in pedge on 
the next clock cycle after the transition occurs.
    */
endmodule
