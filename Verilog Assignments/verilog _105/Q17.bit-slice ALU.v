//Design code
module bit_slice_ALU(
	input [3:0]a,b,
	input [1:0]sel,
	output reg [3:0]out,
	output reg add_cout,
	output reg add_ov_out,
	output reg sub_ov_out
        );
        
	wire [3:0]and_out;
	wire [3:0]or_out;
	wire [3:0]add_out;
	wire [3:0]sub_out;
	wire add_c;
	wire add_ov;
	wire sub_ov;

	assign and_out=a&b;
	assign or_out=a|b;
	assign {add_c,add_out}=a+b;
	assign sub_out=a-b;
	assign add_ov=((a[3] && b[3]) || (a[3] == 1 && b[3] == 0 && add_out[3] == 0));
	assign sub_ov=(a[3] != b[3]) && (sub_out[3] != a[3]);

always@(*)begin
  add_cout=0;
  add_ov_out=0;
  sub_ov_out=0;
  case(sel)
        2'b00:out=and_out;
	2'b01:out=or_out;
	2'b10:begin
		out=add_out;
		add_cout=add_c;
		add_ov_out=add_ov;
	      end

	2'b11:begin
		out=sub_out;
		sub_ov_out=sub_ov;
              end
  endcase
end
endmodule
    

//Testbench
module bit_slice_ALU_tb;
	reg [3:0]a,b;
	reg [1:0]sel;
	wire [3:0]out;
	wire add_cout;
	wire add_ov_out;
	wire sub_ov_out;
bit_slice_ALU uut(a,b,sel,out,add_cout,add_ov_out,sub_ov_out);
initial begin
	repeat(10)begin
	 a=$random;b=$random;sel=2'b11;#5;
	end
end
initial begin
	$monitor("$time=%0t,a=%b,b=%b,sel=%b,out=%b,add_cout=%b,add_ov_out=%b,sub_ov_out=%b",$time,a,b,sel,out,add_cout,add_ov_out,sub_ov_out);
end
endmodule
