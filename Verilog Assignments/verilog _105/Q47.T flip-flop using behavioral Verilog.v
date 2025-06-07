//Design code
module tff(
	input clk,
	input rst,
	input t,
	output reg q,
	output qbar);
always@(posedge clk)begin
if(rst)
	q<=1'b0;
else begin
    case(t)
	1'b0:q<=q;
	1'b1:q<=~q;
    endcase
end
end
assign qbar=~q;
endmodule


//Testbench
module tff_tb;
 	reg clk;
	reg rst;
	reg t;
	wire q;
	wire qbar;
tff uut(clk,rst,t,q,qbar);
initial begin 
	clk=1'b0;
	forever #5 clk=~clk;
end
initial begin
	rst=1'b1;t=1'b0;#10;
	rst=1'b0;t=1'b1;#10;
	t=1'b0;
	$finish;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,t=%b,q=%b,qbar=%b",$time,clk,rst,t,q,qbar);
end
endmodule
	

