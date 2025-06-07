//Design code
module dff_asyn(
	input clk,
	input rst,
	input d,
	output reg q,
	output qbar);
always@(posedge clk or posedge rst)begin
if(rst)
	q<=1'b0;
else
	q<=d;
end
assign qbar=~q;
endmodule



//Testbench
module dff_async_tb;
	reg clk;
	reg rst;
	reg d;
	wire q;
	wire qbar;
dff_asyn uut(clk,rst,d,q,qbar);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=0;
	forever #10 rst=~rst;
end

initial begin
	d=1;
	 forever #20 d=~d;
  end
initial begin
	#30;
	$finish;
end
initial begin
	$dumpfile("dff_async.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,d=%b,q=%b,qbar=%b",$time,clk,rst,d,q,qbar);
end
endmodule
