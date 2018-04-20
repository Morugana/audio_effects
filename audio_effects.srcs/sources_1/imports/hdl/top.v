`timescale 1ns / 1ps
module top(
    input         clk,
    input         PS2Data,
    input         PS2Clk,
    output [6:0] led,
    output [6:0] sounddata
);
    reg CLK50MHZ=0;
    wire [15:0] keycode;
//    wire [5:0] acode;
//    wire [15:13] fcode;
    always @(posedge(clk))begin
        CLK50MHZ<=~CLK50MHZ;
    end
    
    PS2Receiver uut (
        .clk(CLK50MHZ),
        .kclk(PS2Clk),
        .kdata(PS2Data),
        .keycode(keycode),
        .oflag()
    );
    
    
    assign led = (keycode[15:13] == 7)? 0 :
                 ((keycode[5:0] == 6'b010110)? 1:
                 ((keycode[5:0] == 6'b011110)? 3:
                 ((keycode[5:0] == 6'b100110)? 7:
                 ((keycode[5:0] == 6'b100101)? 15:
                 ((keycode[5:0] == 6'b101110)? 31:
                 ((keycode[5:0] == 6'b110110)? 63:
                 ((keycode[5:0] == 6'b111101)? 127:0)))))));
       
    assign sounddata = led;
endmodule
