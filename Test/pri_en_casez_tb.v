module pri_en_8x3_tb;
  reg [7:0]in;
  wire [2:0]out;
  
  pri_en_8x3 uut(in,out);
  initial begin
      in=8'b00000001;#5;
      in=8'b00000010;#5;
      in=8'b00000100;#5;
      in=8'b00001000;#5;
      
      in=8'b00010000;#5;
      in=8'b00100000;#5;
      in=8'b01000000;#5;
      in=8'b10000000;#5;
  end
  initial begin
    $monitor("$time=%0t,in=%b,out=%b",$time,in,out);
  end
endmodule
