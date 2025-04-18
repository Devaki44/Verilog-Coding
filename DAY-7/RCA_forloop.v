//Design code
module RCA(
  input [3:0]a,b,
  input cin,
  output [3:0]sum,
  output cout);
  wire c1,c2,c3;
  fa f1(a[0],b[0],cin,sum[0],c1);
  fa f2(a[1],b[1],c1,sum[1],c2);
  fa f3(a[2],b[2],c2,sum[2],c3);
  fa f4(a[3],b[3],c3,sum[3],cout);
endmodule
module fa(
  input a,b,cin,
  output s,cout);
  assign s=a^b^cin;
  assign cout=((a&b)|(cin&(a^b)));
endmodule


//Testbench
module RCA_tb();
   reg [3:0]a,b;
   reg cin;
   wire [3:0]sum;
   wire cout;
  RCA uut(a,b,cin,sum,cout);
  initial begin
    cin=1'b0;
  end
  initial begin 
    integer i,j;
    for(i=0;i<16;i=i+1)begin
      for(j=0;j<16;j=j+1)begin
         a=i;
         b=j;#10;
      end
    end
   $finish;
  end
  initial begin
    $monitor("$Time=%0t|a=%b|b=%b|cin=%b|sum=%b|cout=%b",$time,a,b,cin,sum,cout);
  end
endmodule
    
