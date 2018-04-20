`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 09:25:43 PM
// Design Name: 
// Module Name: music_instrument
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


module music_instrument(
    input [6:0] keyboard,
    input CLK,
    output sound 
    );
    
    reg [17:0] count [6:0];
    reg clk [6:0];

    always @ (posedge CLK) begin
    count[0] <= (count[0] == 191112)? 0 : count[0]+1;
    count[1] <= (count[1] == 170261)? 0 : count[1]+1;
    count[2] <= (count[2] == 151685)? 0 : count[2]+1;
    count[3] <= (count[3] == 143172)? 0 : count[3]+1;
    count[4] <= (count[4] == 127552)? 0 : count[4]+1;
    count[5] <= (count[5] == 113635)? 0 : count[5]+1;
    count[6] <= (count[6] == 101238)? 0 : count[6]+1;
    clk[0] <= (count[0] == 0) ? ~clk[0] : clk[0];
    clk[1] <= (count[1] == 0) ? ~clk[1] : clk[1];
    clk[2] <= (count[2] == 0) ? ~clk[2] : clk[2];
    clk[3] <= (count[3] == 0) ? ~clk[3] : clk[3];
    clk[4] <= (count[4] == 0) ? ~clk[4] : clk[4];
    clk[5] <= (count[5] == 0) ? ~clk[5] : clk[5];   
    clk[6] <= (count[6] == 0) ? ~clk[6] : clk[6];
    end
    assign sound = (keyboard == 127) ? clk[6] : 
                   (keyboard == 63) ? clk[5] : 
                   (keyboard == 31) ? clk[4] :
                   (keyboard == 15 ) ? clk[3] :
                   (keyboard == 7 ) ? clk[2] :
                   (keyboard == 3 ) ? clk[1] :
                   (keyboard == 1 ) ? clk[0] : 0;
 
    
endmodule
