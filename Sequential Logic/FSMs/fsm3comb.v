module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always@(*)begin
        if(state == 2'b00)
            next_state = (in)? B:A;
        else if(state == 2'b01)
            next_state = (in)? B:C;
        else if(state == 2'b10)
            next_state = (in)? D:A;
        else
            next_state = (in)? B:C;
    end
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == D)? 1'b1 : 1'b0;
endmodule
