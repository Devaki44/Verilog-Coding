//Design code
module dw_count(ctr,clk,rst,count);
  input wire ctr,clk,rst;
  output reg [3:0]count;
  always@(posedge clk or posedge rst or ctr)begin
    if(rst)
      count<=4'b0000;
    else begin
      if(ctr)
        count<=count+1;
      else
        count<=count-1;
    end
  end
endmodule


//Testbench
module dw_count_tb();
  wire [3:0]count;
  reg ctr,clk,rst;
  dw_count uut(.ctr(ctr),.clk(clk),.rst(rst),.count(count));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    ctr=1'b0;#5;
    rst=1'b1;#5;
    rst=1'b0;#50;
    #1;$finish;
  end
  initial begin
    $dumpfile("dw_count.vcd");
    $dumpvars(1,dw_count_tb);
  end
  initial begin
    $monitor("$Time=%0t|ctr=%b|clk=%b|rst=%b|count=%b",$time,ctr,clk,rst,count);
  end
endmodule
    
