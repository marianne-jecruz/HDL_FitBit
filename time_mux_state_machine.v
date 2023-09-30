`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 08:40:54 PM
// Design Name: 
// Module Name: time_mux_state_machine
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
`timescale 1ns / 1ps

module time_mux_state_machine(
    input clk,
    input reset,
    input [6:0] in0, //segment display
    input [6:0] in1,
    input [6:0] in2,
    input [6:0] in3,
    output reg [3:0] an,
    output reg [6:0] seg, 
    output reg dp //decimal
    );
    
    reg [1:0] state;
    reg [1:0] next_state;

    initial begin
        an <= 4'b1110; //0 means on for led light
        seg <= 7'b0000001; //0 means on for segment light
        dp <= 1;
    end
    
    always @(*) begin
        case(state) // Makes the segments cascade sequentally in a loop until stopped
            2'b00: next_state = 2'b01;
            2'b01: next_state = 2'b10;
            2'b10: next_state = 2'b11;
            2'b11: next_state = 2'b00;
        endcase

        case(state) //puts values into segments
            2'b00: seg = in0;
            2'b01: seg = in1;
            2'b10: seg = in2;
            2'b11: seg = in3;
        endcase
        
        case(state)  //allows the segments to be on one at a time
            2'b00: an = 4'b1110;
            2'b01: an = 4'b1101;
            2'b10: an = 4'b1011;
            2'b11: an = 4'b0111;
        endcase
        ///THIS NEEDS TO BE MODIFIED!!!!!
        case(state) //decimal point that will always be on
            2'b00: dp = 1;
            2'b01: dp = 1;
            2'b10: dp = 0;
            2'b11: dp = 1;
        endcase
    end
    
    always @(posedge clk or posedge reset) begin
        if(reset)
            state <= 2'b00;
        else
            state <= next_state;
    end

endmodule
