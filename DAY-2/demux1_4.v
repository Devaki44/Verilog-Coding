//Design code
module demux1_4(sel,x,y);
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
        default:y=4'b0000;
    endcase
  end
endmodule

//Testbench
module demux1_4_tb;
  reg [1:0]sel;
  reg x;
  wire [3:0]y;
  demux1_4 uut(sel,x,y);
  initial begin
    x = 1'b1;#5;
    sel=2'b00;#5;
    sel=2'b01;#5;
    sel=2'b10;#5;
    sel=2'b11;#5;
    $finish;
  end
  initial begin
    $dumpfile("demux1_4.vcd");
    $dumpvars(1,demux1_4_tb);
  end
  initial begin
    $monitor("Time=%0t | sel=%b | x=%b | y=%b ",$time,sel,x,y);
  end
endmodule
  
