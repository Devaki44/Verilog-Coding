//Design code
module fs(a,b,bin,d,bout);
  input wire a,b,bin;
  output  reg d,bout;
  always@(*)
    begin
      case({a,b,bin})
        3'b000:{bout,d} = 2'b00;
        3'b001:{bout,d} = 2'b11;
        3'b010:{bout,d} = 2'b11;
        3'b011:{bout,d} = 2'b01;
        3'b100:{bout,d} = 2'b10;
        3'b101:{bout,d} = 2'b00;
        3'b110:{bout,d} = 2'b00;
        3'b111:{bout,d} = 2'b11;
      endcase
    end
endmodule

//Testbench
module fs_tb;
  reg a,b,bin;
  wire d,bout;
  fs uut(.a(a),.b(b),.bin(bin),.d(d),.bout(bout));
  initial begin
    a=0;b=0;bin=0;#5;
    a=0;b=0;bin=1;#5;
    a=0;b=1;bin=0;#5;
    a=0;b=1;bin=1;#5;
    a=1;b=0;bin=0;#5;
    a=1;b=0;bin=1;#5;
    a=1;b=1;bin=0;#5;
    a=1;b=1;bin=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("fs.vcd");
    $dumpvars(1,fs_tb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | bin=%b | bout=%b| d=%b",$time,a,b,bin,d,bout);
  end
endmodule
