`timescale 1ns / 1ps

module tb_chip();
    reg clk;
    reg reset;
 
chip uut(
 
 .clk(clk),
 .reset(reset)

);

initial clk=0;
always #5 clk = ~clk;
    
initial begin
        
clk=0;
reset=1; 
      
#10;
reset=0;

#65;
 
$finish;

end

endmodule