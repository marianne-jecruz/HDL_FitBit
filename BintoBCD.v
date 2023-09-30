`timescale 1ns / 1ps
//used to display o board using hex values
module BintoBCD(   //(converts each decimal digit into binary)
    input [6:0] binary,
    output reg [7:0] bcd
);

integer i;
always @(binary) begin

   bcd = 0;

    for (i=6; i>=0; i=i-1) begin
        if (bcd[7:4] >= 5)
            bcd[7:4] = bcd[7:4] + 3;
        if (bcd[3:0] >= 5)
            bcd[3:0] = bcd[3:0] + 3;
        
        bcd[7:4] = bcd[7:4] << 1;
        bcd[4] = bcd[3];
        bcd[3:0] = bcd[3:0] << 1;
        bcd[0] = binary[i];
    end

end


endmodule
