//Design code
module pipo(a,clk,rst,q,q_bar);
  input wire [3:0]a;
  input wire clk,rst;
  output reg [3:0]q;
  output wire [3:0]q_bar;
  always@(posedge clk or posedge rst)begin
   if(rst)
      q<=1'b0;
   else
      q<=a;
  end
  assign q_bar=~q;
endmodule


//Testbench
module pipo_tb();
  reg [3:0]a;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0]q_bar;
  pipo uut(.a(a),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=0;a=4'b0000;#5;
    rst=0;a=4'b0001;#5;
    rst=0;a=4'b0010;#5;
    rst=0;a=4'b0011;#5;
    rst=0;a=4'b0100;#5;
    rst=0;a=4'b0101;#5;
    rst=0;a=4'b0110;#5;
    rst=0;a=4'b0111;#5;
    
    rst=0;a=4'b1001;#5;
    rst=0;a=4'b1000;#5;
    rst=0;a=4'b1011;#5;
    rst=0;a=4'b1010;#5;
    rst=0;a=4'b1101;#5;
    rst=0;a=4'b1100;#5;
    rst=0;a=4'b1111;#5;
    rst=0;a=4'b1110;#5;
    
    rst=1;a=4'b0000;#5;
    rst=1;a=4'b0001;#5;
    rst=1;a=4'b0010;#5;
    rst=1;a=4'b0011;#5;
    rst=1;a=4'b0100;#5;
    rst=1;a=4'b0101;#5;
    rst=1;a=4'b0110;#5;
    rst=1;a=4'b0111;#5;
   
    rst=1;a=4'b1001;#5;
    rst=1;a=4'b1000;#5;
    rst=1;a=4'b1011;#5;
    rst=1;a=4'b1010;#5;
    rst=1;a=4'b1101;#5;
    rst=1;a=4'b1100;#5;
    rst=1;a=4'b1111;#5;
    rst=1;a=4'b1110;#5;
    $finish;
  end
  initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(1,pipo_tb);
  end
  initial begin
$monitor("Time=%0t|a=%b|rst=%b|clk=%b|q=%b|q_bar=%b",$time,a,rst,clk,q,q_bar);
  end
endmodule
    

