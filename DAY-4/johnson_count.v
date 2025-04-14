//Design code
module johnson_count(rst,clk,q,q_bar);
  input wire rst,clk;
  output reg [3:0]q;
  output wire [3:0]q_bar;
  always@(posedge clk)begin
    if(rst)
      q<=4'b0000;
    else begin
      q[3]<=~q[0];
      q[2]<=q[3];
      q[1]<=q[2];
      q[0]<=q[1];
    end
  end
  assign q_bar=~q;
endmodule


//Testbench
module johnson_count_tb();
  wire [3:0]q,q_bar;
  reg rst,clk;
  johnson_count uut(.rst(rst),.clk(clk),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1'b1;#5;
    rst=1'b0;#95;
    #1;$finish;
  end
  initial begin
    $dumpfile("johnson_count.vcd");
    $dumpvars(1,johnson_count_tb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|q=%b|q_bar=%b",$time,rst,clk,q,q_bar);
  end
endmodule
