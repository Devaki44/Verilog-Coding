//Design code
module dw_count(clk,rst,count);
  input wire clk,rst;
  output reg [3:0]count;
  always@(posedge clk or posedge rst)begin
    if(rst)
      count<=4'b0000;
    else  
      count<=count-1;
    
  end
endmodule


//Testbench
module dw_count_tb();
  wire [3:0]count;
  reg clk,rst;
  dw_count uut(.clk(clk),.rst(rst),.count(count));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1'b1;#5;
    rst=1'b0;#150;
    #1;$finish;
  end
  initial begin
    $dumpfile("dw_count.vcd");
    $dumpvars(1,dw_count_tb);
  end
  initial begin
    $monitor("$Time=%0t|clk=%b|rst=%b|count=%b",$time,clk,rst,count);
  end
endmodule
    
