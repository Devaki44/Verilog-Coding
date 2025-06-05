//Design code
module cla_gen(
	input [3:0]a,b,
	input cin,
	output cout);

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

//Testbench
module cla_gen_tb;
	reg [3:0]a,b;
	reg cin;
	wire cout;
cla_gen uut(a,b,cin,cout);
initial begin
  repeat(5)begin
    a=$random;b=$random;cin=$random;#5;
  end
end
initial begin
  $monitor("$time=%0t,a=%0b,b=%0b,cin=%0b,cout=%0b",$time,a,b,cin,cout);
end
endmodule
