`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 08:47:56 PM
// Design Name: 
// Module Name: clockgen
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


module clockgen(
    input clk,
    output reg clk_20khz,
    output reg clk_50mhz,
    output reg clk_40khz,
    output reg clk_10khz
    );
    
    reg [11:0]count1 = 12'b0;
    reg count2 = 1'b0;
    
    reg [11:0]count3 = 12'b0;
    reg [12:0]count4 = 13'b0;

    
    initial begin
    clk_20khz = 0;
    clk_40khz = 0;
    clk_10khz = 0;
    end
     
    always @ (posedge clk)
    begin
    count1 <= (count1 == 2499)? 0 : + count1 + 1;
    count2 <= count2 + 1;
    
    count3 <= (count3 == 1249)? 0 : + count3 + 1;
    count4 <= (count4 == 4999)? 0 : + count4 + 1;

    clk_20khz <= (count1 == 0)? ~clk_20khz : clk_20khz;
    clk_50mhz <= count2;
    
    clk_40khz <= (count3 == 0)? ~clk_40khz : clk_40khz;
    clk_10khz <= (count4 == 0)? ~clk_10khz : clk_10khz;
    end

endmodule
