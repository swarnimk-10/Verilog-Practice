module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always@(posedge clk) begin
        if(load)
            q<=data[63:0];
        else if(ena) begin
            if(amount==2'b00)
                q<={q[62:0],1'b0};
            else if(amount==2'b01)
                q<={q[55:0],8'b0};
            else if(amount==2'b10) begin
                if(q[63] == 0) 
                    q<={1'b0,q[63:1]};
                else 
                    q<={1'b1,q[63:1]};
            end
            else if(amount==2'b11)begin
                if(q[63] == 0) 
                    q<={8'b0,q[63:8]};
                else begin
                    q<={8'b11111111,q[63:8]};
                end
            end
        end
    end
endmodule
