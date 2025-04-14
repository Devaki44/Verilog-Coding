//Design code
module SIPO(in,rst,clk,q,q_bar);
  input wire in,rst,clk;
  output reg [3:0]q;
  output wire [3:0]q_bar;
  always@(posedge clk or posedge rst)begin
    if(rst)
      q<=4'b0000;
    else begin
      q[0]<=in;
      q[1]<=q[0];
      q[2]<=q[1];
      q[3]<=q[2];
    end
  end
  assign q_bar=~q;
endmodule


//Testbench
module SIPO_tb();
  wire [3:0]q,q_bar;
  reg in,rst,clk;
  SIPO uut(.in(in),.rst(rst),.clk(clk),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1'b1;in=1'b0;#5;
    rst=1'b1;in=1'b1;#5;
    
    rst=1'b0;in=1'b0;#5;
    rst=1'b0;in=1'b1;#5;
    
    $finish;
  end
  initial begin
    $dumpfile("SIPO.vcd");
    $dumpvars(1,SIPO_tb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|in=%b|q=%b|q_bar=%b",$time,rst,clk,in,q,q_bar);
  end
endmodule
