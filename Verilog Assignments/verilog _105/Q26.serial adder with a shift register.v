//Design code
module serial_adder(
 	input clk,
 	input rst,
	input [3:0]a,b,
	input [3:0]shift,
	output reg[3:0]sum,
	output reg carry);
reg [3:0] a_reg,b_reg;
always@(posedge clk)begin
    if(rst)begin
	sum<=4'b0000;
	carry<=1'b0;
	a_reg<=4'b0000;
	b_reg<=4'b0000;
  end
  else begin
	a_reg <= a>>shift;
	b_reg <= b>>shift;

	{carry,sum}<=a_reg+b_reg;
  end
end
endmodule



//Testbench
module serial_add_tb;
	reg clk;
	reg rst;
	reg [3:0]a,b;
	reg [3:0]shift;
	wire [3:0]sum;
	wire carry;
serial_adder uut(clk,rst,a,b,shift,sum,carry);
initial begin
	clk=1'b0;
	forever #5 clk=~clk;
end 
initial begin
	repeat(5)begin
	  rst=1'b1;a=$random;b=$random;shift=$random;#10;
	end
	repeat(5)begin
	  rst=1'b0;a=$random;b=$random;shift=4'b0001;#10;
	end
	$finish;
end
initial begin
  	$monitor("$time=%0t,clk=%b,rst=%b,a=%b,b=%b,shift=%b,sum=%b,carry=%b",$time,clk,rst,a,b,shift,sum,carry);
end
endmodule
