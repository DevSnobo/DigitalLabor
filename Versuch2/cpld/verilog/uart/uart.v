//
// Copyright (c) 1992,1993,1994, Exemplar Logic Inc. All rights reserved.
//
//
// Description :
//    This Verilog HDL description implements a UART.
//
//     Version 1.1 : Original Creation
//             2.1 : added comments
//


module uart (clkx16, read, write, rx, reset, tx, rxrdy, txrdy, 
             parityerr, framingerr, overrun, data);

input          clkx16;		// Input clock. 16x bit clock
input            read;		// Received data read strobe
input           write;		// Transmit data write strobe
input	      rx;		// Receive  data line
input	   reset;		// clear dependencies
output	      tx;		// Transmit data line
output           rxrdy;		// Received data ready to be read
output           txrdy;		// Transmitter ready for next byte
output       parityerr;		// Receiver parity error
output      framingerr;		// Receiver framing error
output         overrun;		// Receiver overrun error 
inout       [0:7] data; // Bidirectional data bus

reg	      tx;		// Transmit data line
reg         overrun;		// Receiver overrun error 
reg      framingerr;		// Receiver framing error
reg       parityerr;		// Receiver parity error

// Transmit data holding register
    wire [0:7] txhold ;

// Transmit shift register bits
    reg [0:7] txreg;
    reg      txtag2  ;		// tag bits for detecting 
    reg      txtag1  ;		//    empty shift reg
    reg    txparity  ;		// Parity generation register

// Transmit clock and control signals
    reg       txclk  ;       	// Transmit clock: 1/16th of clkx16
    wire      txdone  ;		// 1'b1 when shifting of byte is done
    wire paritycycle  ;		// 1'b1 on next to last shift cycle
    reg   txdatardy  ;       	// 1'b1 when data is ready in txhold

// Receive shift register bits
    reg [0:7] rxhold;   // Holds received data for read
    reg [0:7] rxreg;   // Receive data shift register
    reg    rxparity  ;		// Parity bit of received data
    reg   paritygen  ;		// Generated parity of received data
    reg      rxstop  ;		// Stop bit of received data

// Receive clock and control signals
    reg       rxclk  ;		// Receive data shift clock
    reg      rxidle  ;       	// 1'b1 when receiver is idling
    reg   rxdatardy  ;       	// 1'b1 when data is ready to be read


reg [2:0] cnt;


// Toggle txclk every 8 counts, which divides the clock by 16

