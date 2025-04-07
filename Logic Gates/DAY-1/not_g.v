//Design code
module not_g(a,y);
  input a;
  output reg y;
  not(y,a);
endmodule

//Testbench
module not_gtb;
  wire y;
  reg a;
not_g uut(.a(a),.y(y));
  initial begin
   a=0;#5;
   a=1;#5;
  end
  initial begin
    $dumpfile("not_g.vcd");
    $dumpvars(0,not_gtb);
  end
  initial begin
    $monitor("$Time=%0t a=%b y=%b",$time,a,y);
  end
endmodule
  
