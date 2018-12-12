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
	wire [31:0] instr;
	wire [31:0] imm;
	wire [31:0] val_rs;
	wire [31:0] val_rt;
	wire [31:0] alu_res;
	wire [31:0] mem_data;
	wire [31:0] wb_data;
	wire [4:0] rwd;
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	PipeLine uut (
		.clk(clk), 
		.pc(pc), 
		.instr(instr), 
		.imm(imm), 
		.val_rs(val_rs), 
		.val_rt(val_rt), 
		.alu_res(alu_res), 
		.mem_data(mem_data), 
		.wb_data(wb_data), 
		.rwd(rwd)
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

