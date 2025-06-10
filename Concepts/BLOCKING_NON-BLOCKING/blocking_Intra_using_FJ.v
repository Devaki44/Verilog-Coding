//Design code
module design_code;
  reg [2:0]a,b,c;
  
  initial fork
    	a = 2;b = 0;c = 5;
       

        a = #1 c;
        a = #2 b;
        c = #3 a;
        
//        #2 $display("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
//         #1 $strobe("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);

  join
  
  initial begin
    
        $monitor("$time=%0t,a=%d,b=%d,c=%d",$time,a,b,c);
  end

endmodule

//OUTPUT
# KERNEL: $time=0,a=2,b=0,c=5
# KERNEL: $time=1,a=5,b=0,c=5
# KERNEL: $time=2,a=0,b=0,c=5
# KERNEL: $time=3,a=0,b=0,c=2
