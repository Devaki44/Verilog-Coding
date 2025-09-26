module uart_rx(
  input clk,
  input rst,
  input receive,
  input baud_tick,
  input rx,
  output  [7:0]data_out);
  
  reg [9:0]reg_rx;
  reg [2:0]count;
  
  reg[1:0]state,next_state;
  
  localparam IDLE  = 2'b00;
  localparam DATA  = 2'b01 ;
  localparam STOP  = 2'b10 ;
  
  always@(posedge clk)begin
    if(rst)
      state <= IDLE ;
    else
      state <= next_state ;
  end
  
  always@(*)begin
    case(state)
      IDLE   : begin
                if(receive)
        		  next_state = DATA ;
                else
                  next_state = IDLE;
                end
      DATA   : begin
        		if(baud_tick && count == 7)
          		  next_state = STOP ;
                else
                  next_state = DATA ;
      		   end
      STOP   : begin
       			if(baud_tick)
         		  next_state = IDLE ;
       			else
         		  next_state = STOP ;
     		   end
     endcase
   end
      
   always@(posedge clk)begin
        if(rst)begin
          reg_rx   <= 8'b0;
          count    <= 3'b0;
        end
        else begin
          if(baud_tick)begin
            
          case(state)
            IDLE : begin
                      reg_rx <= 0 ;
            	   end
            DATA : begin
                      reg_rx <= {rx,reg_rx[9:1]};
            	   end
            STOP : begin
                      reg_rx <= reg_rx;
                   end
          endcase
          end
        end
    end
    assign data_out = { reg_rx[8:1] } ;
endmodule
        
