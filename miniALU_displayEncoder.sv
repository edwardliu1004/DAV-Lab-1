module displayEncoder(
	// TODO: define your input and output ports
	input [19:0] result, 
	output [7:0] displayBits [0:5]
);
	// TODO: create signals for the six 4-bit digits
	logic [3:0] digits[0:5];
	logic[19:0] temp_result;
	// TODO: Instantiate six copies of sevenSegDigit, one for each digit (calculated below) 
//	for (integer i = 0; i < 6; i = i + 1) begin
//		sevenSegDigit(digits[i], displayBits[i]);
//	end
	
	// The following block contains the logic of your combinational circuit
	always_comb begin
		// TODO: Convert a 20-bit input result to six individual digits (4 bits each) 
		temp_result = result;
		
        digits[0] = temp_result % 10;        
        temp_result = temp_result / 10;     

        digits[1] = temp_result % 10;       
        temp_result = temp_result / 10;

        digits[2] = temp_result % 10;       
        temp_result = temp_result / 10;

        digits[3] = temp_result % 10;        
        temp_result = temp_result / 10;

        digits[4] = temp_result % 10;        
        temp_result = temp_result / 10;

        digits[5] = temp_result % 10;
	end
	
	genvar i;
	generate
		for (i = 0; i < 6; i = i + 1) begin : display_instance
			sevenSegDigit(digits[i], displayBits[i]);
		end
	endgenerate

endmodule