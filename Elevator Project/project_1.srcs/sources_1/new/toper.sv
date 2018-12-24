//Made by Balaj Saleem. December 2018
module toper( input clk, input rstbtn, rstTbtn,esbtn,
input [3:0] keyb_col,
output [3:0] keyb_row, 
//input logic es,//reset,
output logic state0, state1,state2,state3,state4,state5,state6,state7 ,al,bl,cl,
output logic [3:0] an,
output logic s1,s2,s3,s4,s5,s6,s7,dp,

	// FPGA pins for 8x8 display
	output reset_out, //shift register's reset
	output OE, 	//output enable, active low 
	output SH_CP,  //pulse to the shift register
	output ST_CP,  //pulse to store shift register
	output DS, 	//shift register's serial input data
	output [7:0] col_select // active column, active 


    );
    
    reg a,b,c,full,back,waiting; //this may be logic, although they have to be stored.
    logic st0,st1,st2,st3,st4,st5,st6,st7;
    logic [3:0] p1,p2,p3;
    logic [3:0] pFloor1,pFloor2,pFloor3,total;
    logic [1:0] floor;
    logic [4:0] counter1,counter2,counter3,counter4;
    logic es,reset, resetTimer;
    logic clkOut;
    
    
    ClockDivider clkdvdr(clk, clkOut);
    debouncing db(clk,rstbtn,reset);
    debouncing db2(clk, rstTbtn,resetTimer);
    debouncing db3(clk,esbtn,es);
    
    
    
    always_ff @(posedge clkOut)
    begin
        
        if(resetTimer)
        begin
            counter1=0;
            counter2=0;
            counter3=0;
            counter4=10;
        end
        
        counter1 = counter1 + 1;
        if(back)
        begin
            if (counter4 == 10'd10 | counter4 == 10'd0 )
            begin
                counter4 = 15;
            end 
            counter4 = counter4 - 1;
        end
        else
        begin
            if (counter4 == 10'd15 | counter4 == 10'd0)
                    begin
                        counter4 = 10;
                    end
                    counter4 = counter4 + 1;
        end
        
        if(counter1 == 10'd10)
        begin
            counter1 = 0;
            counter2 = counter2 + 1;
            if (counter2 == 10'd10)
            begin
            counter2 = 0;
            counter3 = counter3+1;
            end
        end        
    end
    
    inputHandler inp(clk, keyb_col,p1,p2,p3,keyb_row);
    dp datapath(clkOut, p1,p2,p3, st0,st1,st2,st3,st4,st5,st6,st7, pFloor1,pFloor2,pFloor3,floor,a,b,c,full,back,waiting);
    Elevator fsm(clkOut,es,reset,a,b,c,full,back,  st0,st1,st2,st3,st4,st5,st6,st7);
    SevSeg_4digit sevSeg(clk,counter1 ,counter2, counter3,counter4,s1,s2,s3,s4,s5,s6,s7,dp,an );
    dispHandle disp(clk,a,b,c,floor,pFloor1,pFloor2,pFloor3,total, reset_out,OE,SH_CP,ST_CP,DS,col_select);
    
    
    
    assign state0 = st0;
    assign state1 = st1;
    assign state2 = st2;
    assign state3 = st3;
    assign state4 = st4;
    assign state5 = st5;
    assign state6 = st6;
    assign state7 = st7;
    assign al = a;
    assign bl = b;
    assign cl = c;
    
  //if (back) spin anticlockwise
  //pFloor1 , pFloor2 , pFloor3 passengers of each floor
  //use floor to determine the floor of the elevator
  //use waiting to see if you should wait 2s.  
endmodule