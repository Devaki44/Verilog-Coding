//Design code
module fa(a,b,cin,s,cout);
  input wire a,b,cin;
  output reg s,cout;
  always@(*)
    begin
      case({a,b,cin})
        3'b000:{cout,s} = 2'b00;
        3'b001:{cout,s} = 2'b01;
        3'b010:{cout,s} = 2'b01;
        3'b011:{cout,s} = 2'b10;
        3'b100:{cout,s} = 2'b01;
        3'b101:{cout,s} = 2'b10;
        3'b110:{cout,s} = 2'b10;
        3'b111:{cout,s} = 2'b11;
      endcase
    end
endmodule
module rca(x,y,zin,w,zout);
  input [3:0]x,y;
  input  zin;
  output [3:0]w;
  output zout;
  wire c0,c1,c2;
  fa f1(.a(x[0]),.b(y[0]),.cin(zin),.s(w[0]),.cout(c0));
  fa f2(.a(x[1]),.b(y[1]),.cin(c0),.s(w[1]),.cout(c1));
  fa f3(.a(x[2]),.b(y[2]),.cin(c1),.s(w[2]),.cout(c2));
  fa f4(.a(x[3]),.b(y[3]),.cin(c2),.s(w[3]),.cout(zout));
endmodule

//Testbench
module rca_tb();
   reg [3:0]x,y;
   reg zin;
  wire [3:0]w;
   wire zout;
   rca uut(.x(x),.y(y),.zin(zin),.w(w),.zout(zout));
   initial begin
     zin=0;
     x=4'b0000;y=4'b0000;#5;
     x=4'b0001;y=4'b0001;#5;
     x=4'b0010;y=4'b0010;#5;
     x=4'b0011;y=4'b0011;#5;
     x=4'b0100;y=4'b0100;#5;
     x=4'b0101;y=4'b0101;#5;
     x=4'b0110;y=4'b0110;#5;
     x=4'b0111;y=4'b0111;#5;
    
     x=4'b1000;y=4'b1000;#5;
     x=4'b1001;y=4'b1001;#5;
     x=4'b1010;y=4'b1010;#5;
     x=4'b1011;y=4'b1011;#5;
     x=4'b1100;y=4'b1100;#5;
     x=4'b1101;y=4'b1101;#5;
     x=4'b1110;y=4'b1110;#5;
     x=4'b1111;y=4'b1111;#5;
     $finish;
   end
   initial begin
     $dumpfile("rca.vcd");
     $dumpvars(1,rca_tb);
   end
   initial begin
    $monitor("$Time=%t|x=%b|y=%b|zin=%b|w=%b|zout=%b",$time,x,y,zin,w,zout);
   end
endmodule
     
  
  
