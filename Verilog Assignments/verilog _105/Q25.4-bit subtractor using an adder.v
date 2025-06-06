//Design code
module sub_us_adder(
	input [3:0]a,b,
	output [3:0] sub,
	output borrow);
	
	wire [3:0]x,y;
        
	assign {cout,sub}=a+((~b)+1);
	assign borrow= ~cout;
endmodule


//Testbench
module sub_us_adder_tb;
	reg [3:0]a,b;
	wire [3:0]sub;
	wire borrow;
sub_us_adder uut(a,b,sub,borrow);
initial begin
	repeat(5)begin
         a=$random;b=$random;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,sub=%b,borrow=%b",$time,a,b,sub,borrow);
end
endmodule
