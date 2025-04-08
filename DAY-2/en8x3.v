//Design code
module en8x3(x,y,en);
  input wire en;
  input  wire [7:0]x;
  output reg [2:0]y;
  always@(en or x)begin
    if(en==0)
      y=3'b000;
    else
     begin
      case(x)
        8'b00000001:y=3'b000;
        8'b00000010:y=3'b001;
        8'b00000100:y=3'b010;
        8'b00001000:y=3'b011;
        8'b00010000:y=3'b100;
        8'b00100000:y=3'b101;
        8'b01000000:y=3'b110;
        8'b10000000:y=3'b111;
        default:y=2'bxxx;
      endcase
     end
  end
endmodule

//Testbench
module en8x3_tb;
   reg en;
  reg [7:0]x;
  wire [2:0]y;
  en8x3 uut(.en(en),.x(x),.y(y));
  initial begin
    en=0;x=8'b00000001;#5;
    en=0;x=8'b00000010;#5;
    en=0;x=8'b00000100;#5;
    en=0;x=8'b00001000;#5;
    en=0;x=8'b00010000;#5;
    en=0;x=8'b00100000;#5;
    en=0;x=8'b01000000;#5;
    en=0;x=8'b10000000;#5;
    
    en=1;x=8'b00000001;#5;
    en=1;x=8'b00000010;#5;
    en=1;x=8'b00000100;#5;
    en=1;x=8'b00001000;#5;
    en=1;x=8'b00010000;#5;
    en=1;x=8'b00100000;#5;
    en=1;x=8'b01000000;#5;
    en=1;x=8'b10000000;#5;
    $finish;
  end
  initial begin
    $dumpfile("en8x3.vcd");
    $dumpvars(1,en8x3_tb);
  end
  initial begin
    $monitor("Time=%0t | en=%b | x=%b | y=%b ",$time,en,x,y);
  end
endmodule
  
