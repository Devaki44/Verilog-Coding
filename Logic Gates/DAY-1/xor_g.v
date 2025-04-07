//Design code
module xor_g(a,b,y);
  input wire a,b;
  output reg y;
  xor(y,a,b);
endmodule

//Testbench
module xor_gtb;
  reg a,b;
  wire y;
  xor_g uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("xor_g.vcd");
    $dumpvars(1,xor_gtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
  
