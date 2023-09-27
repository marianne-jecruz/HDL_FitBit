`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 10:20:25 PM
// Design Name: 
// Module Name: clkDivider_32f
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


module clkDivider_32f(clk100Mhz, clk32Hz);
    input clk100Mhz;
    output clk32Hz;
    
    reg[22:0] counter;
    assign clk32Hz = counter[22]; //(2^22 / 100E6) = 0.04seconds
    
    initial begin
        counter = 0;
    end
    
    always @ (posedge clk100Mhz) begin
        counter <= counter + 1; 
    end
    
endmodule
