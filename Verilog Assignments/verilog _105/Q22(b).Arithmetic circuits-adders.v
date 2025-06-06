//Design code
module adder(
	input [3:0]a,b,
	output [3:0]out,
	output cout,
	output overflow);
        assign {cout,out}=a+b;
 	assign overflow=((a[3] && b[3]) || (a[3] == 1 && b[3] == 0 && out[3] == 0));
endmodule



//Testbench
module adder_tb;
	reg [3:0]a,b;
	wire [3:0]out;
	wire carry;
	wire overflow;
adder uut(a,b,out,carry,overflow);
initial begin
	repeat(5)begin
         a=$random;b=$random;#5;
 	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,out=%b,carry=%b,overflow=%b",$time,a,b,out,carry,overflow);
end
endmodule
