//Write an RTL code to generate 60% duty cycle clock

//Design code
module duty_60(
  input clk,rst,
  output reg out_clk);
  
  parameter ON_TIME=6;
  parameter OFF_TIME=4;
  parameter TOT_TIME=ON_TIME+OFF_TIME;
  reg [3:0]count;
  
   initial begin
    count = 0;
    out_clk = 0;
   end
  
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      count<=0;
      out_clk<=0;
    end
    else begin
      if(count < TOT_TIME-1)//count
        count <= count+1;
      else
        count <= 0;
      
      if(count < ON_TIME)//out_clk
        out_clk <= 1;
      else
        out_clk <=0;
    end
  end
endmodule
      


//Testbench
module duey_60_tb;
  reg clk,rst;
  wire out_clk;
  duty_60 dut(clk,rst,out_clk);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;#10;
    rst=0;#100;
    $finish;
  end
  initial begin
    $dumpfile("duty_60.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("$Time=%0t,clk=%b,rst=%b,out_clk=%b",$time,clk,rst,out_clk);
  end
endmodule
    
