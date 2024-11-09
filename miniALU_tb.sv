`timescale 1ns/1ns  // Set timescale for simulation

module miniALU_tb (
	output [19:0] tb_result
);

logic [3:0] tb_op1;
logic [3:0] tb_op2;
logic tb_operation;
logic tb_sign;

task addition_operation();
	#5 tb_operation = 0;
	#5 tb_sign = 0;
endtask

task subtraction_operation();
	#5 tb_operation = 0;
	#5 tb_sign = 1;
endtask

task shiftleft_operation();
	#5 tb_operation = 1;
	#5 tb_sign = 0;
endtask

task shiftright_operation();
	#5 tb_operation = 1;
	#5 tb_sign = 1;
endtask

//task iterate();
//	for (integer i = 0; i < 16; i = i + 1 ) begin
//			for (integer j = 0; j < 16; j + j + 1 ) begin
//				op1 = i[3:0];
//				op2 = j[3:0];
//				#5;
//			end
//	end
//endtask

miniALU_top dut (
	tb_op1, tb_op2, tb_operation, tb_sign, tb_result
);

	initial begin 
		addition_operation();
		tb_op1 = 4'b0100;
		tb_op2 = 4'b0011;
		#5;
		subtraction_operation();
		tb_op1 = 4'b0100;
		tb_op2 = 4'b0011;
		#5;
		shiftleft_operation();
		tb_op1 = 4'b0100;
		tb_op2 = 4'b0011;
		#5;
		shiftright_operation();
		tb_op1 = 4'b0100;
		tb_op2 = 4'b0011;
		#5;
   end
	
endmodule