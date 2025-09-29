module uart_tx(
  input clk,
  input rst,
  input baud_tick,
  input transfer,
  input [7:0]data_in,
  output reg tx,
  output reg busy);
  
  reg [7:0]reg_tx ;
  reg [2:0]count ;
  
  reg [1:0]state,next_state;
  
  localparam IDLE  = 2'b00;
  localparam START = 2'b01;
  localparam DATA  = 2'b10;
  localparam STOP  = 2'b11;
  
  always@(posedge clk)begin
    if(rst)begin
      state		<= IDLE ;
      reg_tx	        <= 10'b0;
      count		<= 0;
      tx 		<= 1;
      busy		<= 0;

    end
    else 
      state		<= next_state ;
  end
  
  always@(*)begin
    case(state)      
      IDLE  : begin
        		if(transfer)
         			 next_state = START ;
        		else
         			 next_state = IDLE ;
              end
      START : begin
        		if(baud_tick)
         			 next_state = DATA ;
        				
        		else
         			 next_state = START ;
              end
      DATA  : begin
        		if(baud_tick && count == 7)
          			next_state  = STOP ;
        		else
          			next_state  = DATA ;
              end
      STOP  : begin
        		if(baud_tick)
          			next_state  = IDLE ;
        		else
          			next_state  = STOP ;
	      end
    endcase
  end
        
  always@(posedge clk)begin
    if(rst)begin
      reg_tx	        <= 8'b0;
      count		<= 0;
      tx 		<= 1;
      busy		<= 0;
    end
    else begin
     
    if(baud_tick)begin
     case(state)      
      IDLE  : begin
        	tx 		<= 1;
              end
      START : begin
        	reg_tx 	<= data_in;
                tx   	<= 0;
                busy 	<= 1;
              end
      DATA  : begin
                	tx	<= reg_tx[count];
        		count   <= count + 1;
              end
      STOP  : begin
        		tx	<= 1;
			count   <= 0;
			busy	<= 0;
              end
     endcase
    end
    end
  end

endmodule    
      
          
  
  
