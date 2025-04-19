//Design code
module tff(
  input t,clk,rst,
  output reg q);
  always@(posedge clk)begin
    if(rst)
      q<=1'b0;
    else
      case(t)
        1'b0:q<=q;
        1'b1:q<=~q;
      endcase
  end
endmodule

//Testbench
module tff_tb();
  reg t,clk,rst;
  wire q;
  tff uut(t,clk,rst,q);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1'b1;t=1'b0;#10;
             t=1'b1;#10;
    rst=1'b0;t=1'b0;#10;
             t=1'b1;#10;
    $finish;
  end
  initial begin
    $monitor("$Time=%0t|t=%b|clk=%b|rst=%b|q=%b",$time,t,clk,rst,q);
  end
endmodule
