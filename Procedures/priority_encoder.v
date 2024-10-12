// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always@(*) begin
        if(in[0]==1)
            pos = 2'b00;
        else if(in[1]==1)
            pos = 2'b01;
        else if(in[2]==1)
            pos = 2'b10;
        else if(in[3]==1)
            pos = 2'b11;
        else
            pos = 2'b00;
    end
endmodule
