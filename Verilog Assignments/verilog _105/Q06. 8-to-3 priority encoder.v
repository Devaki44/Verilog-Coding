//Design code
module pri_en_8x3(
  input [7:0]in,
  output reg[2:0]out);
  
  always@(*)begin
    casez(in)
      8'b00000001:out=3'b000;
      8'b0000001?:out=3'b001;
      8'b000001??:out=3'b010;
      8'b00001???:out=3'b011;
     
      8'b0001????:out=3'b100;
      8'b001?????:out=3'b101;
      8'b01??????:out=3'b110;
      8'b1???????:out=3'b111;
      default:out=3'bxxx;
    endcase
  end
endmodule

//Testbench
module pri_en_8x3_tb;
  reg [7:0]in;
  wire [2:0]out;
  
  pri_en_8x3 uut(in,out);
  
  initial begin
    in=8'b00000000;#5;
    in=8'b00000111;#5;
    in=8'b00010000;#5;
    in=8'b00100001;#5;
    in=8'b00010000;#5;
    in=8'b11111111;#5;
    
    $finish;
  end
  initial begin
    $monitor("$time=%0t,in=%b,out=%b",$time,in,out);
  end
endmodule
