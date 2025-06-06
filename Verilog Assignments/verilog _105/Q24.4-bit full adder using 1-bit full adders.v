//Design code
module fa_4b_1b(
	input [3:0]a,b,
	input cin,
	output [3:0]sum,
	output cout);
        
	wire [3:0]c;
	fa ins1(a[0],b[0],cin,sum[0],c[0]);
	fa ins2(a[1],b[1],c[0],sum[1],c[1]);
	fa ins3(a[2],b[2],c[1],sum[2],c[2]);
	fa ins4(a[3],b[3],c[2],sum[3],cout);
endmodule
module fa(
	input a,b,cin,
	output sum,carry);
	assign sum=a^b^cin;
	assign carry=(a&b)|((a^b)&cin);
endmodule


//Testbench
module fa_4b_1b_tb;
	reg [3:0]a,b;
	reg cin;
	wire [3:0]sum;
	wire cout;
fa_4b_1b uut(a,b,cin,sum,cout);	
initial begin
	repeat(5)begin
          a=$random;b=$random;cin=$random;#5;
	end
end
initial begin
	$monitor("$time=%t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
end
endmodule
