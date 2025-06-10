//Design code
module clock_div_4(
  input clk,
  input rst,
  output reg out_clk2);
  
  reg out_clk1;
   reg w1;
  initial 
    w1 = 1;
  always@(posedge clk)begin
    
    if(rst)begin
      out_clk1 <= 1'b0;
      out_clk2 <= 1'b0;
    end
    else begin  
      out_clk1 <= ~out_clk1;
      if(out_clk1)
      out_clk2 <= ~out_clk2;
    end
  end
  
endmodule


//Testbench
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
