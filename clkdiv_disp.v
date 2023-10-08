`timescale 1ns / 1ps

module clkdiv_disp(
    input clk,
    input reset,
    output clk_out
    );
    
    reg [19:0] COUNT = 0;
    
        assign clk_out=COUNT[18]; //display is getting the 18th bit of count and it'll get ticked when that bit reaches 1.
        
        always @(posedge clk) //loop to increase count
        begin
        if (reset)
            COUNT = 0;
        else
            COUNT = COUNT + 1;
        end
endmodule
