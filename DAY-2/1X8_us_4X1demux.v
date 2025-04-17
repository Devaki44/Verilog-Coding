//Design code
module demux1x4(sel,x,y);
  input wire [1:0]sel;
  input wire x;
  output reg [3:0]y;
  always@(*)begin
       y=4'b0000;
      case(sel)
        2'b00:y[0]=x;
        2'b01:y[1]=x;
        2'b10:y[2]=x;
        2'b11:y[3]=x;
        default:y=4'bxxxx;
      endcase
  end
endmodule
module demux1x2(sel,a,b);
  input wire sel;
  input wire a;
  output reg [1:0]b;
  always@(*)begin
       b=2'b00;
      case(sel)
        1'b0:b[0]=a;
        1'b1:b[1]=a;
        default:b=2'bxx;
      endcase
  end
endmodule
module demux1x8(sel,p,q);
  input wire [2:0]sel;
  input wire p;
  output wire [7:0]q;
  wire [1:0]b;
  demux1x4 m1(.sel(sel[1:0]),.x(b[0]),.y(q[3:0]));
  demux1x4 m2(.sel(sel[1:0]),.x(b[1]),.y(q[7:4]));
  demux1x2 m3(.sel(sel[2]),.a(p),.b(b));
endmodule


//Testbench
module demux1x8_tb;
  reg [2:0]sel;
  reg p;
  wire [7:0]q;
  demux1x8 uut(.sel(sel),.p(p),.q(q));
  initial begin
    p =1'b1;;#5;
    sel=3'b000;#5;
    sel=3'b001;#5;
    sel=3'b010;#5;
    sel=3'b011;#5;
    
    sel=3'b100;#5;
    sel=3'b101;#5;
    sel=3'b110;#5;
    sel=3'b111;#5;
    
    $finish;
  end
  initial begin
    $dumpfile("demux1x8.vcd");
    $dumpvars(1,demux1x8_tb);
  end
  initial begin
    $monitor("Time=%0t | sel=%b | p=%b | q=%b ",$time,sel,p,q);
  end
endmodule
