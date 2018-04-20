`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2018 08:24:36 AM
// Design Name: 
// Module Name: recordthree
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


module recordthree(
input [11:0] data_in,
input clk_write,
input [12:11]sw,
output reg [11:0] data_out
);

reg [11:0] memory [0:65000]; 
reg [15:0] write_index = 0; //2^16 - 1 = 65536
reg [15:0] read_index = 0; //where 1sec = 20000 counts

always @ (posedge clk_write) begin
memory[write_index] <= data_in;
data_out <= memory[read_index];
write_index <= (write_index == 60000 || sw[12] == 0)? 0 : write_index + 1;
read_index <= (sw[11] == 0)? 0 : ((read_index == 60000) ? 0 : read_index + 1);
end
 

endmodule