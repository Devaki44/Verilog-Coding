//Design code
module nor_g(a,b,y);
  input wire a,b;
  output reg y;
  nor(y,a,b);
endmodule

//Testbench
module nor_gtb;
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
    $dumpfile("nor_g.vcd");
    $dumpvars(1,nor_gtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
