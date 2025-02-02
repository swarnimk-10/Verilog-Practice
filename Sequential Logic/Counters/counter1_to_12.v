module top_module (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q, 
    output reg c_enable,
    output reg c_load,
    output reg [3:0] c_d
); 

    assign c_enable = enable;
    assign c_d = 4'd1;
    assign c_load = (reset || (Q == 4'b1100 && enable)) ? 1 : 0;
    count4 the_counter (clk, c_enable, c_load, c_d, Q );
    
endmodule
