//Design a sequential FSM to check if the number of 1’s in the given inputs
together is multiple of 4 or not. Use Moore Machine for the design.

  //Design code(mealy)
  module mul_4(
  input clk,rst,x,
  output reg y);
  
  parameter a=4'd0;
  parameter b=4'd1;
  parameter c=4'd2;
  parameter d=4'd3;
  
  reg [3:0]s,ns;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      s<=a;
    else
      s<=ns;
  end
  always@(s or x)begin
    case(s)
      a:ns=(x==1)?b:a;
      b:ns=(x==1)?c:b;
      c:ns=(x==1)?d:c;
      d:ns=(x==1)?a:d;
      default:ns=a;
    endcase
  end
  assign y=(s==a)&&(x==1)||((s==a)&&(s==0));
endmodule
    

//Testbench
module mul_4_tb;
  reg clk,rst,x;
  wire y;
  mul_4 dut(clk,rst,x,y);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;x=0;#10;
    
    rst=0;x=0;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=1;#10;
    rst=0;x=0;#10;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t,clk=%b,rst=%b,x=%b,y=%b",$time,clk,rst,x,y);
  end
endmodule
