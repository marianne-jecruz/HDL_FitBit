`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 03:03:37 AM
// Design Name: 
// Module Name: risingEdge_detect
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


module risingEdge_detect(clk100MHz, X, reset, step_count);
    input wire clk100MHz, X, reset;
    output reg [19:0] step_count;
    
    localparam 
        Reset = 2'b00,
        Init = 2'b01,
        RiseEd = 2'b10,
        FallEd = 2'b11;
        
    reg [1:0] Current_State, Next_State;
    
    initial begin
        Current_State = Reset;
        //step_count = 20'd2048; //FOR TESTING: would not work though
        //step_count = 20'b0;
    end
    
    always@(posedge clk100MHz) begin
        Current_State <= Next_State;
    end
    
    always@(Current_State) begin
        case(Current_State)
            Reset:  step_count = 0;
            RiseEd: step_count = step_count + 1;
            default: step_count = step_count;
       endcase   
    end
    
    always@(X) begin
        case(Current_State)
            Reset: begin
                Next_State = Init;
            end
            Init: begin
                if(reset)
                    Next_State = Reset;
                else if(!X)
                    Next_State = Init;
                else
                    Next_State = RiseEd;
            end
            RiseEd: begin
                if(reset)
                    Next_State = Reset;
                else if(!X)
                    Next_State = FallEd;
                else
                    Next_State = RiseEd;
            end
            FallEd: begin
                if(reset)
                    Next_State = Reset;
                else if(!X)
                    Next_State = Init;
                else
                    Next_State = RiseEd;
            end
            default: Next_State = Current_State;
       endcase
    end
    
endmodule
