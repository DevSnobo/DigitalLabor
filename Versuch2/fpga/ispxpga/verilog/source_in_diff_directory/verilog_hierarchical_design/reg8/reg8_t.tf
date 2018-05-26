
`timescale 1 ns / 1 ns

module reg8_t();

reg rst, clk;
reg [7:0] data;
wire [7:0] q;

// Instantiate the top Level Block

reg8 UUT( .rst(rst), .clk(clk), .data(data), .q(q) );

  initial begin
    $display ("Begin simulation ...");
    #640 $display ("End simulation");
  end

  initial begin   // 'rst'
    rst = 1; #20;
    rst = 0; #100;
  end  // rst

  initial begin   // 'clk'
    repeat ( 32 )
    begin  
      clk = 0; #10;
      clk = 1; #10;
    end
  end  // clk

  initial begin   // 'data'
    data[7:0] = 8 'h 01; #20;
    data[7:0] = 8 'h 02; #20;
    data[7:0] = 8 'h 03; #20;
    data[7:0] = 8 'h 04; #20;
    data[7:0] = 8 'h 05; #20;
    data[7:0] = 8 'h 06; #20;
    data[7:0] = 8 'h 07; #20;
    data[7:0] = 8 'h 08; #20;
    data[7:0] = 8 'h 09; #20;
    data[7:0] = 8 'h 0a; #20;
    data[7:0] = 8 'h 0b; #20;
    data[7:0] = 8 'h 0c; #20;
    data[7:0] = 8 'h 0d; #20;
    data[7:0] = 8 'h 0e; #20;
    data[7:0] = 8 'h 0f; #20;
    data[7:0] = 8 'h 11; #20;
    data[7:0] = 8 'h a0; #20;
    data[7:0] = 8 'h bf; #20;
    data[7:0] = 8 'h c4; #20;
    data[7:0] = 8 'h d5; #20;
    data[7:0] = 8 'h e6; #20;
    data[7:0] = 8 'h f7; #20;
    data[7:0] = 8 'h a8; #20;
    data[7:0] = 8 'h 9a; #20;
    data[7:0] = 8 'h 8f; #20;
  end  // data

always @(posedge clk)
begin
    #2;
    if ( rst == 1 )  //rst = 1
    begin
        if ( 0 == q )
            $display ("    Successful! At time %d: q = 0 when rst = 1", $time);
        else
            $display ("    Failure!    At time %d: q = ^h%h, not expected 0", $time,q);
    end
    else //rst = 0
        if ( q == data )
            $display ("    Successful! At time %d: q = data = ^h%h when rst = 0", $time, data);
        else
            $display ("    Failure!    At time %d  q = ^h%h, data = ^h%h when rst = 0",$time,  q, data);
    begin
    end
end

endmodule // reg8_t
