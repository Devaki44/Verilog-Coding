module testbench;
  reg            PCLK;
  reg            PRESET;
  reg 		 start;
  reg            PSEL;
  reg            PENABLE;
  reg            PWRITE;
  reg     [7:0]  PADDR;
  reg     [7:0] PWDATA;
  wire    [7:0] PRDATA;
  wire           PREADY;
  wire 		 ready;
  wire           f_ready;
  
  topmodule uut(PCLK,PRESET,start,PSEL,PENABLE,PWRITE,PADDR,PWDATA,PRDATA,PREADY,ready,f_ready);

  initial begin
    PCLK = 0;
    forever #10 PCLK = ~PCLK ;
  end
  initial begin
    PRESET = 1;
    #20;
    PRESET  = 0;
    start   = 1;

//11111111111111111111111111111111111111111111111111111

    //WRITE//
    @(posedge PCLK)
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 1;
    PWDATA  = 8'hD4;
    PADDR   = 8'h04;
    #40;
    PADDR   = 8'h00; 
    @(posedge PCLK) 
    PENABLE = 1;
    

    //READ//  
    wait(ready)
    @(posedge PCLK);
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 0;

    PADDR   = 8'h00;
    wait(f_ready)

    #20;
    PADDR   = 8'h0C;
    @(posedge PCLK)
    @(posedge PCLK) 
    PENABLE = 1;
      
    // @(posedge PCLK);
    //PENABLE = 0;
    //PSEL    = 0;


//2222222222222222222222222222222222222222222222222

    //WRITE//
    @(posedge PCLK)
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 1;
    PWDATA  = 8'he5;
    PADDR   = 8'h04;
    #40;
    PADDR   = 8'h00; 
    @(posedge PCLK)
    PENABLE = 1;
    
  
    //fifo_rx(write)
    wait(!ready)
    wait(ready)
    @(posedge PCLK);
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 0;

    PADDR   = 8'h00;

    wait(f_ready)
    @(posedge PCLK)
    PADDR   = 8'h0C;
    @(posedge PCLK)
    PENABLE = 1;
    
       
   //@(posedge PCLK);
   // PENABLE = 0;
   // PSEL    = 0;
   

//333333333333333333333333333333333333333333333333

    //WRITE//
    @(posedge PCLK)
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 1;
    PWDATA  = 8'ha1;
    PADDR   = 8'h04;
    #40;
    PADDR   = 8'h00; 
    @(posedge PCLK)
    PENABLE = 1;
    
  
    //fifo_rx(write)
    wait(!ready)
    wait(ready)
    @(posedge PCLK);
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 0;

    PADDR   = 8'h00;

    wait(f_ready)
    @(posedge PCLK)
    PADDR   = 8'h0C;
    @(posedge PCLK)
    PENABLE = 1;
    
       
   //@(posedge PCLK);
   // PENABLE = 0;
   // PSEL    = 0;

  end
  initial begin
    #5000_000;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
