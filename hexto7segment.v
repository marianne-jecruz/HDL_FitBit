`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 08:35:08 PM
// Design Name: 
// Module Name: hexto7segment
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
module hexto7segment (
	input [3:0] x, //4 bit
	output reg [6:0] r //7bit
	);
	always @(*) 
		case (x)
			4'b0000 : r= 7'b0000001; //0
			4'b0001 : r= 7'b1001111; //1
			4'b0010 : r= 7'b0010010; //2
			4'b0011 : r= 7'b0000110; //3
			4'b0100 : r= 7'b1001100; //4
			4'b0101 : r= 7'b0100100; //5
			4'b0110 : r= 7'b0100000; //6
			4'b0111 : r= 7'b0001111; //7
			4'b1000 : r= 7'b0000000; //8
			4'b1001 : r= 7'b0001100; //9
			//default : r= 7'b0001100; //9
		endcase
endmodule
