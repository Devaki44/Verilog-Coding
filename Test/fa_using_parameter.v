module fa (
  input [WIDTH:0]a,b,
  input cin,
  output [WIDTH:0]sum,
  output cout);
  
  parameter WIDTH=4'b1000;
  
  assign {cout,sum}=a+b+cin;
endmodule
