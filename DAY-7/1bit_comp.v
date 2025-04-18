//Dsign code
module comp_2b(
  input a,b,
  output x,y,z);//x=(a=b),y=(a<b),z(a>b);
  assign x=(((~a)&(~b))+(a&b));
  assign y=(~a)&b;
  assign z=a&(~b);
endmodule


//Testbench
module comp_2b_tb();
  reg a,b;
  wire x,y,z;
  comp_2b uut(a,b,x,y,z);
  initial begin
    a=1'b0;b=1'b0;#5;
    a=1'b0;b=1'b1;#5;
    a=1'b1;b=1'b0;#5;
    a=1'b1;b=1'b1;#5;
  end
  initial begin
   $monitor("$Time=%0t|a=%b|b=%b|x=%b|y=%b|z=%b",$time,a,b,x,y,z);
  end
endmodule
