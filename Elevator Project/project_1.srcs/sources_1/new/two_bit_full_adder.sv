`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2018 07:45:07 PM
// Design Name: 
// Module Name: one_bit_full_adder
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


module two_bit_full_adder(

    input logic [1:0] x,
    input logic [1:0] y,
    input cin,
    output logic [1:0] s,
    output c);
    
    logic temp;
    
    one_bit_full_adder firstAdder(x[0],y[0],cin,temp,s[0]);
    one_bit_full_adder secondAdder(x[1],y[1],temp,c,s[1]);

    
endmodule
