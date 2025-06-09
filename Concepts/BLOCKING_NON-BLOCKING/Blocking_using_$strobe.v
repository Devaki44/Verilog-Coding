module blocking;
  reg a,b,c;
  
  initial begin
    a=0;b=1;c=0;

    a=b;
    #5;a=b;b=c;
    #10;c=b;
    $strobe("$time=%0t,a=%b,b=%b,c=%b",$time,a,b,c);
  end
endmodule


//OUTPUT
$time=15,a=1,b=0,c=0
