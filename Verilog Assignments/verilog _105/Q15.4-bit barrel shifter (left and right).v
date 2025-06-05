//DESIGN CODE
module barrel_sr(
	input [3:0]in,
	input dir,
	input [1:0]shift_amt,
	output [3:0]out);
	assign out=(dir==1'b0)?(in<<shift_amt):(in>>shift_amt);
endmodule

//TESTBENCH
module barrel_shift_tb;
	reg [3:0]in;
	reg dir;
	reg [1:0]shift_amt;
	wire [3:0]out;
	
	barrel_sr uut(in,dir,shift_amt,out);
        initial begin
	 repeat(5)begin
	  in=$random;dir=$random;shift_amt=$random;#5;
	 end
	end
	initial begin
	  $monitor("$time=%0t,in=%b,dir=%b,shift_amt=%b,out=%b",$time,in,dir,shift_amt,out);
	end
endmodule
