//Design code
module mux_2x1(
  input a,b,
  input sel,
  output reg y);
  always@(*)begin
   y=(sel==0)?a:b;
  end
endmodule


//Testbench
module mux_2x1_tb;
  reg a,b;
  reg sel;
  wire y;
  
  mux_2x1 uut(a,b,sel,y);
  
  initial begin
    a=0;b=0;sel=0;#5;
    a=0;b=1;sel=1;#5;
    a=1;b=0;sel=0;#5;
    a=1;b=1;sel=1;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,sel=%b,y=%b",$time,a,b,sel,y);
  end
endmodule