always @(posedge clkx16)
   begin
	if (reset)
	    txclk = 1'b0;
	else if (cnt == 3'b000)  
	    txclk = !txclk; 

	if (reset)
	    cnt = 3'b000;
	else
	    cnt = cnt + 1;
    end

reg [0:3] rxcnt;      // Count of clock cycles
reg rx1, hunt;        //rx delayed one cycle,  Hunting for start bit


always @(posedge clkx16)
begin
// rxclk = clkx16 divided by 16 
        rxclk = rxcnt[0];

// Hunt=1 when we are looking for a start bit:
//   A start bit is eight clock times with rx=0 after a falling edge 

	if (reset)
	    hunt = 1'b0;
	else if (rxidle && !rx && rx1 ) 
// Start hunting when idle and falling edge is found
	    hunt = 1'b1;
	else if (!rxidle || rx ) 
// Stop hunting when shifting in data or a 1 is found on rx
	    hunt = 1'b0;

	rx1 = rx;	// rx delayed by one clock for edge detection
			// (Must be assigned AFTER reference)

// Increment count when not idling or when hunting
	if (!rxidle || hunt) 
	    // Count clocks when not rxidle or hunting for start bit
	    rxcnt = rxcnt + 1;
	else
	    // hold at 1 when rxidle and waiting for falling edge
	    rxcnt = 4'b0001;
end

always @(posedge txclk)
begin
	if (txdone && txdatardy)
	    begin
	    // Initialize registers and load next byte of data
	    txreg    = txhold;	// Load tx register from txhold
	    txtag2   = 1'b1;	// Tag bits for detecting 
	    txtag1   = 1'b1;	//    when shifting is done
	    txparity = 1'b1;	// Parity bit. Initializing to 1 = odd parity
	    tx       = 1'b0;	// Start bit
            end
	else
	    begin
	    // Shift data
	    // bug in assigning to slices
	    // txreg(0 TO 6) = txreg(1 TO 7);
	    // txreg(7)      = txtag1;
	    txreg 	= {txreg[1 : 7], txtag1};
	    txtag1      = txtag2;
	    txtag2	= 1'b0;

	    // Form parity as each bit goes by
	    txparity      = txparity ^ txreg[0];

	    // Shift out data or parity bit or stop/idle bit
	    if (txdone )
		tx = 1'b1;	// stop/idle bit
	    else if (paritycycle)
		tx = txparity;	// Parity bit
	    else
		tx = txreg[0];	//Shift data bit
	    end
end

// paritycycle = 1 on next to last cycle (When txtag2 has reached txreg(1))
//   (Enables putting the parity bit out on tx)
assign    paritycycle = txreg[1] && !(txtag2 || txtag1 || 
				     txreg[7] || txreg[6] || txreg[5] || 
				     txreg[4] || txreg[3] || txreg[2]);

// txdone = 1 when done shifting [When txtag2 has reached tx]
assign    txdone = !(txtag2 || txtag1 ||
		  txreg[7] || txreg[6] || txreg[5] || txreg[4] || 
		  txreg[3] || txreg[2] || txreg[1] || txreg[0]);

// Shift data on each rxclk when not idling
always @(posedge rxclk)
  begin 
	if (rxidle)
	    // Load all ones when idling
	    begin
	    rxreg = 8'b11111111;
	    rxparity = 1'b1;
	    paritygen = 1'b1;	// Odd parity
	    rxstop = 1'b0;
	    end
	else
	    // Shift data when not idling
	    // bug in assigning to slices
	    // rxreg (0 TO 6) = rxreg (1 TO 7);
	    // rxreg(7) = rxparity;
	    begin
	    rxreg = {rxreg [1 : 7], rxparity};
	    rxparity = rxstop;
	    paritygen = paritygen ^ rxstop;	// Form parity as data shifts by
	    rxstop = rx;
            end
   end

    
// rxidle requires async preset since it is clocked by rxclk and  
// its value determines whether rxclk gets generated 
always @(posedge rxclk or posedge reset)
    begin
        if (reset)
           rxidle = 1'b0;
        else 
           rxidle = !rxidle && !rxreg[0];
    end

// Load txhold and set txdatardy on falling edge of write
// Clear txdatardy on falling edge of txdone
	reg wr1,wr2;	// write signal delayed 1 and 2 cycles
	reg txdone1;        // txdone signal delayed one cycle
always @(posedge clkx16)
    begin
	if (reset)
	    txdatardy = 1'b0;
	else if (!wr1 &&  wr2)
	    // Falling edge on write signal. New data in txhold latches
	    txdatardy  = 1'b1;
	else if (!txdone &&  txdone1)
	    // Falling edge on txdone signal. Txhold has been read.
	    txdatardy  = 1'b0;

	// Delayed versions of write and txdone signals for edge detection
	wr2 = wr1;
	wr1 = write;
	txdone1 = txdone;
    end 

	reg rd1, rd2 ;	// Read input delayed 1 and 2 cycles
	reg rxidle1  ;	// rxidle signal delayed 1 cycle
always @(posedge clkx16)
    begin

	// Look for rising edge on idle and update output registers
	if (rxidle && !rxidle1)
	begin
	    if (rxdatardy)
		// Overrun error if previous data is still there
		overrun = 1'b1;
	    else
		begin
		// No overrun error since holding register is empty
		overrun = 1'b0;

		// Update holding register
		rxhold = rxreg;

		// paritygen = 1 if parity error
		parityerr = paritygen;

		// Framingerror if stop bit is not 1
		framingerr =  !rxstop;

		// Signal that data is ready for reading
		rxdatardy = 1'b1;
	        end
	end
	rxidle1 = rxidle;	// rxidle delayed 1 cycle for edge detect

	//  Clear error and data registers when data is read
	if (!rd2 &&  rd1)
	    begin 
	    rxdatardy  = 1'b0;
	    parityerr  = 1'b0;
	    framingerr = 1'b0;
	    overrun    = 1'b0;
	    end 
	rd2 = rd1;	// Edge detect for read
	rd1 = read;	// (Must be assigned AFTER reference)
	if (reset) 
	    rxdatardy = 1'b0;
    end

// Drive data bus only during read
assign    data = read ?  rxhold : 8'bzzzzzzzz;

// Latch data bus during write
assign    txhold = write ? data : txhold;

// Receive data ready output signal
assign    rxrdy = rxdatardy;

// Transmitter ready for write when no data is in txhold
assign    txrdy = !txdatardy;


endmodule
