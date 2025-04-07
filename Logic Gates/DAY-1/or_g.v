//Design code
module or_g(a,b,y);
  input a,b;
  output y;
  or(y,a,b);
endmodule

//Testbench
module or_gtb;
  reg a,b;
  wire y;
  or_g uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("or_g.vcd");
    $dumpvars(1,or_gtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
