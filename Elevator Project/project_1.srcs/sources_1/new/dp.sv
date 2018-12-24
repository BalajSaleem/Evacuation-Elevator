`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Balaj Saleem 
// 
// Create Date: 12/22/2018 11:04:29 PM
// Design Name: 
// Module Name: dp
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

module dp(input clk,
          input logic [3:0] p1,p2,p3,
          input logic s0,s1,s2,s3,s4,s5,s6,s7,
          
          output logic [3:0] pFloor1,pFloor2,pFloor3, //for display
          output logic [1:0] floorr, //for display
          output logic a,b,c,full,back,wt //for fsm

    );

    reg [3:0] total = 3'b000;
    reg [1:0] floor = 2'b00;
    //reg [0:0] back = 1'b0;
    reg [0:0] waiting = 1'b0;
    //a = 1'b0, b = 1'b0, c = 1'b0;
    
    
    
    always_ff @(posedge clk)
    begin
//    a<=0;
//    b<=0;
//    c<=0;
//    back<=0;
    if(s0)
    begin
        total <= 3'b000;  
        floor <= 2'b00;
        back <= 0;
        waiting <= 0;
        //s0: inputHandler(clk,sw1,sw2,sw3,p1,p2,p3);
        a<=0;
        b<=0;
        c<=0;
         back <= 1'b0;
        pFloor1 <= p1; //use a module, take button inputs, increment passengers, return value of passengers
        pFloor2 <= p2;
        pFloor3 <= p3;
        if(pFloor1>4'b0000) a<=1;
        if(pFloor2>4'b0000) b<=1;
        if(pFloor3>4'b0000) c<=1;
      end
     if(s1)
     begin
        floor <= 2'b00;    
        total <= 0;
        back <= 0;
//        pFloor1 <= p1; //use a module, take button inputs, increment passengers, return value of passengers
//        pFloor2 <= p2;
//        pFloor3 <= p3;
        if(pFloor1>4'b0000) a<=1;
        if(pFloor2>4'b0000) b<=1;
        if(pFloor3>4'b0000) c<=1;
       end
       
       
     if(s2) 
     begin
        floor <= 2'b01;
     end
     
     
      if(s3)
      begin
        floor <= 2'b01;
        waiting <= 1'b1;
        
        if(pFloor1 < 4'b0100) begin total <= total + pFloor1; end
             else begin total <= 4'b0100; back <= 1; end
        if(pFloor1 >= 4'b0100) begin  pFloor1 <= pFloor1 - 4'b0100; end
             else begin pFloor1 <= 4'b0000; a=0; end
        //if(total == 4'b0100) begin back <= 1; end
        
        end
        
     if(s4)
     begin
        floor <= 2'b10;
        
     end
     
     
     if(s5)
     begin
        floor <= 2'b10;
        waiting <= 1'b1;
        
        if(pFloor2 < (4'b0100 - total) ) begin  total <= total + pFloor2; end
             else begin total <= 4'b0100; back <= 1; end
        if(pFloor2 >= 4'b0100) begin  pFloor2 <= pFloor2 - (4'b0100 - total); end
             else begin pFloor2 <= 4'b0000; b<=0; end
        if((total == 4'b0100) | (~c)) begin back <= 1; end
      end   
             


     if(s6)begin
         floor <= 2'b11;
       end
     if(s7)begin
        floor <= 2'b11;
        waiting <= 1'b1;
        back <= 1;
        if(pFloor3 < (4'b0100 - total) ) begin total <= total + pFloor3; end
             else begin total <= 4'b0100; end
        if(pFloor3 >= 4'b0100) begin  pFloor3 <= pFloor3 - (4'b0100 - total); end
             else begin pFloor3 <= 4'b0000; c<=0; end
    end
    

    
    
    end
    
    
    
    assign floorr = floor;
    assign full = (total == 4'b0100);
    assign wt = waiting;
    
    
endmodule
