//Design code
module down_cnt(
	input clk,rst,	
	output reg[3:0]count);
always@(posedge clk)begin
if(rst)
	count<=4'b0000;
else
	count<=count-1'b1;
end
endmodule



//Testbench
module down_cnt_tb;
	reg clk,rst;
	wire [3:0]count;
down_cnt uut(clk,rst,count);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;#10;
	rst=0;#100;
	$finish;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,count=%b",$time,clk,rst,count);
end
endmodule
