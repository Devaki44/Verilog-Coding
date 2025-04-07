//Design code
module xor_d(a,b,y);
  input wire a,b;
  output reg y;
  assign y=a^b;
endmodule

//Testbench
module xor_dtb;
  reg a,b;
  wire y;
  xor_d uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("xor_d.vcd");
    $dumpvars(1,xor_dtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
