`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:09 12/12/2018 
// Design Name: 
// Module Name:    ImmExtend 
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
module ImmExtend(
    input [15:0] instr,
	 output [31:0] out
    );
	 
	 assign out = (instr[15] == 1'b1) ? {16'b1111_1111_1111_1111, instr[15:0]}:
						{16'b0000_0000_0000_0000, instr[15:0]};
//	 if(instr[16] == 1'b1)
//		assign out = {16'b1111_1111_1111_1111, instr[16:31]};
//	 else
//		assign out = {16'b0000_0000_0000_0000, instr[16:31]};


endmodule
