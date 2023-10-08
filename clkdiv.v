`timescale 1ns / 1ps

module clkdiv(
    input clk,
    input reset,
    output reg clk_out
    );
    
    //Need to divide 100[MHz]- the input clock by 10^6 to obtain a 10[ms] clock period
    //get the max count from (10^6) / 2 - 1 to get a 50% duty cycle
    localparam cmax = 500000 - 1; //250000

    reg [19:0] COUNT = 0;//bigger than 499999

    initial begin
        clk_out = 0; //
    end
    
    always @(posedge clk or posedge reset) begin
        if (reset) //don't reset
            COUNT <= 0; 
        else if (COUNT == cmax) //doesn't equal maximum
            COUNT <= 0;
        else
            COUNT <= COUNT + 1; //increases count
    end

     always @(posedge clk or posedge reset) begin //clock gets ticked whenever clock reaches max
        if (reset) 
            clk_out <= 0;
        else if (COUNT == cmax)
            clk_out <= ~clk_out;
        else
            clk_out <= clk_out;
    end

endmodule
