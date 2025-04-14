//Design code
module ring_count(rst,clk,q,q_bar);
  input wire rst,clk;
  output reg [3:0]q;
  output wire [3:0]q_bar;
  always@(posedge clk or posedge rst)begin
    if(rst)
      q<=4'b0001;
    else begin
      q[0]<=q[3];
      q[1]<=q[0];
      q[2]<=q[1];
      q[3]<=q[2];
    end
  end
  assign q_bar=~q;
endmodule


//Testbench
module ring_count_tb();
  wire [3:0]q,q_bar;
  reg rst,clk;
  ring_count uut(.rst(rst),.clk(clk),.q(q),.q_bar(q_bar));
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
    $dumpfile("ring_count.vcd");
    $dumpvars(1,ring_count_tb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|clk=%b|q=%b|q_bar=%b",$time,rst,clk,q,q_bar);
  end
endmodule
