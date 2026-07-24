`timescale 1ns / 1ps
module InstrMem(
   input [63:0] addr,
   output reg [31:0] inst
);
   reg [31:0] memory [0:1023];
   integer i;
    
initial begin
       
for(i=0;i<1024;i=i+1)
   
   memory[i]=32'b0;
   memory[0]=32'h8B000001;
   memory[1]=32'hCB000002; 
   memory[2]=32'h8A020003; 
   memory[3]=32'hAA030004; 
   memory[4]=32'hF8400142; 
   memory[5]=32'hF8000144;    
   memory[6]=32'hB4000041; 
   memory[7]=32'h14000003; 
 
 end
 always @(*) begin
   if(addr[11:2]<1024)
   inst=memory[addr[11:2]];
else
   inst=32'b0;
end
endmodule