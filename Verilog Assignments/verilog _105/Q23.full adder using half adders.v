//Design code
module fa_ha(
	input a,b,c,
	output sum,carry);

	ha ins1(a,b,x,y);
	ha ins2(x,c,sum,z);
	assign carry=y^z;
endmodule
module ha(
	input a,b,
	output sum,carry);
      	assign sum=a^b;
        assign carry=a&b;
endmodule

//Testbench
module fa_ha_tb;
	reg a,b,c;
	wire sum,carry;
	fa_ha uut(a,b,c,sum,carry);
	initial begin
	 repeat(5)begin
	   a=$random;b=$random;c=$random;#5;
	 end
	end
	initial begin
	 $monitor("$time=%0t,a=%0b,b=%0b,c=%0b,sum=%0b,carry=%0b",$time,a,b,c,sum,carry);
	end
endmodule
