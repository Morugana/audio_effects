`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 08:50:45 PM
// Design Name: 
// Module Name: delayone
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


module delayone(    
    input [11:0] data_in,
    input clk_write,
    output reg [11:0] data_out
    );

    reg [11:0] memory [0:30000]; 
    reg [14:0] write_index = 20000; //2^15 - 1 = 32768
    reg [14:0] read_index = 0; //where 1sec = 20000 counts
    
    always @ (posedge clk_write) begin
    memory[write_index] <= data_in;
    data_out <= memory[read_index];
    write_index <= (write_index == 30000)? 0 : write_index + 1;
    read_index <= (read_index == 30000) ? 0 : read_index + 1;
    end
     
    
endmodule
