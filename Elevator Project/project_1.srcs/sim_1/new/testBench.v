`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2018 02:08:45 PM
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


module testBench()

	logic [1:0] a, b;
	logic c;
	logic [1:0] sum;
	logic carry;

	//create a dut-device under test for test bench
	two_bit_adder dut(a, b, c, sum, carry);
	
	initial begin
		#100;
		a = 2'b00; b = 2'b00; c = 0; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 0) $display("a = 2'b00, b = 2'b00, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 0) $display("a = 2'b00, b = 2'b00, c = 1 failed");

		b = 2'b01; c = 0; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 0) $display("a = 2'b00, b = 2'b01, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 0) $display("a = 2'b00, b = 2'b01, c = 1 failed");

		b = 2'b10; c = 0; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 0) $display("a = 2'b00, b = 2'b10, c = 0 failed");
		
		c = 1; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b00, b = 2'b10, c = 1 failed");

		b = 2'b11; c = 0; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b00, b = 2'b11, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b00, b = 2'b11, c = 1 failed");

		a = 2'b01; b = 2'b00; c = 0; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 0) $display("a = 2'b01, b = 2'b00, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 0) $display("a = 2'b01, b = 2'b00, c = 1 failed");

		b = 2'b01; c = 0; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 0) $display("a = 2'b01, b = 2'b01, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b01, b = 2'b01, c = 1 failed");

		b = 2'b10; c = 0; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b01, b = 2'b10, c = 0 failed");
		
		c = 1; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b01, b = 2'b10, c = 1 failed");

		b = 2'b11; c = 0; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b01, b = 2'b11, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 1) $display("a = 2'b01, b = 2'b11, c = 1 failed");

		a = 2'b10; b = 2'b00; c = 0; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 0) $display("a = 2'b10, b = 2'b00, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b10, b = 2'b00, c = 1 failed");

		b = 2'b01; c = 0; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b10, b = 2'b01, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b10, b = 2'b01, c = 1 failed");

		b = 2'b10; c = 0; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b10, b = 2'b10, c = 0 failed");
		
		c = 1; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 1) $display("a = 2'b10, b = 2'b10, c = 1 failed");

		b = 2'b11; c = 0; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 1) $display("a = 2'b10, b = 2'b11, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 1) $display("a = 2'b10, b = 2'b11, c = 1 failed");

		a = 2'b11; b = 2'b00; c = 0; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 0) $display("a = 2'b11, b = 2'b00, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b11, b = 2'b00, c = 1 failed");

		b = 2'b01; c = 0; #10; //delay produced of #10
		if (sum !== 2'b00 & carry !== 1) $display("a = 2'b11, b = 2'b01, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 1) $display("a = 2'b11, b = 2'b01, c = 1 failed");

		b = 2'b10; c = 0; #10; //delay produced of #10
		if (sum !== 2'b01 & carry !== 1) $display("a = 2'b11, b = 2'b10, c = 0 failed");
		
		c = 1; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 1) $display("a = 2'b11, b = 2'b10, c = 1 failed");

		b = 2'b11; c = 0; #10; //delay produced of #10
		if (sum !== 2'b10 & carry !== 1) $display("a = 2'b11, b = 2'b11, c = 0 failed");

		c = 1; #10; //delay produced of #10
		if (sum !== 2'b11 & carry !== 1) $display("a = 2'b11, b = 2'b11, c = 1 failed");
	end

    );
endmodule
