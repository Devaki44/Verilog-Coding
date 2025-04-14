//Design code
module d_ff(d,clk,rst,q,q_bar);
  input wire d,clk,rst;
  output reg q;
  output wire q_bar;
  always@(posedge clk)begin
    if(rst)
      q<=1'b0;
    else
      q<=d;
  end
  assign q_bar=~q;
endmodule
module syn_up_down_count (up_down,clk,rst,q,q_bar,count);
  input wire up_down;
  input wire clk,rst;
  output wire [3:0]q,q_bar;
  output wire [3:0]d,count;
  assign d=up_down?(q+1):(q-1);
  d_ff f1(.d(d[0]),.clk(clk),.rst(rst),.q(q[0]),.q_bar());
  d_ff f2(.d(d[1]),.clk(clk),.rst(rst),.q(q[1]),.q_bar());
  d_ff f3(.d(d[2]),.clk(clk),.rst(rst),.q(q[2]),.q_bar());
  d_ff f4(.d(d[3]),.clk(clk),.rst(rst),.q(q[3]),.q_bar());
  assign q_bar=~q;
  assign count=q;
endmodule


//Testbench
module syn_up_down_count_tb();
  reg up_down,clk,rst;
  wire [3:0]q;
  wire [3:0]q_bar;
  reg [3:0]count;
  syn_up_down_count uut(.up_down(up_down),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar),.count(count));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    up_down=1'b0;rst=1'b1;#50;
                 rst=1'b0;#200;
    #1;$finish;
  end
  initial begin
    $dumpfile("syn_up_down_count.vcd");
    $dumpvars(1,syn_up_down_count_tb);
  end
  initial begin
    $monitor("Time=%0t|up_down=%b|clk=%b|rst=%b|q=%b|q_bar=%b|count=%b",$time,up_down,clk,rst,q,q_bar,count);
  end
endmodule
