//Design code
module cla(
	input [3:0]a,
	input [3:0]b,
	input cin,
	output [3:0]sum,
	output cout);

	fa ins_1(a[0],b[0],cin,sum[0],c[1]);
	fa ins_2(a[1],b[1],c[1],sum[1],c[2]);
	fa ins_3(a[2],b[2],c[2],sum[2],c[3]);
	fa ins_4(a[3],b[3],c[3],sum[3],cout);

	wire [3:0]p;
        wire [3:0]q;
        wire [3:1]c;
      
        assign p=a^b;
        assign q=a&b;
        
	assign c[1]=q[0]|(p[0]&cin);
        assign c[2]=q[1]|(p[1]&(q[0]|(p[0]&cin)));
        assign c[3]=q[2]|(p[2]&(q[1]|(p[1]&(q[0]|(p[0]&cin)))));
       
       assign cout=q[3]|(p[3]&c[3]);	
endmodule
module fa(
	input a,b,cin,
	output sum,carry);
	assign sum=a^b^cin;
	assign carry=(a&b)|((a^b)&cin);
endmodule



//Testbench
module cla_tb;
	reg [3:0]a;
	reg [3:0]b;
	reg cin;
	wire [3:0]sum;
	wire cout;
cla uut(a,b,cin,sum,cout);
initial begin
	repeat(5)begin
         a=$random;b=$random;cin=$random;#5;
        end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
end
endmodule
