`timescale 1ns / 1ps
module DataMem(
    input clk,
    input DREn,             
    input DWEn,             
    input [63:0] addr,      
    input [63:0] write_data,
    output reg [63:0] read_data 
);

reg [63:0] ram [0:1023];

integer i;

initial begin
    for(i=0;i<1024;i=i+1)
  
    ram[i]=64'd0;
end

always @(*) begin
    if(DREn) begin
            
    if(addr[11:2]<1024)
    
    read_data=ram[addr[11:2]];   

else

    read_data=64'b0;
        
end else begin

    read_data=64'b0;
end
end

   
always @(posedge clk) begin

    if(DWEn&&(addr[11:2]<1024)) begin
    ram[addr[11:2]]<=write_data;  
end
end
endmodule