`timescale 1ns / 1ps
module ALU(
    input [63:0] data1, 
    input [63:0] data2,
    input [1:0] ALUop,
    output reg isZero,
    output reg [63:0] result
);

always @(*) begin

case (ALUop)
 2'b00:result=data1+data2;
 2'b01:result=data1-data2;
 2'b10:result= data1&data2;
 2'b11:result=data1|data2;
 default:result=64'b0; 
 
 endcase
        
isZero=(result==64'b0)?1'b1:1'b0;
 
 end
endmodule
