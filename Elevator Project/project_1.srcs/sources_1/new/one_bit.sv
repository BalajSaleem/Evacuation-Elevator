`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2018 03:16:58 PM
// Design Name: 
// Module Name: one_bit
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


module one_bit(x,y,cin,c,s);
    
    input logic x,y,cin;
    output logic c,s;
    
    logic a,b,d;   
     
    xor(a ,x ,y);
    xor(s,a,cin);
    and(d,a,cin);
    and(b,x,y);
    or(c,b,d);
    
    
    
//    and(b ,x,y);
//    xor(s,a,cin);
//    and(d,a,cin);
//    or(c,b,d);
    
    
    

endmodule
