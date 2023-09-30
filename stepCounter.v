`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 03:46:25 AM
// Design Name: 
// Module Name: stepCounter
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
//module risingEdge_detect(clk100MHz, X, reset, step_count);
//    input wire clk100MHz, X, reset;
//    output reg [19:0] step_count;

module stepCounter(clk100MHz, X, reset, count, S1);
    input wire clk100MHz, X, reset;
    output wire [19:0] count;
    output reg S1;
    
    risingEdge_detect detector0 (.clk100MHz(clk100MHz), .X(X), .reset(reset), .step_count(count));
    
    always@(count) begin
        if(count < 20'd9999)
            S1 = 1'b0;
        else
            S1 = 1'b1;
    end
endmodule
