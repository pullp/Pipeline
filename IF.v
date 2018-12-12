`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:15 12/11/2018 
// Design Name: 
// Module Name:    IF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IF(
	input clk,
	output[31:0] instr_out,
	output reg [31:0] pc_out
    );

//	reg[31:0] pc = 0;
	
//module CodeMem(
//    input [31:0] pc,
//    output [31:0] instr
//    );
	CodeMem code_mem(.pc(pc_out), .instr(instr_out));
	
	always@(posedge clk)
		begin
		pc_out = (instr_out == `JUMP) ? 0 : pc_out+1;
		end
	//MAYBE ERROR
	
	initial
		begin
		pc_out = 0;
		end

endmodule
