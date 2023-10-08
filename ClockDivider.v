module ClockDivider(
    input wire clk,
    output wire clk_div
);
    // Clock divider logic to generate a 600 Hz clock
    reg [17:0] count;
    parameter DIVIDER = 1666; // For a 100 MHz clock, divide by 1666 to get 600 Hz

    always @(posedge clk) begin
        if (count == DIVIDER - 1)
            count <= 0;
        else
            count <= count + 1;

        if (count == DIVIDER - 1)
            clk_div <= ~clk_div; // Toggle output every 1666 cycles for 600 Hz
    end
endmodule