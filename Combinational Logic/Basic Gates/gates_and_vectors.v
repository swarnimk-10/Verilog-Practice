module top_module( 
    input [3:0] in,
    output reg [2:0] out_both,
    output reg [3:1] out_any,
    output reg [3:0] out_different );
    integer i;
    always@(*) begin
        for(i=0; i<3; i=i+1) begin
            if(in[i]==1 && in[i+1]==1)
                out_both[i] = 1;
            else
                out_both[i] = 0;
        end
        for(i=3; i>0; i=i-1) begin
            if(in[i]==1 || in[i-1]==1)
                out_any[i] = 1;
            else
                out_any[i] = 0;
        end
        for(i=0; i<4; i=i+1) begin
            if(i<3) begin
                if(in[i] == in[i+1])
                    out_different[i] = 0;
                else
                    out_different[i] = 1;
            end
            if(i==3) begin
                if(in[i] == in[0])
                    out_different[i] = 0;
                else
                    out_different[i] = 1;
            end
        end
    end
endmodule

/*
assign out_both      = in[2:0] & in[3:1];//here bits of input vector is shifted right 
    									//and bitwise and is performed to obtain the required output
    assign out_any       = in[3:1] | in[2:0];
    assign out_different = in ^ {in[0],in[3:1]};
*/