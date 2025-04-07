//Design code
module or_d(a,b,y);
  input a,b;
  output y;
  or(y,a,b);
endmodule

//Testbench
module or_dtb;
  reg a,b;
  wire y;
  or_d uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("or_d.vcd");
    $dumpvars(1,or_dtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
