`timescale 1ns / 1ps
module Control_Unit(
    input [10:0] opcode,
    input isZero,
    output reg m1,m2,m3,m5,
    output reg RWEn,DWEn,DREn,
    output reg [1:0] ALUop,m4
);
  
localparam ADD=11'b10001011000;
localparam SUB=11'b11001011000; 
localparam AND=11'b10001010000;
localparam ORR=11'b10101010000; 
localparam LDUR=11'b11111000010; 
localparam STUR=11'b11111000000; 
localparam CBZ=11'b10110100000;
localparam B=11'b00010100000;

always @(*) begin
 
case(opcode)

ADD: begin
m1=0; m2=0; m3=0; m4=0; m5=0;
RWEn=1; DWEn=0; DREn=0; ALUop=2'b00;

end

SUB: begin
m1=0; m2=0; m3=0; m4=0; m5=0;
RWEn=1; DWEn=0; DREn=0; ALUop=2'b01;
            
end

AND: begin
m1=0; m2=0; m3=0; m4=0; m5=0;
RWEn=1; DWEn=0; DREn=0; ALUop=2'b10;

end

ORR: begin
m1=0; m2=0; m3=0; m4=0; m5=0;
RWEn=1; DWEn=0; DREn=0; ALUop=2'b11;
       
end

LDUR: begin
m1=1; m2=1; m3=0; m4=2'b00; m5=0;
RWEn=1; DWEn=0; DREn=1; ALUop=2'b00;

end

STUR: begin
m1=1; m2=0; m3=1; m4=2'b00; m5=0;
RWEn=0; DWEn=1; DREn=0; ALUop=2'b00;

end

CBZ: begin
m1=0; m2=0; m3=1; m4=2'b01; m5=isZero;
RWEn=0; DWEn=0; DREn=0; ALUop=2'b00;

end

B: begin
m1=1; m2=0; m3=0; m4=2'b10; m5=1;
RWEn=0; DWEn=0; DREn=0; ALUop=2'b00;

end

default: begin
m1=0; m2=0; m3=0; m4=0; m5=0;
RWEn=0; DWEn=0; DREn=0; ALUop=2'b00;

end
endcase
end
endmodule
