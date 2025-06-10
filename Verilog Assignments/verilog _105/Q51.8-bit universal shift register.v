//Design code
module USR(
        input clk,rst,
        input [1:0]sel,
        input [3:0]data_in,
        input s_left_in,
        input s_right_in,
        output reg[3:0]data_out);
       
always@(posedge clk)begin
if(rst)begin
        data_out <= 4'b0000;
end
else begin
        case(sel)
                2'b00:data_out <= data_out;  //no change
                2'b01:data_out <= {data_in[2:0],s_left_in};  //left_shift
                2'b10:data_out <= {s_right_in,data_in[3:1]};  //right_shift
                2'b11:data_out <= data_in;  //parallel_load
        endcase
end
end
endmodule


//Testbench
module USR_tb;
        reg clk,rst;
        reg [1:0]sel;
        reg [3:0]data_in;
        reg s_left_in;
        reg s_right_in;
        wire [3:0]data_out;
USR uut(clk,rst,sel,data_in,s_left_in,s_right_in,data_out);
initial begin
        clk=0;
        forever #5 clk=~clk;
end
initial begin
        rst=1'b1 ; sel=$random%2 ; data_in=$random%4 ; s_left_in=1'b0 ; s_right_in=1'b0; #10;
        rst=1'b0 ; sel=$random%2 ; data_in=$random%4 ; s_left_in=1'b0 ; s_right_in=1'b0; #10;
	    rst=1'b0 ; sel=$random%2 ; data_in=$random%4 ; s_left_in=1'b0 ; s_right_in=1'b0; #10;
        rst=1'b0 ; sel=$random%2 ; data_in=$random%4 ; s_left_in=1'b0 ; s_right_in=1'b0; #10;  
        $finish;
end
initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
end
initial begin
        $monitor("$time=%0t,clk=%b,rst=%b,sel=%b,data_in=%b,s_left_in=%b,s_right_in=%b,data_out=%b",$time,clk,rst,sel,data_in,s_left_in,s_right_in,data_out);
end
endmodule



//Output
$time=0,clk=0,rst=1,sel=00,data_in=1101,s_left_in=0,s_right_in=0,data_out=xxxx
$time=5,clk=1,rst=1,sel=00,data_in=1101,s_left_in=0,s_right_in=0,data_out=0000
$time=10,clk=0,rst=0,sel=11,data_in=1111,s_left_in=0,s_right_in=0,data_out=0000
$time=15,clk=1,rst=0,sel=11,data_in=1111,s_left_in=0,s_right_in=0,data_out=1111
$time=20,clk=0,rst=0,sel=01,data_in=0001,s_left_in=0,s_right_in=0,data_out=1111
$time=25,clk=1,rst=0,sel=01,data_in=0001,s_left_in=0,s_right_in=0,data_out=0010
$time=30,clk=0,rst=0,sel=11,data_in=1110,s_left_in=0,s_right_in=0,data_out=0010
$time=35,clk=1,rst=0,sel=11,data_in=1110,s_left_in=0,s_right_in=0,data_out=1110
testbench.sv:19: $finish called at 40 (1s)
$time=40,clk=0,rst=0,sel=11,data_in=1110,s_left_in=0,s_right_in=0,data_out=1110
