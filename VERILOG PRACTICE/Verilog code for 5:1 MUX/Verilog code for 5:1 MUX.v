module mux_5x1(
  input [7:0]in,
  input [2:0]sel,
  output reg out);
  
  always@(*)begin
    case({sel[2],sel[1],sel[0]})
      3'b000 : out=in[0] ;
      3'b001 : out=in[1] ;
      3'b010 : out=in[2] ;
      3'b011 : out=in[3] ;
      3'b100 : out=in[4] ;
      default: out=1'bx ;
    endcase
  end
endmodule
