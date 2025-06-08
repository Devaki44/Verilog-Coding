//Design code
module mealy_101(
	input clk,rst,
	input x,
	output reg y);

parameter A=2'b00, B=2'b01,C=2'b10;
reg [1:0]state,next_state;

always@(posedge clk or posedge rst)begin
if(rst)
	state<=A;
else
	state<=next_state;
end
always@(*)begin
	case(state)
	  A:next_state=(x==0)?A:B;
	  B:next_state=(x==0)?C:B;
	  C:next_state=(x==0)?A:A;
	  default:next_state=A;
	endcase
end
always@(posedge clk)begin
    case(state)
     A,B: y = 0;
       C: y = ((state ==C) && (x==1))?1:0;
    endcase
end
endmodule



//Testbench
module mealy_101_tb;
	reg clk,rst;
	reg x;
	wire y;
mealy_101 uut(clk,rst,x,y);
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;x=0;#10;
	rst=0;x=0;#10;
	x=1;#10;
	x=0;#10;
	x=1;#10;
	x=0;#10;
	x=1;#10;
	x=0;#10;
	x=1;#10;
	x=0;#10;
	x=1;#10;
        $finish;
end
initial begin
	$monitor("$time=%0t,clk=%b,rst=%b,x=%b,y=%b",$time,clk,rst,x,y);
end
endmodule
