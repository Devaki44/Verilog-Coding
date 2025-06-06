//Design code
module divider(
	input [3:0]a,b,
	output [3:0]quotient,remainder);
	assign quotient=a/b; 
	assign remainder=a%b;
endmodule


//Testbench
module divider_tb;
	reg [3:0]a,b;
 	wire [3:0]quotient,remainder;
divider uut(a,b,quotient,remainder);
initial begin
	repeat(5) begin
	 a=$random;b=$random;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,quotient=%b,remainder=%b",$time,a,b,quotient,remainder);
end
endmodule
