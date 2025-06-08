//Design code
module shift_reg_pl(
	input clk,
	input rst,
	input [3:0]A,
	input load,
	input in,
	output reg [3:0]q,
	output [3:0]qbar);
always@(posedge clk)begin
if(rst)
	q<=4'b0000;
else begin
if(load)
	q<=A[3:0];
else begin
	q[3]<=in;
	q[2]<=q[3];
	q[1]<=q[2];
	q[0]<=q[1];
end
end
end
assign qbar=~q;
endmodule



//Testbench
module  testbench;
	reg clk;
	reg rst;
	reg [3:0]A;
	reg load;
	reg in;
	wire [3:0]q;
	wire [3:0]qbar;
shift_reg_pl uut(clk,rst,A,load,in,q,qbar);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
       	  rst=1;A=$random % 4;load=$random % 1;in=$random % 1;#5;
	  rst=1;A=$random % 4;load=$random % 1;in=$random % 1;#5;
	  rst=0;A=$random % 4;load=1;in=$random % 1;#30;
	  rst=0;A=$random % 4;load=0;in=$random % 1;#30;
	  $finish;
end
initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,A=%b,load=%b,in=%b,q=%b,qbar=%b",$time,clk,rst,A,load,in,q,qbar);
end
