//Design code
  module binary_to_gray(
  input [3:0]b,
  output [3:0]g);
  
  assign g[3]=b[3];
  assign g[2]=b[3]^b[2];
  assign g[1]=b[2]^b[1];
  assign g[0]=b[1]^b[0];
endmodule


//Testbench
module binary_to_gray_tb;
  reg [3:0]b;
  wire [3:0]g;
  
  binary_to_gray uut(b,g);
  initial begin
    b=4'b0001;#5;
    b=4'b1101;#5;
    b=4'b0111;#5;
    b=4'b0101;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,b=%b,g=%b",$time,b,g);
  end
  
endmodule

