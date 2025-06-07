//Design code
module dff_syn(
	input clk,
	input rst,
	input d,
	output reg q,
	output qbar);
always@(posedge clk)begin
if(rst)
	q<=1'b0;
else
	q<=d;
end
assign qbar=~q;
endmodule


//Testbench
module dff_sync_tb;
	reg clk;
	reg rst;
	reg d;
	wire q;
	wire qbar;
dff_syn uut(clk,rst,d,q,qbar);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	repeat(5)begin
       	  rst=1;d=$random;#10;
	end
  repeat(5)begin
       	  rst=0;d=$random;#10;
	  $finish;
	end

end
initial begin
	$dumpfile("dff_sync.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,d=%b,q=%b,qbar=%b",$time,clk,rst,d,q,qbar);
end
endmodule
