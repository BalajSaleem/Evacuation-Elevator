`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2018 07:35:31 PM
// Design Name: 
// Module Name: bit_1
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


module one_bit_full_adder(

    input x,
    input y,
    input cin,
    output c,
    output s
    
    );
    
    logic a;
    logic b;
    
    
    
    assign a = x ^ y;
    assign b = x & y;
    
    assign s = a ^ cin;
    assign c = b | (a & cin);

endmodule
