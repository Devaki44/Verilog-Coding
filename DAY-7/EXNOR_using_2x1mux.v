//Design code
module exnor_df(
  input sel,b,
  output y);
  assign y=(sel)?b:~b;
endmodule


//Testbench
module exnor_tb();
  reg sel,b;
  wire y;
  exnor_df uut(sel,b,y);
  initial begin
    sel=1'b0;b=1'b0;#5;
    sel=1'b0;b=1'b1;#5;
    sel=1'b1;b=1'b0;#5;
    sel=1'b1;b=1'b1;#5;
    $finish;
  end
  initial begin
    $monitor("Time=%0t|sel=%b|b=%b|y=%b",$time,sel,b,y);
  end
endmodule
