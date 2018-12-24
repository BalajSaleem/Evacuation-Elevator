`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2018 03:06:54 PM
// Design Name: 
// Module Name: testBench_1bit
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


module testBench_1Bit();
    logic x, y, cin;
	logic s, c;

	//create a dut-device under test for test bench
	one_bit dut(x, y, cin, c, s);
	
	initial begin
		#100;
		x= 0; y= 0; cin= 0; #10; //delay produced of #10
		cin= 1; #10;
		y= 1; cin= 0; #10;
		cin= 1; #10;
		x= 1; y= 0; cin= 0; #10;
		cin= 1; #10;
		y= 1; cin= 0;  #10;
		cin= 1; #10;
	end
endmodule
