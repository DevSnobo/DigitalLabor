
`timescale 1 ns / 1 ns

module rotate_t();

reg clk, r_l, rst;
reg [7:0] data;
wire [7:0] q;

reg[7:0] q_1[32:0];
integer i;

   initial begin
      i = 0;
   end

rotate UUT( .clk(clk), .r_l(r_l), .rst(rst), .data(data), .q(q) );


  initial begin
     $display ("Begin simulation ...");
     #680 $display ("End simulation");
  end

  initial begin   // 'clk'
    repeat ( 34 )
    begin  // Patt_2
      clk = 0; #10;
      clk = 1; #10;
    end
  end  // clk

  initial begin   // 'r_l'
    r_l = 1; #160;
    r_l = 0; #160;
    r_l = 1; #320;
    r_l = 0; #40;
  end  // r_l

  initial begin   // 'rst'
    rst = 1; #35;
    rst = 0; #605;
    rst = 1; #20;
    rst = 0; #20;
  end  // rst

  initial begin   // 'data'
    data[7:0] = 8 'h 01; #60;
    data[7:0] = 8 'h 02; #60;
    data[7:0] = 8 'h 03; #40;
    data[7:0] = 8 'h 04; #40;
    data[7:0] = 8 'h 05; #40;
    data[7:0] = 8 'h f6; #40;
    data[7:0] = 8 'h 0a; #30;
    data[7:0] = 8 'h 0b; #50;
    data[7:0] = 8 'h 0c; #60;
    data[7:0] = 8 'h 07; #20;
    data[7:0] = 8 'h a8; #40;
    data[7:0] = 8 'h 0d; #40;
    data[7:0] = 8 'h 0e; #40;
    data[7:0] = 8 'h 0f; #30;
    data[7:0] = 8 'h 10; #50;
    data[7:0] = 8 'h aa; #40;
  end  // data

  
  always @(posedge clk )
  begin
     #2
     q_1[i] = {q[6:0],q[7]};
     if ( rst == 1) //rst =1
     begin
        if ( 0 == q )
            $display ("    Successful! At time %d: q = 0 when rst = 1", $time);
        else
            $display ("    Failure!    At time %d: q = ^h%h when rst = 1", $time, q);
     end
     else //rst = 0
     begin
        if ( 1 == r_l) //r_l = 1 
        begin
           if ( q == q_1[i-1] )
              $display ("    Successful! At time %d: q = q_1 = ^h%h when rst = 0 and r_l = 1", $time, q);
           else
              $display ("    Failure!    At time %d: q = ^h%h, q_1 = ^h%h when rst = 0 and r_l = 1", $time, q, q_1[i-1]);
        end
        else //r_l = 0
        begin
           if ( q == data )
              $display ("    Successful! At time %d: q = data = ^h%h when rst = 0 and r_l = 0", $time, q);
           else
              $display ("    Failure!    At time %d: q = ^h%h, data = ^h%h when rst = 0 and r_l = 0", $time, q, data);
        end
     end
     i = i + 1;
  end

endmodule // rotate_t
