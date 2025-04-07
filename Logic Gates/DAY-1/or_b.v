//Design code
module or_b(a,b,y);
  input a,b;
  output reg y;
  always@(*)
    if(a|b)
      y=1'b1;
    else
      y=1'b0;
endmodule

//Testbench
module or_btb;
  reg a,b;
  wire y;
  or_b uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("or_b.vcd");
    $dumpvars(1,or_btb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
