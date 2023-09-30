`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 09:32:58 PM
// Design Name: 
// Module Name: clkDivider_2sec
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


module clkDivider_2sec(clk100MHz, clk2sec);
    input clk100MHz;
    output clk2sec;

    reg[28:0] counter;
    //assign clk2sec = counter[28];
    assign clk2sec = counter[2]; //FOR TESTING
    
    initial begin
        counter = 0;
    end
    
    always @ (posedge clk100MHz) begin
        counter <= counter + 1; 
    end
    
endmodule
