//Design code
module dec_2x4(
  input [1:0]in,
  output reg [3:0]out);
  
  always@(*)begin
    case(in)
      2'b00:out=4'b0001;
      2'b01:out=4'b0010;
      2'b10:out=4'b0100;
      2'b11:out=4'b1000;
      default:out=4'bxxxx;
    endcase
  end
endmodule


//Testbench
module dec_2x4_tb;
  reg [1:0]in;
  wire [3:0]out;
  
  dec_2x4 uut(in,out);
  
  initial begin
    in=2'b00;#5;
    in=2'b01;#5;
    in=2'b10;#5;
    in=2'b11;#5;
    $finish;
  end
  initial begin
    $monitor("$time=%0t,in=%b,out=%b",$time,in,out);
  end
endmodule
