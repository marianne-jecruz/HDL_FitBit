`timescale 1ns / 1ps
module StepCounter32(
    input wire clk100MHz,
    input wire X,
    input wire reset,
    output reg [3:0] seconds_over_32
);
    reg [19:0] count;          // Counter for step count
    reg [19:0] prev_count;     // Previous step count
    reg [3:0] window_count;    // Count of seconds with over 32 steps

    // Instantiate rising edge detection module
    risingEdge_detect detector0 (.clk100MHz(clk100MHz), .X(X), .reset(reset), .step_count(count));

    always @(posedge clk100MHz or posedge reset) begin
        if (reset)
            seconds_over_32 <= 0;
        else if (count >= 32 && count != prev_count)
            window_count <= window_count + 1;

        if (count != prev_count)
            prev_count <= count;
    end

    always @(posedge clk100MHz) begin
        if (window_count > 9)
            seconds_over_32 <= 9;
        else
            seconds_over_32 <= window_count;
    end
endmodule