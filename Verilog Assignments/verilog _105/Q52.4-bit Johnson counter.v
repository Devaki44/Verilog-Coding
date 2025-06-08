//Design code
module john_cnt(
	input clk,
	input rst,
	output [3:0]q,
	output [3:0]qbar);

	dff ins_1(clk,rst,~q[0],q[3]);
	dff ins_2(clk,rst,q[3],q[2]);
	dff ins_3(clk,rst,q[2],q[1]);
	d_ff ins_4(clk,rst,q[1],q[0]);
	
        assign qbar=~q;
endmodule

module dff(
	input clk,
	input rst,
	input d,
	output reg q);
always@(posedge clk)begin
if(rst)
	q<=1'b0;
else
	q<=d;
end
endmodule

module d_ff(
	input clk,
	input rst,
	input d,
	output reg q);
always@(posedge clk)begin
if(rst)
	q<=1'b1;
else
	q<=d;
end
endmodule



//Testbench
module john_cnt_tb;
	reg clk;
	reg rst;
	wire [3:0]q;
	wire [3:0]qbar;
john_cnt uut(clk,rst,q,qbar);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;#10;
	rst=1;#10;
	rst=0;#10;
	rst=0;#100;
	$finish;
end
initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,q=%b,qbar=%b",$time,clk,rst,q,qbar);
end
endmodule
