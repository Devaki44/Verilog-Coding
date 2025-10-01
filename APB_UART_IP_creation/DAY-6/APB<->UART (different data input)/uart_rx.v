module uart_rx(
  input clk,
  input rst,
  input receive,
  input baud_tick,
  input rx,
  output reg [7:0]data_out,
  output reg ready);
  
  reg [9:0]reg_rx;
  reg [3:0]count;
  
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
        		if(baud_tick && count == 4'd9)
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
          ready    <= 1'b0;
        end
        else begin
          if(baud_tick)begin
            
          case(state)
            IDLE : begin
                      reg_rx <= 0 ;
		      count  <= 0 ;
		      ready  <= 0 ;
            	   end
            DATA : begin
                      reg_rx <= {rx,reg_rx[9:1]};		      
		      count  <= count +1 ;
		      ready  <= 0;
            	   end
            STOP : begin
                          reg_rx <= reg_rx;
		          count  <= 0;
              		  ready  <= 1;
			 
                   end
          endcase
          end
        end
    end
    always@(*)begin
    
    if(count == 4'd10)
	    data_out = { reg_rx[8:1] } ;
    else
	    data_out = data_out ;
    end
endmodule
        
