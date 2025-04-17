//Design code
module d_latch(
   input d,
   input en,
   input sel,
   output reg q
   );
  always@(*)begin
   if(en)
    case(sel)
      1'b0:q=d;
      1'b1:q=~d;
    endcase
   else
     q=q;
  end
endmodule


//Testbench
module d_latch_tb();
          reg d,en,sel;
          wire q;
d_latch uut(.d(d),.en(en),.sel(sel),.q(q));
  initial begin 
    en=1'b0;sel=0;d=1'b0;#5;
    en=1'b0;sel=0;d=1'b1;#5;
    en=1'b0;sel=1;d=1'b0;#5;
    en=1'b0;sel=1;d=1'b1;#5;
    
    en=1'b1;sel=0;d=1'b0;#5;
    en=1'b1;sel=0;d=1'b1;#5;
    en=1'b1;sel=1;d=1'b0;#5;
    en=1'b1;sel=1;d=1'b1;#5;
    
    $finish;
  end
  initial begin
    $monitor("$Time=%0t|en=%b|sel=%b|d=%b|q=%b",$time,en,sel,d,q);
  end
endmodule
