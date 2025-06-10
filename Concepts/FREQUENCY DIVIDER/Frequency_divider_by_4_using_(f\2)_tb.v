module clock_divider_tb;
  reg clk;
  reg rst;
  wire out_clk2;
  clock_div_4 uut(clk,rst,out_clk2);
  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;#10;
    rst=0;#100;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$time=%0t,clk=%b,rst=%b,out_clk2=%b",$time,clk,rst,out_clk2);
  end
endmodule
