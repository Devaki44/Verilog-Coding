//Design code
module syn_count_4b(a,clk,rst,q,q_bar);
   input wire [3:0]a;
   input wire clk,rst;
   output reg [3:0]q;
   output wire [3:0]q_bar;
   always@(posedge clk or posedge rst)begin
    if(rst)
       q<=4'b0000;
    else
       q<=a;
   end
   assign q_bar=~q;
 endmodule


//Testbench
module syn_count_4b_tb();
  reg [3:0]a;
  reg clk,rst;
  wire [3:0]q;
  wire [3:0]q_bar;
  syn_count_4b uut(.a(a),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));
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
   
    rst=1;a=4'b1000;#5;
    rst=1;a=4'b1001;#5;
    rst=1;a=4'b1010;#5;
    rst=1;a=4'b1011;#5;
    rst=1;a=4'b1100;#5;
    rst=1;a=4'b1101;#5;
    rst=1;a=4'b1110;#5;
    rst=1;a=4'b1111;#5;
    $finish;
  end
  initial begin
    $dumpfile("syn_count_4b.vcd");
    $dumpvars(1,syn_count_4b_tb);
  end
  initial begin
$monitor("Time=%0t|a=%b|rst=%b|clk=%b|q=%b|q_bar=%b",$time,a,rst,clk,q,q_bar);
  end
endmodule
