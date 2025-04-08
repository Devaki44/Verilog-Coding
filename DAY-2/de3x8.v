//Design code
module de3x8(x,y,en);
  input wire en;
  input  wire [2:0]x;
  output reg [7:0]y;
  always@(en or x)begin
    if(en==0)
      y=8'b0000;
    else
     begin
      case(x)
        3'b000:y=8'b00000001;
        3'b001:y=8'b00000010;
        3'b010:y=8'b00000100;
        3'b011:y=8'b00001000;
       
        3'b100:y=8'b00010000;
        3'b101:y=8'b00100000;
        3'b110:y=8'b01000000;    
        3'b111:y=8'b10000000;
        default:y=8'bxxxxxxxx;
      endcase
     end
  end
endmodule


//Testbench
module de3x8_tb;
  reg en;
  reg [2:0]x;
  wire [7:0]y;
  de3x8 uut(.en(en),.x(x),.y(y));
  initial begin
    en=0;x=3'b000;#5;
    en=0;x=3'b001;#5;
    en=0;x=3'b010;#5;
    en=0;x=3'b011;#5;
    en=0;x=3'b100;#5;
    en=0;x=3'b101;#5;
    en=0;x=3'b110;#5;
    en=0;x=3'b111;#5;
    
    en=1;x=3'b000;#5;
    en=1;x=3'b001;#5;
    en=1;x=3'b010;#5;
    en=1;x=3'b011;#5;
    en=1;x=3'b100;#5;
    en=1;x=3'b101;#5;
    en=1;x=3'b110;#5;
    en=1;x=3'b111;#5;
    
    $finish;
  end
  initial begin
    $dumpfile("de3x8.vcd");
    $dumpvars(1,de3x8_tb);
  end
  initial begin
    $monitor("Time=%0t | en=%b | x=%b | y=%b ",$time,en,x,y);
  end
endmodule
  
