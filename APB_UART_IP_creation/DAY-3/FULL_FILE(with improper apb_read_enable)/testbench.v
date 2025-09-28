module testbench;
  reg            PCLK;
  reg            PRESET;

  reg            PSEL;
  reg            PENABLE;
  reg            PWRITE;
  reg     [7:0]  PADDR;
  reg     [7:0] PWDATA;
  wire    [7:0] PRDATA;
  wire           PREADY;



  topmodule uut(PCLK,PRESET,PSEL,PENABLE,PWRITE,PADDR,PWDATA,PRDATA,PREADY);

  initial begin
    PCLK = 0;
    forever #10 PCLK = ~PCLK ;
  end
  initial begin
    PRESET = 1;
    #20;
    PRESET  = 0;

    //write
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
    
    //read
    @(posedge PCLK);
    PSEL    = 1;
    PENABLE = 0;
    PWRITE  = 0;

    PADDR   = 8'h00;
    @(posedge PCLK) 
    PENABLE = 1;
    
      
    @(posedge PCLK);
    PENABLE = 0;
    PSEL    = 0;
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
