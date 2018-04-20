`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2018 09:26:45 PM
// Design Name: 
// Module Name: little_star
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


module little_star(
    input CLK,
    input sw7,
    output reg [6:0] switch,
    output reg [6:0] led
    );
    
    wire [6:0] key_mem[0:31];
    
    assign key_mem[0] = 7'b0000001; 
    assign key_mem[1] = 7'b0000001;
    assign key_mem[2] = 7'b0011111;
    assign key_mem[3] = 7'b0011111;
    assign key_mem[4] = 7'b0111111;
    assign key_mem[5] = 7'b0111111;
    assign key_mem[6] = 7'b0011111;
    assign key_mem[7] = 7'b0011111;  
    assign key_mem[8] = 7'b0001111; 
    assign key_mem[9] = 7'b0001111;
    assign key_mem[10] = 7'b0000111;
    assign key_mem[11] = 7'b0000111;
    assign key_mem[12] = 7'b0000011;
    assign key_mem[13] = 7'b0000011;
    assign key_mem[14] = 7'b0000001;
    assign key_mem[15] = 7'b0000001; 
    assign key_mem[16] = 7'b0011111; 
    assign key_mem[17] = 7'b0011111; 
    assign key_mem[18] = 7'b0001111; 
    assign key_mem[19] = 7'b0001111;
    assign key_mem[20] = 7'b0000111; 
    assign key_mem[21] = 7'b0000111;
    assign key_mem[22] = 7'b0000011;
    assign key_mem[23] = 7'b0000011;            
    assign key_mem[24] = 7'b0011111;
    assign key_mem[25] = 7'b0011111;
    assign key_mem[26] = 7'b0001111; 
    assign key_mem[27] = 7'b0001111; 
    assign key_mem[28] = 7'b0000111; 
    assign key_mem[29] = 7'b0000111;
    assign key_mem[30] = 7'b0000011; 
    assign key_mem[31] = 7'b0000011;                        

        reg [6:0] index = 7'b0;
        reg [25:0] count = 26'b0;
        reg [2:0] count1 = 3'b0;  
          
        always @ (posedge CLK ) begin
        count <= (count == 50000000 || sw7 == 0)? 0: count+1;
        count1 <= (sw7 == 0) ? 0 :
                   ((count == 50000000 ) ? count1 + 1 : count1);
                   
        index <= (sw7 == 0 )? 0: ((count == 50000000) ? index + 1 : index);
        
             
        switch <= ( sw7 == 0 ) ? 0 :
                  ((count1 == 6)? ( key_mem[index] ) : 
                  ((count1 == 7)? ((count < 30000000)? key_mem[index] : 0):
                  ((count < 40000000)? key_mem[index] : 0)));
                   
        led <= switch;

        end
 
        
endmodule