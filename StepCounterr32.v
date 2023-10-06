module StepCounter32(
    input wire clk,                  // 100MHz clock
    input wire rst,                  // Reset signal
    input wire X,                    // Input pulse signal
    output reg [3:0] display [7:0]   // 4-bit 7-segment display output for 8 different rates
);

    reg [16:0] sample_counters [7:0]; // Array of sample counters for 8 different rates
    reg [16:0] total_times [7:0];     // Array of total times for 8 different rates

    wire x_rising_edge;
    wire clk_600hz;

    // Instantiate the clock divider module
    ClockDivider div_inst(.clk(clk), .reset(rst), .clk_600hz(clk_600hz));

    // Detect rising edge of X
    assign x_rising_edge = X & ~$past(X);

    // Logic to determine pulse rate and accumulate time
    always @(posedge clk_600hz or posedge rst) begin
        if (rst) begin
            // Reset all counters and total times
            for (int i = 0; i < 8; i = i + 1) begin
                sample_counters[i] <= 0;
                total_times[i] <= 0;
            end
        end else if (x_rising_edge) begin
            // Determine the rate based on the pulse count
            int rate = determine_rate(sample_counters[X]);

            // Accumulate time for the detected rate
            if (rate != -1) begin
                if (sample_counters[X] <= rate) begin
                    total_times[X] <= total_times[X] + (17'b1 / 600);
                end
            end
        end
    end

    // Display the count on a 4-digit 7-segment display for each rate
    always @(*) begin
        for (int i = 0; i < 8; i = i + 1) begin
            if (total_times[i] >= 9) begin
                display[i] <= 9;
            end else begin
                display[i] <= total_times[i][3:0];
            end
        end
    end

    // Function to determine the rate based on the pulse count
    function int determine_rate(int count);
        if (count <= 19) begin
            return 0; // Rate for 32 steps/second
        end else if (count <= 31) begin
            return 1; // Rate for 22 steps/second
        end
        // Add more rate checks as needed for different pulse rates
        return -1; // Unknown rate
    endfunction

endmodule
