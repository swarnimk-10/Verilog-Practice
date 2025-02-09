module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 
    always@(posedge clk) begin
        if(load)
            q<=data[99:0];
        else begin
            case(ena)
                0: q<=q;
                1: q<={q[0],q[99:1]};
                2: q<={q[98:0],q[99]};
                3: q<=q;
            endcase
        end
    end
endmodule
