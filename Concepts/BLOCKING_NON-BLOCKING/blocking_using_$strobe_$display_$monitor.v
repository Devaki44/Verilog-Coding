//Design code
module design_code;
  reg [2:0]a,b,c;
  
  initial begin
    a=2;b=3;c=4;
 
    #1a=c;
    #2a=b;b=c;
//     $display("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
//     $strobe("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
    #3c=a;
  end
  initial begin
    $monitor("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
  end

endmodule

//OUTPUT FOR $monitor
$time=0,a=2,b=3,c=4
$time=1,a=4,b=3,c=4
$time=3,a=3,b=4,c=4
$time=6,a=3,b=4,c=3


//OUTPUT FOR $display and $strobe
$time=3,a=3,b=4,c=4
