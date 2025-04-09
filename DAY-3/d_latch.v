//Design code
module d_latch(d,en,rst,q,q_bar);
  input wire d,en,rst;
  output reg q;
  output wire q_bar;
  always@(d or en or rst)
    begin
      if(rst)
        q<=1'b0;
      else if(en)
        case(d)
        1'b0:q<=1'b0;
        1'b1:q<=1'b1;
        default:q<=1'b0;
       endcase
    end
 assign q_bar=~q;
endmodule

//Testbench
module d_lattb();
  reg d,en,rst;
  wire q;
  wire q_bar;
  d_latch uut(.d(d),.en(en),.rst(rst),.q(q),.q_bar(q_bar));
  initial begin
     en=1'b0;d=0;rst=0;#5;
     en=1'b0;d=1;rst=0;#5;
     en=1'b0;d=0;rst=1;#5;
     en=1'b0;d=1;rst=1;#5;
     en=1'b1;d=0;rst=0;#5;
     en=1'b1;d=1;rst=0;#5;
     en=1'b1;d=0;rst=1;#5;
     en=1'b1;d=1;rst=1;#5;
     $finish;
  end
  initial begin
    $dumpfile("d_latch.vcd");
    $dumpvars(1,d_lattb);
  end
  initial begin
    $monitor("$Time=%0t|rst=%b|en=%b|d=%b|q=%b|q_bar=%b",$time,rst,en,d,q,q_bar);
  end
endmodule
    
