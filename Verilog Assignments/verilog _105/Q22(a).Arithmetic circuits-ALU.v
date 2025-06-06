//Desiign code
 module ALU(
	input [3:0]a,b,
	input [1:0]sel,
	output reg[3:0]out);

	wire [3:0]and_out;
	wire [3:0]or_out;
	wire [3:0]add_out;
	wire [3:0]mul_out;

        assign and_out=a&b;
	assign or_out=a|b;
	assign add_out=a+b;
	assign mul_out=a*b;

always@(*)begin
  out=4'b0000;
  case(sel)
	2'b00:out=and_out;
	2'b01:out=or_out;
	2'b10:out=add_out;
	2'b11:out=mul_out;
  endcase
end
endmodule


//Testbench
module ALU_tb;
	reg [3:0]a,b;
	reg [1:0]sel;
	wire [3:0]out;
ALU uut(a,b,sel,out);
initial begin
	repeat(5) begin
	 a=$random;b=$random;sel=$random;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,sel=%b,out=%b",$time,a,b,sel,out);
end
endmodule
