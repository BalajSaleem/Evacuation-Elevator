module Elevator( input logic clk,
input logic es, //Emergency signal 
input logic reset, 
input logic a,b,c,full,back,
output logic st0, st1, st2,st3,st4,st5,st6,st7);
    
    typedef enum logic [2:0] {s0,s1,s2,s3,s4,s5,s6,s7} statetype; //THESE MIGHT BE [2:0]
    statetype[2:0] state, nextstate;
    
    //monitor total
    
    always_ff@(posedge clk, posedge reset)
    if(reset) state <= s0;
    else state <= nextstate;
    
    always_comb
    case(state)
    
    s0: if(es) nextstate = s1;
         else nextstate = s0;
         
    s1: if((a  == 1) | (b == 1) | (c == 1) ) nextstate = s2;
        else nextstate = s1;
        
    //GET A 2 SEC extra delay!
    
    s2: if(back) nextstate = s1;
        else if(a) nextstate = s3;
        else if((b | c) & ~(full) ) nextstate = s4;
        else nextstate = s2; 
        
//   //send new values of pFloor1,pFloor2,pFloor3 to the module of lights

    s3: nextstate = s2;

    s4: if(back) nextstate = s2;
        else if(b) nextstate = s5;
        else if(c & ~(full)) nextstate = s6;
        else nextstate = s4;

//    //send new values of pFloor1,pFloor2,pFloor3 to the module of lights
    s5: nextstate = s4;

    s6: if ( back ) nextstate = s4;
        else if(c) nextstate = s7;
        else nextstate = s6;
        //send new values of pFloor1,pFloor2,pFloor3 to the module of lights
        
    s7: nextstate = s6;

    default : nextstate = s0; //might be s0    
    endcase
    
    //outputs for the output module
    
    assign st0 = (state==s0);
    assign st1 = (state==s1);
    assign st2 = (state==s2);
    assign st3 = (state==s3);
    assign st4 = (state==s4);
    assign st5 = (state==s5);
    assign st6 = (state==s6);
    assign st7 = (state==s7);
    


    
endmodule