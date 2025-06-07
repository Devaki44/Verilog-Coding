//Design code
module ALU_operations(
	input [3:0]a,b,
	input [2:0]sel,
	output reg[3:0]out);

	wire [3:0]and_out;
	wire [3:0]or_out;
	wire [3:0]add_out;
	wire [3:0]sub_out;
	wire [3:0]exor_out;

        assign and_out=a&b;
	assign or_out=a|b;
	assign add_out=a+b;
	assign sub_out=a-b;
	assign exor_out=a^b;


always@(*)begin
  out=4'b0000;
  case(sel)
	3'b000:out=and_out;
	3'b001:out=or_out;
	3'b010:out=add_out;
	3'b011:out=sub_out;
	3'b100:out=exor_out;

  endcase
end
endmodule


//Testbench
module ALU_operations_tb;
	reg [3:0]a,b;
	reg [2:0]sel;
	wire [3:0]out;
ALU_operations uut(a,b,sel,out);
initial begin
	repeat(5) begin
	 a=$random;b=$random;sel=$random;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,sel=%b,out=%b",$time,a,b,sel,out);
end
endmodule
