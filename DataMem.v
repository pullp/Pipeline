`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:41 11/21/2018 
// Design Name: 
// Module Name:    DataMem 
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
module DataMem(
    input CLK,
    input [31:0] addr,
    input [31:0] data,
    input [5:0] opcode,
    output [31:0] out
    );
	 reg [31:0] data_mem[255:0];
	 
	 reg [31:0] read_data;
	 assign out = read_data;
	 integer i;
	 
	 always@(*)
	  begin
			read_data <= data_mem[addr];
		end
		
	 always@(negedge CLK)
	  begin
	   if(opcode == `SDW)
			begin
			data_mem[addr] <= data;
			end
	  end

	  initial
			begin
			data_mem[0] <= 32'd0;
			data_mem[1] <= 32'd1;
			data_mem[2] <= 32'd2;
			data_mem[3] <= 32'd3;
			data_mem[4] <= 32'd4;
			data_mem[5] <= 32'd5;
			data_mem[6] <= 32'd6;
			data_mem[7] <= 32'd7;
			data_mem[8] <= 32'd8;
			data_mem[9] <= 32'd9;
			data_mem[10] <= 32'd10;
			data_mem[11] <= 32'd11;
			data_mem[12] <= 32'd12;
			data_mem[13] <= 32'd13;
			data_mem[14] <= 32'd14;
			data_mem[15] <= 32'd15;
			data_mem[16] <= 32'd16;
			data_mem[17] <= 32'd17;
			data_mem[18] <= 32'd18;
			data_mem[19] <= 32'd19;
			data_mem[20] <= 32'd20;
			end
endmodule
