//Design code
module d_latch(
	input en,d,
	output reg q,
	output qbar);
always@(*)begin
if(en)
	q=d;
else
	q=q;
end
assign qbar=~q;
endmodule


//Testbench
module d_latch_tb;
	reg en,d;
	wire q,qbar;
d_latch uut(en,d,q,qbar);
initial begin
	en=1'b1;d=1'b0;#5;
	en=1'b0;d=1'b1;#5;
	en=1'b1;d=1'b1;#5;
	en=1'b0;d=1'b0;#5;
	$finish;
end
initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,en=%b,d=%b,q=%b,qbar=%b",$time,en,d,q,qbar);
end
endmodule


