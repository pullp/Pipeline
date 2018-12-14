`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:47:25 12/12/2018
// Design Name:   PipeLine
// Module Name:   E:/OneDrive - stu.hit.edu.cn/codes/verilog/PipeLine/PipeLineTest.v
// Project Name:  PipeLine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PipeLine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PipeLineTest;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] g_instr;
	wire [31:0] g_wb_data;
	wire [4:0] g_rwd;
	wire [31:0] g_pc;

	// Instantiate the Unit Under Test (UUT)
	PipeLine uut (
		.clk(clk), 
		.g_pc(g_pc), 
		.g_instr(g_instr), 
		.g_wb_data(g_wb_data), 
		.g_rwd(g_rwd)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
	end
	
	always 
		#20 clk=~clk;
      
endmodule

