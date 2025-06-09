//Design code
module design_code;
  reg [2:0]a,b,c;
  
  initial fork
    	a = 2;
    	b = 0;
    	c = 5;
    
    #1  a=c;
    #1  b=a;
    #2	a=b; 
    #3  c=a;
//     $display("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
//     $strobe("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
   
  join
  initial begin
    $monitor("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
  end

endmodule

//OUTPUT FOR MONITOR
$time=0,a=2,b=0,c=5
$time=1,a=5,b=2,c=5
$time=2,a=2,b=2,c=5
$time=3,a=2,b=2,c=2
