//Design code
module nand_d(a,b,y);
  input wire a,b;
  output reg y;
  assign y=~(a&b);
endmodule

//Testbench
module nand_dtb;
  reg a,b;
  wire y;
  nand_d uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("nand_d.vcd");
    $dumpvars(1,nand_dtb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule
