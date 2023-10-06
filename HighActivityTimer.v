

module HighActivityTimer(
    input wire clk,
    input wire reset,
    input wire X,
    output reg [5:0] high_activity_time
);
    reg [17:0] sample_counter;
    reg [5:0] total_time;

    reg sample_triggered; // Flag to indicate if a new sample should be taken
    reg pulse_detected;   // Flag to indicate a rising edge of X detected

    // Instantiate the clock divider
    ClockDivider clk_divider(
        .clk(clk),
        .clk_div(),
    );

    // Edge detection for X
    always @(posedge clk) begin
        if (X && !sample_triggered)
            pulse_detected <= 1;

        if (pulse_detected)
            sample_triggered <= 1;

        if (sample_triggered)
            sample_counter <= sample_counter + 1;

        if (X)
            pulse_detected <= 0;

        if (sample_counter == 9) begin
            if (pulse_detected)
                total_time <= total_time + 1;
            else
                total_time <= 0;

            sample_triggered <= 0;
            sample_counter <= 0;
        end
    end

    // Update the high activity time every 60 seconds
    always @(posedge clk or posedge reset) begin
        if (reset)
            high_activity_time <= 0;
        else if (total_time == 60)
            high_activity_time <= high_activity_time + 1;
    end
endmodule
