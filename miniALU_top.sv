module miniALU_top (
	input [3:0] op1, 
	input [3:0] op2, 
	input operation, 
	input sign, 
	output [7:0] outputBits [0:5]
);

	logic [19:0] result;
	
	always_comb begin 
		case ({operation, sign})
			2'b00: result = op1 + op2;
			2'b01: result = op1 - op2;
			2'b10: result = op1 <<< op2;
			2'b11: result = op1 >>> op2; 
			default: result = 20'b0;
		endcase
	end
	
	displayEncoder(result, outputBits);
		
endmodule


