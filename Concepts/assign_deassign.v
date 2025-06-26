//assign_deassign

module assign_deassign_tb;
  reg [3:0]d1;
  
  initial begin
    d1 = 5;
    #5;assign d1 = 7;
    #5;deassign d1;
    #5;d1 = 8 ;
  end
  initial begin
    $monitor("$time=%0t,d1=%d",$time,d1);
  end
endmodule
