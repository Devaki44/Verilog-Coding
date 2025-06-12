module expression_tb;
  reg a,b,c,d,e;
  wire y;
  
  expression uut(a,b,c,d,e,y);
  
  initial begin
    #50;
    a=1;b=0;c=1;d=1;e=1;#5;
    a=1;b=1;c=1;d=1;e=1;#5;
    a=1;b=0;c=1;d=0;e=1;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,c=%b,d=%b,e=%b,y=%b",$time,a,b,c,d,e,y);
  end
endmodule
