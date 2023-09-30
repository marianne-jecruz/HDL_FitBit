`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 04:13:29 AM
// Design Name: 
// Module Name: distanceCovered
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
//    output reg [19:0] step_count

module distanceCovered(clk100MHz, X, reset, distance_val);
    input wire clk100MHz, X, reset;
    output reg [19:0] distance_val;
    
    integer num_halfMiles;
    wire [19:0] step_count;
    
    initial begin
        num_halfMiles = 0;
    end
    
    risingEdge_detect detector1 (.clk100MHz(clk100MHz), .X(X), .reset(reset), .step_count(step_count));
    
    always@(step_count) begin
        num_halfMiles = step_count >> 11;
        distance_val = (num_halfMiles * 5);
        //FEATURE ADD = 0.5 decimal and making sure intervals are correct (rounding down to nearest 0.5)
//       (0, 0.5) -> 0
//       (0.5, 1.0) -> 0.5
//       (1.0,1.5) -> 1.0
    end
    
endmodule
