module ALU_operations_tb;
	reg [3:0]a;
	reg [1:0]sel;
	reg [1:0]shift_amt;
	wire [3:0]out;
ALU_operations uut(a,sel,shift_amt,out);
initial begin
	repeat(5) begin
	 a=$random;sel=2'b00;shift_amt=2'b01;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,sel=%b,shift_amt=%b,out=%b",$time,a,sel,shift_amt,out);
end
endmodule
