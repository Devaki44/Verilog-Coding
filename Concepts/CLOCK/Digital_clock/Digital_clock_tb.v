module digital_clk_tb;
  reg clk;
  reg rst;
  wire [5:0]seconds;
  wire [5:0]minutes;
  wire [4:0]hours;

  digital_clk uut(clk,rst,seconds,minutes,hours);

  initial begin
    clk = 0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;#10;
    rst=0;#50000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("time=%0t,clk=%b,rst=%b,seconds=%d,minutes=%d,hours=%d",$time,clk,rst,seconds,minutes,hours);
  end
endmodule
