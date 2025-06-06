//Design code
module multiplier(	
	input [3:0]a,b,
	output [7:0]out);
	assign out=a*b;
endmodule


//Testbench
module multiplier_tb;
	reg [3:0]a,b;
	wire [7:0]out;
multiplier uut(a,b,out);
initial begin
	repeat(5)begin
	 a=$random;b=$random;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,out=%b",$time,a,b,out);
end
endmodule
