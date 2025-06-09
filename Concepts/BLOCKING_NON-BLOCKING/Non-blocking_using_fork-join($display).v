//Design code
module design_code;
  reg [2:0]a,b,c;
  
  initial fork
    	a = 2;
    	b = 0;
    	c = 5;
       
    
    #1  a<=c;
    #2	a<=b; 
    #3  c<=a;
    #2 $display("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);

   
  join

endmodule



//OUTPUT
$time=2,a=5,b=0,c=5
