//Design code
module wait_example;
  reg a,b;
  reg y;
  
  initial begin
    a=0;b=0;#5;
    a=0;b=1;#5;
    a=1;b=0;#5;
    a=1;b=1;#5;
    $finish;
  end
  initial begin
    y=0;
    wait( a==1 && b==1)
      y=1;
  end
  initial begin
    $monitor("time=%0t a=%b b=%b y=%b",$time,a,b,y);
  end
endmodule
