// `include "fifo_tx.v"
// `include "baud_gen.v"
// `include "uart_tx.v"
// `include "uart_rx.v"
// `include "fifo_rx.v"

module topmodule(
  input              PCLK,
  input              PRESET,
   
  input              PSEL,
  input              PENABLE,
  input              PWRITE,
  input       [7:0]  PADDR,
  input       [7:0]  PWDATA,
  output reg  [7:0]  PRDATA,
  output wire        PREADY,
  output wire        ready,
  output wire        f_ready);
  
  assign PREADY = 1;

  wire baud_tick;
  wire tx;
  wire busy;
  wire [7:0]d_out;     
  wire [7:0]r_out;
  wire e_tx;
  
  reg  [7:0]d_in;
  wire [7:0]data_out;
  wire f_rx;
  wire e_rx;
  
  always@(posedge PCLK)begin
    
    if(PRESET)
      PRDATA 	<= 8'h0;
    
    else begin
      if(PSEL && !PENABLE && PWRITE)begin
      	case(PADDR)
      		8'h00 :  ;
      		8'h04 : d_in    <= PWDATA[7:0] ;
        endcase
      end
      
      if(PSEL && !PENABLE && !PWRITE)begin
        case(PADDR)		
	  8'h04 : PRDATA <= f_rx     ;
          8'h08 : PRDATA <= e_rx     ;
	  8'h0C : PRDATA <= data_out ;

        endcase
      end
    end
  end

  baud_gen bg  (PCLK,PRESET,baud_tick);
  fifo_tx  f_t ( PCLK
    	        ,PRESET
                ,(PSEL && !PENABLE && PWRITE && (PADDR==8'h00))
                ,d_in
                ,d_out
    	        ,f_tx
    	        ,e_tx);
  uart_tx  tr  (PCLK,PRESET,baud_tick,(~e_tx),d_out,tx,busy);
  uart_rx  rv  (PCLK,PRESET,busy,baud_tick,tx,r_out,ready);
  fifo_rx  f_r ( PCLK
    		,PRESET
    		,(PSEL && !PENABLE && !PWRITE && (PADDR==8'h00))
		,ready
    		,r_out
    		,data_out
    	        ,f_rx
    		,e_rx
		,f_ready);

  
  
//  assign data_out	= d_out ;
//  assign receive 	= busy ;
//  assign rx 		= tx ;
//  assign data_in  	= r_out;
//  assign transfer       = (~e_tx) ;
//  assign w_ready        =  ready ; 
endmodule
