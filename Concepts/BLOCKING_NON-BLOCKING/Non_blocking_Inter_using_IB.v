//Design code
module design_code;
  reg [2:0]a,b,c;
  
  initial begin
    a=4;b=5;c=1;
 
    #1a<=c;
    #2a<=b;b<=c;
    $display("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
    $strobe("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
    #3c<=a;
  end
//   initial begin
//     $monitor("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
//   end

endmodule

//output for $display
$time=3,a=1,b=5,c=1

//output for $strobe
$time=3,a=5,b=1,c=1

//output for $monitor
$time=0,a=4,b=5,c=1
$time=1,a=1,b=5,c=1
$time=3,a=5,b=1,c=1
$time=6,a=5,b=1,c=5
