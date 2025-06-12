module fsm_tb;
  reg clk,rst,x;
  wire y;
  
  fsm uut(clk,rst,x,y);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;x=0;#20;
    rst=0;x=1;#40;
    rst=0;x=0;#10;
    rst=0;x=1;#30;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,clk=%b,rst=%b,x=%b,y=%b",$time,clk,rst,x,y);
  end
endmodule
