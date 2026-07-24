`timescale 1ns / 1ps
module SignExtend(
    input [1:0] m4,          
    input [31:0] instr,      
    output reg [63:0] ext_imm  
);
always @(*) begin
case (m4)
         
2'b00:ext_imm={{55{instr[20]}},instr[20:12]};
            
       
2'b01:ext_imm={{45{instr[23]}},instr[23:5]};
            
          
2'b10:ext_imm={{38{instr[25]}},instr[25:0]};
            
default: ext_imm=64'b0;

endcase

end

endmodule