
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Balaj Saleem
// 
// Create Date: 
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module dispHandle(
	input clk,
	input logic a,b,c, //100Mhz on Basys3
	input logic [1:0] floor,
	input logic [3:0] pFloor1,pFloor2,pFloor3,total,

	// FPGA pins for 8x8 display
	output reset_out, //shift register's reset
	output OE, 	//output enable, active low 
	output SH_CP,  //pulse to the shift register
	output ST_CP,  //pulse to store shift register
	output DS, 	//shift register's serial input data
	output [7:0] col_select // active column, active high

	);
    
logic [2:0] col_num;

// initial value for RGB images:
//	image_???[0]     : left column  .... image_???[7]     : right column
//	image_???[?]'MSB : top line     .... image_???[?]'LSB : bottom line
logic [0:7] [7:0] image_red = 
{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
logic [0:7] [7:0]  image_green = 
{8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
logic [0:7] [7:0]  image_blue = 
{8'b00000011, 8'b00000011, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};


   
// This module displays 8x8 image on LED display module. 
display_8x8 display_8x8_0(
	.clk(clk),
	
	// RGB data for display current column
	.red_vect_in(image_red[col_num]),
	.green_vect_in(image_green[col_num]),
	.blue_vect_in(image_blue[col_num]),
	
	.col_data_capture(), // unused
	.col_num(col_num),
	
	// FPGA pins for display
	.reset_out(reset_out),
	.OE(OE),
	.SH_CP(SH_CP),
	.ST_CP(ST_CP),
	.DS(DS),
	.col_select(col_select)   
);
 
   
// move the image to right every half a second to make an animation

//logic [28:0] counter = {29{1'b0}}; //delay
always@ (posedge clk)

begin
	//counter <= counter + 1;
	

	//if ( counter == 29'd300_999_999 ) //delay
	
		//counter <= {29{1'b0}}; //delay
//		image_red   <= { image_red[7],   image_red[0:6]};
//		image_green <= { image_green[7], image_green[0:6]};
		
		if ( floor == 2'b00)
		begin
        image_blue <= 
        {8'b00000011, 8'b00000011, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
        end
        
        if (floor == 2'b01)
        begin
        image_blue <= 
        {8'b00001100, 8'b00001100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
        
        
//                    if(total == 4'b0000)
//                    begin
//                    image_blue <= 
//                    {8'b00001100, 8'b00001100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    image_red <=
//                    {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    end
//                    else if(total == 4'b0001)
//                    begin
//                    image_blue <= 
//                    {8'b00001000, 8'b00001100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    image_red <= 
//                    {8'b00000100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    end
//                    else if(total == 4'b0010)
//                    begin
//                    image_blue <= 
//                    {8'b00001000, 8'b00001000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    image_red <= 
//                    {8'b00000100, 8'b00000100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    end
//                    else if(total == 4'b0011)
//                    begin
//                    image_blue <= 
//                    {8'b00000000, 8'b00001000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    image_red <= 
//                    {8'b00001100, 8'b00000100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    end
//                    else if(total == 4'b0100)
//                    begin
//                    image_blue <=
//                    {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    image_red <= 
//                    {8'b00001100, 8'b00001100, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//                    end
        
        
        
        
        end
        
        if (floor == 2'b10)
        begin
        image_blue <= 
        {8'b00110000, 8'b00110000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};

//  if(total == 4'b0000)
//            begin
//            image_blue <= 
//            {8'b00110000, 8'b00110000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0001)
//            begin
//            image_blue <= 
//            {8'b00100000, 8'b00110000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b00010000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0010)
//            begin
//            image_blue <= 
//            {8'b00100000, 8'b00100000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b00010000, 8'b00010000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0011)
//            begin
//            image_blue <= 
//            {8'b00000000, 8'b00100000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b00110000, 8'b00010000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0100)
//            begin
//            image_blue <=
//            {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b00110000, 8'b00110000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end


        end
        
        if (floor == 2'b11)
        begin
        image_blue <= 
        {8'b11000000, 8'b11000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
            
            
//            if(total == 4'b0000)
//            begin
//            image_blue <= 
//            {8'b11000000, 8'b11000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0001)
//            begin
//            image_blue <= 
//            {8'b10000000, 8'b11000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b01000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0010)
//            begin
//            image_blue <= 
//            {8'b10000000, 8'b10000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b01000000, 8'b01000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0011)
//            begin
//            image_blue <= 
//            {8'b00000000, 8'b10000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b11000000, 8'b01000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
//            else if(total == 4'b0100)
//            begin
//            image_blue <=
//            {8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            image_red <= 
//            {8'b11000000, 8'b11000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000, 8'b00000000};
//            end
        
        
        end
        
        
   
        //if block pFloor1
        
            
        
   
   
   //ifs for pFloor2
            
           if(b) begin
     
//             if(pFloor2 == 4'b0000)
//             begin
//             image_red <= {8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};
//             end
             
            if(pFloor2 >= 4'b0000)
                begin
                image_red <= {8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};
                end
                
                 if (pFloor2 >= 4'b0001)
                begin
                image_red[2][5] <= 1'b1;
                end
                 if (pFloor2 >= 4'b0010)
                begin
                image_red[2][4] <= 1'b1;
                end
                 if (pFloor2 >= 4'b0011)
               begin
               image_red[3][5] <= 1'b1;
               end
               if (pFloor2 >= 4'b0100)
              begin
              image_red[3][4] <= 1'b1;
              end
                if (pFloor2 >= 4'b0101)
                     begin
                     image_red[4][5] <= 1'b1;
                     end
               if (pFloor2 >= 4'b0110)
                    begin
                    image_red[4][4] <= 1'b1;
                    end
               if (pFloor2 >= 4'b0111)
                    begin
                    image_red[5][5] <= 1'b1;
                    end
                      if (pFloor2 >= 4'b1000)
                     begin
                      image_red[5][4] <= 1'b1;            
                      end
                       if (pFloor2 >= 4'b1001)
                      begin
                      image_red[6][5] <= 1'b1;                  
                      end
                      else if (pFloor2 >= 4'b1010)
                      begin
                      image_red[6][4] <= 1'b1;;         
                      end
                     else if (pFloor2 >= 4'b1011)
                     begin
                     image_red[7][5] <= 1'b1;                                  
                     end
                     else if (pFloor2 >= 4'b1100)
                     begin
                      image_red[7][4] <= 1'b1;                                 
                     end
         
    
    
            end
           
           
           if(c)
           begin
//               if(pFloor3 == 4'b0000)
//               begin
//               image_red <= {8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};
//               end
               
//          if(pFloor2 == 4'b0000)
//               begin
//               image_red <= {8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};
//               end
               
               if (pFloor3 >= 4'b0001)
               begin
               image_red[2][7] <= 1'b1;
               end
                if (pFloor3 >= 4'b0010)
               begin
               image_red[2][6] <= 1'b1;
               end
               if (pFloor3 >= 4'b0011)
              begin
              image_red[3][7] <= 1'b1;
              end
             if (pFloor3 >= 4'b0100)
             begin
             image_red[3][6] <= 1'b1;
             end
             if (pFloor3 >= 4'b0101)
                    begin
                    image_red[4][7] <= 1'b1;
                    end
             if (pFloor3 >= 4'b0110)
                   begin
                   image_red[4][6] <= 1'b1;
                   end
             if (pFloor3 >= 4'b0111)
                   begin
                   image_red[5][7] <= 1'b1;
                   end
                    if (pFloor3 >= 4'b1000)
                    begin
                     image_red[5][6] <= 1'b1;            
                     end
                     if (pFloor3 >= 4'b1001)
                     begin
                     image_red[6][7] <= 1'b1;                  
                     end
                     if (pFloor3 >= 4'b1010)
                     begin
                     image_red[6][6] <= 1'b1;;         
                     end
                     if (pFloor3 >= 4'b1011)
                    begin
                    image_red[7][7] <= 1'b1;                                  
                    end
                    if (pFloor3 >= 4'b1100)
                    begin
                     image_red[7][6] <= 1'b1;                                 
                    end
                    
                end    
                    
           if (a)
           begin
//                if(pFloor1 == 4'b0000)
//                begin
//                image_red <= {8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0,8'd0};
//                end
                
                 if (pFloor1 >= 4'b0001)
                begin
                image_red[2][3] <= 1'b1;
                end
                 if (pFloor1 >= 4'b0010)
                begin
                image_red[2][2] <= 1'b1;
                end
                 if (pFloor1 >= 4'b0011)
               begin
               image_red[3][3] <= 1'b1;
               end
               if (pFloor1 >= 4'b0100)
              begin
              image_red[3][2] <= 1'b1;
              end
                if (pFloor1 >= 4'b0101)
                     begin
                     image_red[4][3] <= 1'b1;
                     end
               if (pFloor1 >= 4'b0110)
                    begin
                    image_red[4][2] <= 1'b1;
                    end
               if (pFloor1 >= 4'b0111)
                    begin
                    image_red[5][3] <= 1'b1;
                    end
                      if (pFloor1 >= 4'b1000)
                     begin
                      image_red[5][2] <= 1'b1;            
                      end
                       if (pFloor1 >= 4'b1001)
                      begin
                      image_red[6][3] <= 1'b1;                  
                      end
                       if (pFloor1 >= 4'b1010)
                      begin
                      image_red[6][2] <= 1'b1;;         
                      end
                      if (pFloor1 >= 4'b1011)
                     begin
                     image_red[7][3] <= 1'b1;                                  
                     end
                      if (pFloor1 >= 4'b1100)
                     begin
                      image_red[7][2] <= 1'b1;                                 
                     end
        
        end
        
        
	

end
 
 
endmodule

