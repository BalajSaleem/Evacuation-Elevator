
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2018 02:15:38 PM
// Design Name: 
// Module Name: testBench
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


module testBench();
	logic[1:0] x, y;
	logic cin;
	logic[1:0] s;
	logic c;

	//create a dut-device under test for test bench
	two_bit_full_adder dut(x, y, cin, s, c);
	
	initial begin
		#100;
		x = 2'b00; y= 2'b00; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b01; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b10; cin= 0; #10; //delxy produced of #10		
		cin= 1; #10; //delay produced of #10
		y= 2'b11; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		x = 2'b01; y= 2'b00; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b01; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b10; cin= 0; #10; //delay produced of #10		
		cin= 1; #10; //delay produced of #10
		y= 2'b11; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		x = 2'b10; y= 2'b00; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b01; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b10; cin= 0; #10; //delay produced of #10		
		cin= 1; #10; //delay produced of #10
		y= 2'b11; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		x = 2'b11; y= 2'b00; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b01; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
		y= 2'b10; cin= 0; #10; //delay produced of #10		
		cin= 1; #10; //delay produced of #10
		y= 2'b11; cin= 0; #10; //delay produced of #10
		cin= 1; #10; //delay produced of #10
	end
endmodule





