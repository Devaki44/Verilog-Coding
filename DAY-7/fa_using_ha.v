//Design code
module fa(
  input a,b,cin,
  output reg sum,cout);
  wire x,y,z;
  ha ins1(.a(a),.b(b),.s(x),.c(y));
  ha ins2(.a(x),.b(cin),.s(sum),.c(z));
  assign cout=y|z;
endmodule
module ha(
  input a,b,
  output s,c);
   assign s=a^b;
   assign c=a&b;
endmodule



//Testbench
module fa_tb();
  reg a,b,cin;
  wire sum,cout;
  fa uut(a,b,cin,sum,cout);
  initial begin
    a=1'b0;b=1'b0;cin=1'b0;#5;
    a=1'b0;b=1'b0;cin=1'b1;#5;
    a=1'b0;b=1'b1;cin=1'b0;#5;
    a=1'b0;b=1'b1;cin=1'b1;#5;
    
    a=1'b1;b=1'b0;cin=1'b0;#5;
    a=1'b1;b=1'b0;cin=1'b1;#5;
    a=1'b1;b=1'b1;cin=1'b0;#5;
    a=1'b1;b=1'b1;cin=1'b1;#5;
    $finish;
  end
  initial begin
    $monitor("Time=%0t|a=%b|b=%b|cin=%b|sum=%b|cout=%b",$time,a,b,cin,sum,cout);
  end
endmodule
