//Design code
module seq_dff(
  input clk,
  input x1,x2,x3,
  output reg g,f);
  wire a,b;
  dff ins1(.clk(clk),.d(a),.q(g));
  dff ins2(.clk(clk),.d(b),.q(f));
  assign a= x3|f;
  assign b= x1&x2;
endmodule  

module dff(
  input clk,
  input d,
  output reg q);
  always@(posedge clk)begin
    q<=d;
  end
endmodule



/Testbench
module seq_dff_tb();
  reg clk;
  reg x1,x2,x3;
  wire g,f;
  seq_dff uut (.clk(clk),.x1(x1),.x2(x2),.x3(x3),.g(g),.f(f));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    x1=0;x2=0;x3=0;#10;
    x1=0;x2=0;x3=1;#10;
    x1=0;x2=1;x3=0;#10;
    x1=0;x2=1;x3=1;#10;
       
    x1=1;x2=0;x3=0;#10;
    x1=1;x2=0;x3=1;#10;
    x1=1;x2=1;x3=0;#10;
    x1=1;x2=1;x3=1;#10;
    $finish;
  end
  initial begin 
    $monitor("$Time=%0t|clk=%b|x1=%b|x2=%b|x3=%b|g=%b|f=%b",$time,clk,x1,x2,x3,g,f);
  end
endmodule
