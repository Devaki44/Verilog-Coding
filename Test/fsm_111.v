module fsm(
  input clk,rst,x,
  output y);
  
  parameter a=2'b00,
  			b=2'b01,
  			c=2'b10,
  			d=2'b11;
  reg [1:0]state,next_state;
  
  always@(posedge clk)begin
    if(rst)
      state <= a;
    else
      state <= next_state;
  end
  
  always@(*)begin
    case(state)
      a:next_state=(x==0)?a:b;
      b:next_state=(x==0)?a:c;
      c:next_state=(x==0)?a:d;
      d:next_state=(x==0)?a:d;
    endcase
  end
  
  assign y = (state==d);
endmodule
