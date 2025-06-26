module zero_delay;
  reg [3:0]a;
  reg [3:0]b;
  reg [3:0]c;
  
  initial begin
    a=4;
    b=9;
    c=1;
    
    #5; a<=b;
    #5; b<=c;
    $display("output before #0 delay",$time,a,b,c); 
  end
  initial begin
    
    #0; 
    $display("output after  #0 delay",$time,a,b,c);
  end
endmodule
