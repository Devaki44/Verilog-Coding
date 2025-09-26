module uart_tx(
  input clk,
  input rst,
  input baud_tick,
  input transfer,
  input [7:0]data_in,
  output reg tx,
  output reg busy);
  
  reg [7:0]reg_tx ;
  reg [3:0]count ;
  
  reg [1:0]state,next_state;
  
  localparam IDLE  = 2'b00;
  localparam START = 2'b01;
  localparam DATA  = 2'b10;
  localparam STOP  = 2'b11;
  
  always@(posedge clk)begin
    if(rst)begin
      state		<= IDLE ;
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
         			 next_state = IDLE 
          	  end
      START : begin
        if(baud_tick )
         			 next_state = DATA ;
        				
        		else
         			 next_state = START ;
          	  end
      DATA  : begin
        		if(baud_tick && count == 10)
          			next_state <= STOP ;
        		else
          			next_state <= DATA ;
      STOP	: begin
        		if(baud_tick)
          			next_state <= IDLE ;
        		else
          			next_state <= STOP ;
    endcase
  end
        
  always@(posedge clk)begin
    if(rst)begin
      reg_tx	<= 0;
      count		<= 0;
      tx 		<= 1;
      busy		<= 0;
    end
    else begin
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
        		reg_tx 	<= {1'b1,reg_tx[9:1]};
        		tx	 	<= reg_tx[0];
        		count   <= count + 1;
      STOP	: begin
        		tx		<= 1;
              end
    endcase
  end
endmodule    
      
          
  
  
    
      
      
