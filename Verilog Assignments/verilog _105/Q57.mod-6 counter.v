//Design code
module mod6_cnt(
	input clk,rst,	
	output reg[2:0]count);
always@(posedge clk)begin
if(rst)
	count<=3'b000;
else if(count==5)
	 count<=3'b000;
 else
	 count<=count+1'b1;

end
endmodule


//Testbench
module mod6_cnt_tb;
	reg clk,rst;
	wire [2:0]count;
mod6_cnt uut(clk,rst,count);
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
