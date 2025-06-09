module blocking;
  reg a,b,c;
  
  initial begin
    a=0;b=1;c=0;

    a=b;
    #5;a=b;b=c;
    #10;c=b;
  end
  initial begin
     $display("$time=%0t,a=%b,b=%b,c=%b",$time,a,b,c);
  end

endmodule


//output
$time=0,a=1,b=1,c=0





//MOETHOD2
module blocking;
  reg a,b,c;
  
  initial begin
    a=0;b=1;c=0;

    a=b;
    #5;a=b;b=c;
    #10;c=b;
    $display("$time=%0t,a=%b,b=%b,c=%b",$time,a,b,c);
  end
//   initial begin
//      $display("$time=%0t,a=%b,b=%b,c=%b",$time,a,b,c);
//   end

endmodule


//OUTPUT
$time=15,a=1,b=0,c=0
