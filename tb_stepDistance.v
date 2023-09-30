`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 04:36:37 AM
// Design Name: 
// Module Name: tb_stepDistance
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_stepDistance;
reg clk100MHz, reset, X;
wire S1;
wire [19:0] distance_val, count;

integer clkDivider;
integer i;

stepCounter cut1(.clk100MHz(clk100MHz), .X(X), .reset(reset), .count(count), .S1(S1));
distanceCovered cut2 (.clk100MHz(clk100MHz), .X(X), .reset(reset), .distance_val(distance_val));

initial begin
    X = 0;
    reset = 0;
    clk100MHz = 0;
    clkDivider = 0;

    for(i = 0; i < 5000000; i = i + 1) begin
        #10
        clk100MHz = ~clk100MHz;
        if(clkDivider < 5)
            clkDivider = clkDivider + 1;
        else begin
            X = ~X;
            clkDivider = 0;
        end     
    end


end

endmodule
