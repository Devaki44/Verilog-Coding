module fre_div_tb;
  reg clk;
  reg rst;
  wire out_clk;
  
  fre_div uut(clk,rst,out_clk);
  
  initial begin
    clk=0;
    forever #1 clk=~clk ;
  end
  initial begin
    rst=1;#30;
    rst=0;
    #500_000_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("time=%0t,clk=%b,rst=%b,out_clk=%b",$time,clk,rst,out_clk);
  end
endmodule
