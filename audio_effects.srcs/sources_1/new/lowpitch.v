`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 08:52:32 PM
// Design Name: 
// Module Name: lowpitch
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


module lowpitch(

    input [11:0] data_in,
    input clk_write,
    input clk_read,
    output reg [11:0] data_out
    );


    reg [11:0] memory [0:1023]; 
    reg [14:0] write_index = 0; //2^15 - 1 = 32768
    reg [14:0] read_index = 0; //where 1sec = 20000 counts
    
    always @ (posedge clk_write) begin
    memory[write_index] <= data_in;
    write_index <= (write_index == 1023)? 0 : write_index + 1;
    end
    
    //low-pitch connect 10khz, count + 1, index 1024
    
    always @ (posedge clk_read) begin
    data_out <= memory[read_index];
    read_index <= (read_index == 1023) ? 0 : read_index + 1;
    end

endmodule
