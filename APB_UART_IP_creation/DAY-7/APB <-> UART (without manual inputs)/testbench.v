module testbench;
  reg            PCLK;
  reg            PRESET;
  reg            start;
  reg            PSEL;
  reg            PENABLE;
  reg            PWRITE;
  reg     [7:0]  PADDR;
  reg     [7:0]  PWDATA;
  wire    [7:0]  PRDATA;
  wire           PREADY;
  wire           ready;
  wire           f_ready;

  topmodule uut (
    PCLK, PRESET, start,
    PSEL, PENABLE, PWRITE,
    PADDR, PWDATA,
    PRDATA, PREADY, ready, f_ready
  );
  integer i;

  initial begin
    PCLK = 0;
    forever #10 PCLK = ~PCLK;
  end

  initial begin
    PRESET = 1;
    #20;
    PRESET = 0;
    start = 1;


    for (i = 0; i < 8; i = i + 1) begin
      @(posedge PCLK);//write
      PSEL    = 1;
      PENABLE = 0;
      PWRITE  = 1;
      PWDATA  = $random;              
      PADDR   = 8'h04;                
      #40;
      PADDR = 8'h00;
      @(posedge PCLK);
      PENABLE = 1;

      if (i == 0) begin
        wait (ready);
      end else begin
        wait (!ready);
        wait (ready);
      end

      @(posedge PCLK);//read
      PSEL    = 1;
      PENABLE = 0;
      PWRITE  = 0;
      PADDR   = 8'h00;

      wait (f_ready);

      #20;
      PADDR = 8'h0C;

      @(posedge PCLK);
      @(posedge PCLK);
      PENABLE = 1;

      @(posedge PCLK);
      PSEL = 0;
      PENABLE = 0;
    end
  end

  initial begin
    #50_000_000;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
  end
endmodule
