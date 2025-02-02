module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh, // Two-digit BCD for hours
    output [7:0] mm, // Two-digit BCD for minutes
    output [7:0] ss  // Two-digit BCD for seconds
); 
    
    wire ena1, ena2, ena3;
    reg pm_reg;

    assign ena3 = ena;  // Seconds update only when enabled
    assign ena2 = (ss == 8'h59) && ena;  // Enable minutes when seconds = 59
    assign ena1 = (ss == 8'h59 && mm == 8'h59) && ena;  // Enable hours when minutes = 59 and seconds = 59
    
    // Hour counter (handles AM/PM)
    h_count c1(clk, reset, ena1, pm_reg, hh);
    // Minute counter
    ms_count c2(clk, reset, ena2, mm);
    // Second counter
    ms_count c3(clk, reset, ena3, ss);
    
    // Assign the PM signal
    assign pm = pm_reg;

endmodule

// Hour Counter (BCD + PM Handling)
module h_count(
    input clk,
    input reset,
    input ena,
    output reg pm,   // AM/PM indicator
    output reg [7:0] q  // Two-digit BCD hours
);
    
    always @ (posedge clk)  // **Synchronous reset**
    begin
        if (reset) begin
            q <= 8'h12; // Reset to 12:00
            pm <= 0;    // AM (pm = 0)
        end 
        else if (ena) begin
            if (q == 8'h11) begin  // 11 → 12 transition
                q <= 8'h12;
                pm <= ~pm;  // Toggle AM/PM
            end 
            else if (q == 8'h12) begin
                q <= 8'h01;  // Wrap from 12 to 1
            end
            else if (q[3:0] == 4'h9) begin
                q <= {q[7:4] + 4'h1, 4'h0}; // BCD increment
            end 
            else begin
                q <= q + 1'b1;  // Increment BCD
            end
        end
    end

endmodule

// Minute and Second Counters (BCD)
module ms_count(
    input clk,
    input reset,
    input ena,
    output reg [7:0] q  // Two-digit BCD for mm/ss
);
    
    always @ (posedge clk)  // **Synchronous reset**
    begin
        if (reset)
            q <= 8'h00;  // Reset to 00
        else if (ena) begin
            if (q == 8'h59) 
                q <= 8'h00;  // Wrap around at 59
            else if (q[3:0] == 4'h9) 
                q <= {q[7:4] + 4'h1, 4'h0}; // BCD carry
            else 
                q <= q + 1'b1;  // BCD increment
        end
    end

endmodule
