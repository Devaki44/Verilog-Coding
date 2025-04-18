//Design code
module comp_2b(
  input [1:0]a,b,
  output x,y,z);//x=(a=b),y=(a<b),z(a>b);
  assign x=(((~a)&(~b))+(a&b));
  assign y=(~a)&b;
  assign z=a&(~b);
endmodule


//Testbench
module comp_2b_tb();
  reg [1:0]a,b;
  wire x,y,z;
  comp_2b uut(a,b,x,y,z);
  initial begin
    a=2'b00;b=2'b00;#5;
    a=2'b01;b=2'b10;#5;
    a=2'b10;b=2'b11;#5;
    a=2'b11;b=2'b00;#5;
  end
  initial begin
   $monitor("$Time=%0t|a=%b|b=%b|x=%b|y=%b|z=%b",$time,a,b,x,y,z);
  end
endmodule
