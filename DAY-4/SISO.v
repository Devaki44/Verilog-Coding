//Design code
module siso(
	input clk,
	input rst,
	input in,
	output q,
	output qbar);
	
	wire x,y,z;

	dff ins_1(clk,rst,in,x);
	dff ins_2(clk,rst,x,y);
	dff ins_3(clk,rst,y,z);
	dff ins_4(clk,rst,z,q);	
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



//Testbench
module siso_tb;
	reg clk;
	reg rst;
	reg in;
	wire q;
	wire qbar;
siso uut(clk,rst,in,q,qbar);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;in=0;#10;
	rst=1;in=0;#10;
	rst=0;in=1;#10;
	rst=0;in=0;#10;
	rst=0;in=1;#10;
	$finish;
end
initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,in=%b,q=%b,qbar=%b",$time,clk,rst,in,q,qbar);
end
endmodule

