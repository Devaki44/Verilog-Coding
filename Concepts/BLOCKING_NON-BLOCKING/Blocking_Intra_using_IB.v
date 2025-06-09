//Design code
module design_code;
  reg [2:0]a,b,c;
  
  initial begin
    	a = 2;
    	b = 0;
    	c = 5;
       
    
        a = #1 c;
        a = #2 b;
        c = #3 a;
  end
  initial begin
        $monitor("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
  end

endmodule

//OUTPUT
$time=0,a=2,b=0,c=5
$time=1,a=5,b=0,c=5
$time=3,a=0,b=0,c=5
$time=6,a=0,b=0,c=0
