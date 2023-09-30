`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 10:03:42 PM
// Design Name: 
// Module Name: cycler_2sec
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


module cycler_2sec(clk100MHz, stepC_data, distance_data, f32_data, highAct_data, selected_data, clk2sec, distance_flag);
    input clk100MHz;
    input [3:0] stepC_data, distance_data, f32_data, highAct_data;
    output wire clk2sec;
    output reg [3:0] selected_data;
    output reg distance_flag;

    localparam 
        StepC = 2'b00,
        Distance = 2'b01,
        F32 = 2'b10,
        HighAct = 2'b11;

    reg [1:0] Current_State, Next_State;

    clkDivider_2sec cyclerClk (.clk100MHz(clk100MHz), .clk2sec(clk2sec));

    initial begin 
     Current_State = StepC;
     distance_flag = 0;
    end

always@(posedge clk2sec) begin
    Current_State <= Next_State;
end

always@(Current_State) begin
        case(Current_State)
            StepC: begin
                Next_State = Distance;
                selected_data = stepC_data;
            end
            Distance: begin
                distance_flag = 1;
                Next_State = F32;
                selected_data = distance_data;
            end
            F32: begin
                distance_flag = 0;
                Next_State = HighAct;
                selected_data = f32_data;
            end
            HighAct: begin
                Next_State = StepC;
                selected_data = highAct_data;
            end
            default: begin
                Next_State = Current_State;
                selected_data = 4'b0;
            end
       endcase 
end




endmodule
