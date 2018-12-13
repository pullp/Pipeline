`timescale 1ns / 1ps
`include "def.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:40 11/21/2018 
// Design Name: 
// Module Name:    RegFiles 
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
module RegFiles(
    input CLK,
    input [9:0] rs_rt,
    input [4:0] rwd,
    output [31:0] val_rs,
    output [31:0] val_rt,
    input [31:0] wb_data
    );
	reg [31:0] regs[31:0];
	
	reg [31:0] rs_reg;
	reg [31:0] rt_reg;
	assign val_rs = rs_reg;
	assign val_rt = rt_reg;
	
	always@(*)
		begin
			rs_reg <= regs[rs_rt[9:5]];
			rt_reg <= regs[rs_rt[4:0]];
		end
	
	always@(negedge CLK)
	begin
		//reg[0] should always be 0
		if(rwd != 0)
			regs[rwd] <= wb_data;
	end
	
    initial
        begin
regs[0] <= 32'd0;
regs[1] <= 32'd1;
regs[2] <= 32'd2;
regs[3] <= 32'd3;
regs[4] <= 32'd4;
regs[5] <= 32'd5;
regs[6] <= 32'd6;
regs[7] <= 32'd7;
regs[8] <= 32'd8;
regs[9] <= 32'd9;
regs[10] <= 32'd10;
regs[11] <= 32'd11;
regs[12] <= 32'd12;
regs[13] <= 32'd13;
regs[14] <= 32'd14;
regs[15] <= 32'd15;
regs[16] <= 32'd16;
regs[17] <= 32'd17;
regs[18] <= 32'd18;
regs[19] <= 32'd19;
regs[20] <= 32'd20;
regs[21] <= 32'd21;
regs[22] <= 32'd22;
regs[23] <= 32'd23;
regs[24] <= 32'd24;
regs[25] <= 32'd25;
regs[26] <= 32'd26;
regs[27] <= 32'd27;
regs[28] <= 32'd28;
regs[29] <= 32'd29;
regs[30] <= 32'd30;
regs[31] <= 32'd31;
        end
endmodule
