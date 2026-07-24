`timescale 1ns / 1ps
module RegFile(
    input clk,
    input RegWrite,
    input [4:0] read1,read2,write1,
    input [63:0] write_data,
    output [63:0] data1,data2

);

reg [63:0] registers [0:31]; 
integer i;

initial begin
 for(i=0;i<32;i=i+1) 

 registers[i]=64'b0;          
 registers[0]=64'd10;  
 registers[1]=64'd20;  
 registers[2]=64'd30;  
 registers[3]=64'd40;  
   
 end

    
 assign data1=(read1==5'd31)?64'b0:registers[read1];
 assign data2=(read2==5'd31)?64'b0:registers[read2];

    
 always @(posedge clk) begin
    if(RegWrite&&(write1!=5'd31)) begin 
    registers[write1]<=write_data;
end
end   
endmodule