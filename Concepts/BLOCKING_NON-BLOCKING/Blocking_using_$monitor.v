module blocking;
  reg a,b,c;
  
  initial begin
    a=0;b=1;c=0;

    a=c;
    #5;a=b;b=c;
    #10;c=b;
  end
  initial begin
     $monitor("$time=%0t,a=%b,b=%b,c=%b",$time,a,b,c);
  end

endmodule


//Testbench
$time=0,a=0,b=1,c=0
$time=5,a=1,b=0,c=0
