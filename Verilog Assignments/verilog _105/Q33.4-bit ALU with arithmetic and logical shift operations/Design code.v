module ALU_operations(
	input [3:0]a,
	input [1:0]sel,
	input [1:0]shift_amt,
	output reg [3:0]out);

    wire [3:0]arithmetic_left_shift;
	wire [3:0]arithmetic_right_shift;
	wire [3:0]logical_left_shift;
	wire [3:0]logical_right_shift;
	
    assign arithmetic_left_shift =(a<<<shift_amt);
	assign arithmetic_right_shift=(a>>>shift_amt);
	assign logical_left_shift    =(a<<shift_amt);
	assign logical_right_shift  =(a>>shift_amt);


always@(*)begin
  //out=4'b0000;
  case(sel)
	2'b00:out=arithmetic_left_shift;
	2'b01:out=arithmetic_right_shift;
	2'b10:out=logical_left_shift;
	2'b11:out=logical_right_shift;
  endcase
end
endmodule
