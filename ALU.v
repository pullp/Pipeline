`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:50 12/12/2018 
// Design Name: 
// Module Name:    ALU 
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
module Alu(
    input [31:0] a,
    input [31:0] b,
    input [5:0] opcode,
    output [31:0] alu_out,
    output zf
    );
	 
	 reg [32:0] tmp;
	 assign alu_out = tmp[31:0];
	 reg [32:0] tag = 33'b011111111111111111111111111111111;
	 
	 reg zf_reg;
	 assign zf = zf_reg;
	 
	 always@(*)
	 begin
		case(opcode)
			`LDW: tmp = a + b;
			`SDW: tmp = a + b;
			`BEQ: tmp = a - b;
			`ADD: tmp = a + b;
			`SUB: tmp = a - b;
			`AND: tmp = a & b & tag;
			`OR:  tmp = a | b & tag;
			`XOR: tmp = a ^ b & tag;
			`SLT: tmp = a < b ? 1 : 0;
			`JUMP: tmp = a;
		default
			tmp = 0;
		endcase
		zf_reg = (tmp == 0) ? 1'b1 : 1'b0;
	 end
endmodule