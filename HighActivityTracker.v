`timescale 1ns / 1ps

module HighActivityTracker(
    input wire clk100MHz,
    input wire X,
    input wire reset,
    output reg [6:0] high_activity_seconds
);
    reg [19:0] count;          // Counter for step count
    reg [19:0] prev_count;     // Previous step count
    reg [6:0] activity_count;  // Count of high activity seconds

    // Instantiate rising edge detection module
    risingEdge_detect detector0 (.clk100MHz(clk100MHz), .X(X), .reset(reset), .step_count(count));

    always @(posedge clk100MHz or posedge reset) begin
        if (reset)
            high_activity_seconds <= 0;
        else if (count >= 64 && count != prev_count)
            activity_count <= activity_count + 1;

        if (count != prev_count)
            prev_count <= count;
    end

    always @(posedge clk100MHz) begin
        if (count < 64)
            high_activity_seconds <= activity_count;
    end
endmodule