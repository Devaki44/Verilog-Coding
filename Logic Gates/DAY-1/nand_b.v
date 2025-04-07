//Design code
module nand_b(a,b,y);
  input wire a,b;
  output reg y;
  always@(*)
    begin
      if(~(a&b))
        y=1'b1;
      else
        y=1'b0;
    end
endmodule

//Testbench
module nand_btb;
  reg a,b;
  wire y;
  nand_b uut(.a(a),.b(b),.y(y));
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("nand_b.vcd");
    $dumpvars(1,nand_btb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | y=%b",$time,a,b,y);
  end
endmodule

