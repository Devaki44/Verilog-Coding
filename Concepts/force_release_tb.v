//force_release
module force_release_tb;
  reg [3:0]w1 ;
  wire [3:0]w2 ;
  
  assign w2 = 5;
  
  initial begin
    w1 = 1;
    #5; force w1 = 7; 
        force w2 = 8 ;
    #5; release w1 ;
        release w2 ;
  end
  initial begin
    $monitor("$time=%0t,w1=%d,w2=%d",$time,w1,w2);
  end
endmodule
    
