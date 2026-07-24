`timescale 1ns / 1ps
module chip(
    input clk,
    input reset
);
    
    wire [63:0] pc_out,pc_next,pc_plus_4,branch_target;
    wire [31:0] instr;
    wire [63:0] read_data1,read_data2,alu_result,mem_read_data,write_back_data,ext_imm,alu_in2;
    wire m1,m2,m3,m5,RWEn,DWEn,DREn,isZero;
    wire [4:0] read2_reg_addr;
    wire [1:0] m4, ALUop;
    


SignExtend se(
 .m4(m4),
 .instr(instr), 
 .ext_imm(ext_imm)

);
    
  
assign pc_next=(m5==1'b0)?pc_plus_4:branch_target;
    
PC program_counter(
 
 .clk(clk), 
 .rst(reset), 
 .next_pc(pc_next), 
 .pc_out(pc_out)

);
    
assign pc_plus_4=pc_out+64'd4;
assign branch_target=pc_out+(ext_imm<<2);

   
InstrMem instr_mem(
        
 .addr(pc_out), 
 .inst(instr)
    
);

   
Control_Unit cu(
 
 .opcode(instr[31:21]),
 .isZero(isZero),
 .m1(m1),.m2(m2),.m3(m3),.m4(m4),.m5(m5),
 .RWEn(RWEn),.DWEn(DWEn),.DREn(DREn),
 .ALUop(ALUop)
    
);

assign read2_reg_addr=(m3==1'b0)?instr[20:16]:instr[4:0];
  
    
RegFile rf(

 .clk(clk),
 .RegWrite(RWEn),
 .read1(instr[9:5]),
 .read2(read2_reg_addr),
 .write1(instr[4:0]),
 .write_data(write_back_data),
 .data1(read_data1),
 .data2(read_data2)

);

    
   
   
    
assign alu_in2=(m1==1'b0)?read_data2:ext_imm;

    
ALU alu_unit(
        
 .data1(read_data1), 
 .data2(alu_in2), 
 .ALUop(ALUop), 
 .isZero(isZero), 
 .result(alu_result)

);

   
DataMem data_mem(
 
 .clk(clk), 
 .DREn(DREn), 
 .DWEn(DWEn), 
 .addr(alu_result), 
 .write_data(read_data2), 
 .read_data(mem_read_data)
    
);

    
  
assign write_back_data=(m2==1'b0)?alu_result:mem_read_data;

endmodule