//Design code
module de2x4(x,y,en);
  input wire en;
  input  wire [1:0]x;
  output reg [3:0]y;
  always@(en or x)begin
    if(en==0)
      y=4'b0000;
    else
     begin
      case(x)
        2'b00:y=4'b0001;
        2'b01:y=4'b0010;
        2'b10:y=4'b0100;
        2'b11:y=4'b1000;
        default:y=4'bxxxx;
      endcase
     end
  end
endmodule


//Testbench
module de2x4_tb;
  reg en;
  reg [1:0]x;
  wire [3:0]y;
  de2x4 uut(.en(en),.x(x),.y(y));
  initial begin
    en=0;x=2'b00;#5;
    en=0;x=2'b01;#5;
    en=0;x=2'b10;#5;
    en=0;x=2'b11;#5;
    
    en=1;x=2'b00;#5;
    en=1;x=2'b01;#5;
    en=1;x=2'b10;#5;
    en=1;x=2'b11;#5;
    $finish;
  end
  initial begin
    $dumpfile("de2x4.vcd");
    $dumpvars(1,de2x4_tb);
  end
  initial begin
    $monitor("Time=%0t | en=%b | x=%b | y=%b ",$time,en,x,y);
  end
endmodule
  
