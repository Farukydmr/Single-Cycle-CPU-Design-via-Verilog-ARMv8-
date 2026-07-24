`timescale 1ns / 1ps

module PC(
    input clk,
    input rst,
    input [63:0] next_pc,
    output reg [63:0] pc_out
);
    always @(posedge clk or posedge rst) begin
        if(rst) 
    pc_out<=64'b0;
        else 
    pc_out<= next_pc;
    end
endmodule
