//Design code
module prog_cnt(
        input clk,rst,
        input load,
        input [3:0]data_in,
        input up_down,
        output reg [3:0]count);
always@(posedge clk)begin
if(rst)begin
        count <= 4'b0000 ;
end
else if(load)begin
        count <= data_in ;
end
else begin
        if(up_down)
                count <= count+1;
        else
                count <= count-1;
end
end
endmodule


//Testbench
module prog_cnt_tb;
        reg clk,rst;
        reg load;
        reg [3:0]data_in;
        reg up_down;
        wire [3:0]count;
prog_cnt uut(clk,rst,load,data_in,up_down,count);
initial begin
        clk=1'b0;
        forever #5 clk=~clk ;
end
initial begin
        rst=1;load=1;data_in=4'b1011;up_down=1;#10;
        rst=0;load=1;data_in=4'b1101;up_down=1;#10;
        rst=0;load=0;data_in=4'b1101;up_down=1;#50;
        rst=0;load=0;data_in=4'b1101;up_down=0;#50;
        $finish;
end
initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
end
initial begin
        $monitor("$time=%0t,clk=%b,rst=%b,load=%b,data_in=%b,up_down=%b,count=%b",$time,clk,rst,load,data_in,up_down,count);
end
endmodule



//OUTPUT
$time=0,clk=0,rst=1,load=1,data_in=1011,up_down=1,count=xxxx
$time=5,clk=1,rst=1,load=1,data_in=1011,up_down=1,count=0000
$time=10,clk=0,rst=0,load=1,data_in=1101,up_down=1,count=0000
$time=15,clk=1,rst=0,load=1,data_in=1101,up_down=1,count=1101
$time=20,clk=0,rst=0,load=0,data_in=1101,up_down=1,count=1101
$time=25,clk=1,rst=0,load=0,data_in=1101,up_down=1,count=1110
$time=30,clk=0,rst=0,load=0,data_in=1101,up_down=1,count=1110
$time=35,clk=1,rst=0,load=0,data_in=1101,up_down=1,count=1111
$time=40,clk=0,rst=0,load=0,data_in=1101,up_down=1,count=1111
$time=45,clk=1,rst=0,load=0,data_in=1101,up_down=1,count=0000
$time=50,clk=0,rst=0,load=0,data_in=1101,up_down=1,count=0000
$time=55,clk=1,rst=0,load=0,data_in=1101,up_down=1,count=0001
$time=60,clk=0,rst=0,load=0,data_in=1101,up_down=1,count=0001
$time=65,clk=1,rst=0,load=0,data_in=1101,up_down=1,count=0010
$time=70,clk=0,rst=0,load=0,data_in=1101,up_down=0,count=0010
$time=75,clk=1,rst=0,load=0,data_in=1101,up_down=0,count=0001
$time=80,clk=0,rst=0,load=0,data_in=1101,up_down=0,count=0001
$time=85,clk=1,rst=0,load=0,data_in=1101,up_down=0,count=0000
$time=90,clk=0,rst=0,load=0,data_in=1101,up_down=0,count=0000
$time=95,clk=1,rst=0,load=0,data_in=1101,up_down=0,count=1111
$time=100,clk=0,rst=0,load=0,data_in=1101,up_down=0,count=1111
$time=105,clk=1,rst=0,load=0,data_in=1101,up_down=0,count=1110
$time=110,clk=0,rst=0,load=0,data_in=1101,up_down=0,count=1110
$time=115,clk=1,rst=0,load=0,data_in=1101,up_down=0,count=1101
prog_cnt_tb.v:17: $finish called at 120 (1s)
$time=120,clk=0,rst=0,load=0,data_in=1101,up_down=0,count=1101
