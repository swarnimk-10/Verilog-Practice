module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);  

    wire [3:0] Q0, Q1, Q2; // 4-bit outputs of the counters

    assign c_enable[0] = 1'b1;               // First counter always enabled
    assign c_enable[1] = (Q0 == 4'd9) && c_enable[0];  // Enable second counter when Q0 reaches 9
    assign c_enable[2] = (Q1 == 4'd9) && c_enable[1];  // Enable third counter when Q1 reaches 9
    assign OneHertz = (Q2 == 4'd9) && c_enable[2];     // Generate 1 Hz pulse

    // Instantiate three BCD counters
    bcdcount counter0 (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(Q0));
    bcdcount counter1 (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(Q1));
    bcdcount counter2 (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(Q2));

endmodule
