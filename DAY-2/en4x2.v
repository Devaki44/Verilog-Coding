//Design code
module en4x2(x,y,en);
  input wire en;
  input  wire [3:0]x;
  output reg [1:0]y;
  always@(en or x)begin
    if(en==0)
      y=2'b00;
    else
     begin
      case(x)
        4'b0001:y=2'b00;
        4'b0010:y=2'b01;
        4'b0100:y=2'b10;
        4'b1000:y=2'b11;
        default:y=2'bxx;
      endcase
     end
  end
endmodule

//Testbench
module en4x2_tb;
   reg en;
   reg [3:0]x;
   wire [1:0]y;
  en4x2 uut(.en(en),.x(x),.y(y));
  initial begin
    en=0;x=4'b0001;#5;
    en=0;x=4'b0010;#5;
    en=0;x=4'b0100;#5;
    en=0;x=4'b1000;#5;
    
    en=1;x=4'b0001;#5;
    en=1;x=4'b0010;#5;
    en=1;x=4'b0100;#5;
    en=1;x=4'b1100;#5;
    $finish;
  end
  initial begin
    $dumpfile("en4x2.vcd");
    $dumpvars(1,en4x2_tb);
  end
  initial begin
    $monitor("Time=%0t | en=%b | x=%b | y=%b ",$time,en,x,y);
  end
endmodule
  
