//Design code
module fa(a,b,cin,s,cout);
  input wire a,b,cin;
  output  reg s,cout;
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

//Testbench
module fs_tb;
  reg a,b,cin;
  wire s,cout;
fa uut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  initial begin
    a=0;b=0;cin=0;#5;
    a=0;b=0;cin=1;#5;
    a=0;b=1;cin=0;#5;
    a=0;b=1;cin=1;#5;
    a=1;b=0;cin=0;#5;
    a=1;b=0;cin=1;#5;
    a=1;b=1;cin=0;#5;
    a=1;b=1;cin=1;#5;
    $finish;
  end
  initial begin
    $dumpfile("fa.vcd");
    $dumpvars(1,fs_tb);
  end
  initial begin
    $monitor("Time=%0t | a=%b | b=%b | cin=%b | s=%b| cout=%b",$time,a,b,cin,s,cout);
  end
endmodule
