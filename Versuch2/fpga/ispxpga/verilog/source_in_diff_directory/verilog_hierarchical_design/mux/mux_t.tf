// Verilog HDL test fixture file

`timescale 1 ps / 1 ps

// Define Module for Test Fixture

module mux_t();

reg [7:0] a;
reg [7:0] b;
reg sel;
wire [7:0] out;

mux UUT( .a(a), .b(b), .sel(sel), .out(out) );

  initial begin
    $display ("Begin simulation ...");
    #94000 $display ("End simulation");
  end

  initial begin   // 'a'
    a[7:0] = 8 'h 01; #10000;
    a[7:0] = 8 'h 02; #9500;
    a[7:0] = 8 'h 03; #10000;
    a[7:0] = 8 'h 04; #10500;
    a[7:0] = 8 'h 05; #10000;
    a[7:0] = 8 'h 06; #10000;
    a[7:0] = 8 'h 07; #10000;
    a[7:0] = 8 'h 08; #10500;
    a[7:0] = 8 'h 09; #9500;
    a[7:0] = 8 'h 0a; #10000;
  end  // a

  initial begin   // 'b'
    b[7:0] = 8 'h 06; #10000;
    b[7:0] = 8 'h 07; #9500;
    b[7:0] = 8 'h 08; #10500;
    b[7:0] = 8 'h 09; #10000;
    b[7:0] = 8 'h 0a; #10000;
    b[7:0] = 8 'h 0b; #10000;
    b[7:0] = 8 'h 0c; #10000;
    b[7:0] = 8 'h 0d; #10000;
    b[7:0] = 8 'h 0e; #10000;
    b[7:0] = 8 'h 0f; #9500;
  end  // b

  initial begin   // 'sel'
    sel = 1; #50000;
    sel = 0; #50000;
  end  // sel


always @( sel or a or b )
begin
 #2000 ;
 if ( 1 == sel )
 begin
    if ( out[7:0] == a[7:0] ) 
        $display ("    Successfull! At time %d:  out = a = ^h%h when sel == 1", $time, a);
    else
        $display ("    Failure!     At time %d:  out = %h, a = ^h%h when sel == 1",$time, out, a);
 end
 else
 begin
    if ( out[7:0] == b[7:0] ) 
        $display ("    Successfull! At time %d:  out = b = ^h%h when sel == 0", $time, a);
    else
        $display ("    Failure!     At time %d:  out = %h, b = ^h%h when sel == 0", $time, out, b);
 end
end

endmodule // mux_t
