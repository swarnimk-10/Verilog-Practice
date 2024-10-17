module top_module (
    input clk,
    input x,
    output z
); 
    wire q1, q2, q3;
    dff_dff dff1(clk, x^q1, q1);
    dff_dff dff2(clk, x&(~q2), q2);
    dff_dff dff3(clk, x|(~q3), q3);
    assign z = ~(q1|q2|q3);
endmodule
module dff_dff (
    input clk,    
    input d,
    output reg q );
    always@(posedge clk) begin
        q<=d;
    end
endmodule