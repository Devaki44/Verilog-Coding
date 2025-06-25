//testbench
module wor_tb;
  reg a ;
  reg b ;
  wor out;
  
  w_or uut(a,b,out);
  
  initial begin
    a=1'b0 ; b=1'b0 ;#5;
    a=1'b0 ; b=1'b1 ;#5;
    a=1'b1 ; b=1'b0 ;#5;
    a=1'b1 ; b=1'b1 ;#5;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars ;
  end
  initial begin
    $monitor("$time=%0t,a=%b,b=%b,out=%b",$time,a,b,out);
  end
endmodule
    
    
