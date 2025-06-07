//Design code
module jkff_b(
	input clk,rst,j,k,
	output qbar,
 	output reg q);
always@(posedge clk)begin
if(rst)
    q<=1'b0;
else
    case({j,k})
	2'b00:q<=q;
	2'b01:q<=1'b0;
	2'b10:q<=1'b1;
	2'b11:q<=~q;
	default:q<=1'b0;
    endcase
end
assign qbar=~q;
endmodule



//TESTBENCH
module jkff_b_tb;
	reg clk,rst,j,k;
	wire qbar;
	wire q;
jkff_b uut(clk,rst,j,k,qbar,q);
initial begin
 	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;
	forever #5 rst=~rst;
end
initial begin
       	repeat(5)begin
	  j=$random;k=$random;#5;
	end
	$finish;
end
initial begin
	$dumpfile("dump.vcd");
	$dumpvars;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,j=%b,k=%b,q=%b,qbar=%b",$time,clk,rst,j,k,q,qbar);
end
endmodule
