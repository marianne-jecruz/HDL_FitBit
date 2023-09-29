`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2023 11:36:51 PM
// Design Name: 
// Module Name: tb_pulseMod
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


module tb_pulseMod;

reg clk100Mhz;
reg [1:0] sw32;
wire mode0Clk, mode1Clk;
integer i;

pulseGenMod cut (.clk100Mhz(clk100Mhz), .sw32(sw32), .mode0Clk(mode0Clk), .mode1Clk(mode1Clk));

initial begin
clk100Mhz = 0;
sw32 = 2'b00;

    for(i = 0; i < 5000000; i = i + 1) begin
        #10
        clk100Mhz = ~clk100Mhz;
    end



end
endmodule
