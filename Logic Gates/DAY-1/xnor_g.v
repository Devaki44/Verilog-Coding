//Design code
module xnor_g(a,b,y);
  input wire a,b;
  output reg y;
  xnor(y,a,b);
endmodule

//Testbench
module xnor_gtb;
  reg b,a;
  wire y;
  xnor_g uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("xnor_g.vcd");
    $dumpvars(1,xnor_gtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
