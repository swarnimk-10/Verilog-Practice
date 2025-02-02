module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always@(posedge clk) begin
        if(reset)
            q<=0;
        else begin
            if(q==4'b1001) begin
                if(slowena)
                    q<=0;
            	else
                	q<=q;
            end
            else begin
                if(slowena)
                    q<=q+1;
                else
                    q<=q;
            end
        end
    end
endmodule
