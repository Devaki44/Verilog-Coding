//Testbench
module blocking_tb;
  	reg rst;
  	reg [3:0]a,b;
    wire [3:0]x,y,z;
  
  blocking uut(rst,a,b,x,y,z);
  
  initial begin
    rst=1;a=3;b=5;#10;
    rst=0;a=3;b=5;#30;
    rst = 1;
    #30$finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$time=%0t,rst=%0b,a=%0d,b=%0d,x=%0d,y=%0d,z=%0d",$time,rst,a,b,x,y,z);
  end
endmodule
