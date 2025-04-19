//Design code
module d_ff(d,clk,reset,q);
  input clk,reset,d;
  output reg q;
  always @(posedge clk )
    begin
    if (reset)
      q<=0;
    else 
      q<=d;
    end 
endmodule
  

module siso_shift(clk,reset,din ,dout);
  input clk,reset,din;
  output dout;
  wire q0,q1,q2,q3;
  
  d_ff f0(.d(din),.clk(clk),.reset(reset),.q(q0));
  d_ff f1(.d(q0),.clk(clk),.reset(reset),.q(q1));
  d_ff f2(.d(q1),.clk(clk),.reset(reset),.q(q2));
  d_ff f3(.d(q2),.clk(clk),.reset(reset),.q(q3));
  assign dout=q3;
endmodule


//Testbench
module siso_shift_tb;
  reg clk,reset,din;
  wire dout;
  siso_shift uut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  initial begin 
    clk =0;
    forever #5 clk =~clk;
  end
  initial begin
    $dumpfile("siso_shift.vcd");
    $dumpvars(0,siso_shift_tb);
  end
  initial begin
     reset=1; din=0;#10;
              din=1;#10;
              din=1;#10;
              din=1;#10;
     reset=0; din=1;#10;
              din=0;#10;
              din=1;#10;
              din=0;#50;
     $finish;
  end 
  initial begin
    $monitor("Time=%0t|din=%b|clk=%b|reset=%b|dout=%b",$time,din,clk,reset,dout);
  end
endmodule
