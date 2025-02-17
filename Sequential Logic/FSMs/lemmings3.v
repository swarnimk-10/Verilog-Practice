module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT = 2'b00, RIGHT = 2'b01, GROUND = 2'b10, DIGGING=2'b11;
    reg [1:0] state, next_state, prev_state;
    
    // ✅ Sequential block: Handles state transitions and prev_state updates
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state <= LEFT;          // Reset to LEFT
            prev_state <= LEFT;     // Default previous state to LEFT
        end 
        else begin
            state <= next_state;

            // ✅ Ensure prev_state updates only when transitioning to GROUND
            if (state == LEFT || state == RIGHT)
                prev_state <= state;
        end
    end

    // ✅ Combinational block: Only determines next state (does NOT update prev_state)
    always @(*) begin
        case (state)
            LEFT: begin
                if (!ground)
                    next_state = GROUND;
                else if(dig)
                    next_state = DIGGING;
                else if (bump_left)
                    next_state = RIGHT;
                else
                    next_state = LEFT;
            end

            RIGHT: begin
                if (!ground)
                    next_state = GROUND;
                else if(dig)
                    next_state = DIGGING;
                else if (bump_right)
                    next_state = LEFT;
                else
                    next_state = RIGHT;
            end

            GROUND: begin
                if (!ground)
                    next_state = GROUND;
                else  
                    next_state = prev_state; 
            end

            DIGGING: begin
                if(!ground)
                    next_state = GROUND;
                else
                    next_state = DIGGING;
            end
            
            default: next_state = LEFT;
        endcase
    end

    // ✅ Output assignments
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
    assign aaah = (state == GROUND);
    assign digging    = (state == DIGGING);
endmodule
