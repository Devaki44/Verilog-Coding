//Design code
module en_2x1(
  input [1:0]in,
  output reg out);
  
  always@(*)begin
    case(in)
      2'b01:out=0;
      2'b10:out=1;
      default:out=1'bx;
    endcase
  end
endmodule

//Testbench

module en_2x1_tb;
  reg [1:0]in;
  wire out;
  
  en_2x1 uut(in,out);
  
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
