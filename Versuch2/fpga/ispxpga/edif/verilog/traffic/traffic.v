//
// Copyright (c) 1992,1993,1994,1995 Exemplar Logic Inc. All rights reserved.
//
//
// This is a typical example of a state machine description 
// in Verilog HDL.
//   Two always statements, one to update the state on a clock plus
//   or reset, and one to calculate the next state and
//   the outputs in a case statement
//
// State encoding is done by setting the parameters (st0...st7)
// to explicit integer values.
//
//  Run CORE with option -full and -parallel to indicate that
//   the case statement is specifies all possible values and
//   that they are all mutually exclusive.
//
// This description implements a traffic light controller
//
//     Version 1.1 : Original Creation
//             2.1 : Added comments
//             2.2 : Added hold terms to state 0 & 4 to 
//                   remove latches

module traffic (clock, reset, sensor1, sensor2,
	  red1, yellow1, green1, red2, yellow2, green2);

input clock, reset, sensor1, sensor2;
output  red1, yellow1, green1, red2, yellow2, green2;
parameter st0 = 0, st1 = 1, st2 = 2, st3 = 3,
	  st4 = 4, st5 = 5, st6 = 6, st7 = 7;

reg [2:0] state, nxstate ;
reg red1, yellow1, green1, red2, yellow2, green2;

// Update the state with the next state on the clock edge
// or reset value.

always @(posedge clock or posedge reset)
begin
    if (reset) 
	state = st0 ;
    else
	state = nxstate;
end


// 
// Calculate the next state and the outputs,
// based on the present state and the inputs
//

always @(state or sensor1 or sensor2)
begin
     // Default values for the outputs
    red1 = 1'b0; yellow1 = 1'b0; green1 = 1'b0;
    red2 = 1'b0; yellow2 = 1'b0; green2 = 1'b0;

    case (state)
	st0: begin
	    green1 = 1'b1;
	    red2 = 1'b1;
	    if (sensor2 == sensor1) 
		nxstate = st1;
	    else if (~sensor1 & sensor2) 
		nxstate = st2;
            else 
                nxstate = st0;
        end
	    
	st1: begin 
	    green1 = 1'b1;
	    red2 = 1'b1;
	    nxstate = st2;
        end

	st2: begin 
	    green1 = 1'b1;
	    red2 = 1'b1;
	    nxstate = st3;
        end

	st3: begin 
	    yellow1 = 1'b1;
	    red2 = 1'b1;
	    nxstate = st4;
        end

	st4: begin 
	    red1 = 1'b1;
	    green2 = 1'b1;
	    if (~sensor1 & ~sensor2) 
		nxstate = st5;
	    else if (sensor1 & ~sensor2) 
		nxstate = st6;
            else
                nxstate = st4;
        end
	    
	st5: begin 
	    red1 = 1'b1;
	    green2 = 1'b1;
	    nxstate = st6;
        end
	
	st6: begin 
	    red1 = 1'b1;
	    green2 = 1'b1;
	    nxstate = st7;
        end
	
	st7: begin 
	    red1 = 1'b1;
	    yellow2 = 1'b1;
	    nxstate = st0;
        end
    endcase
end
endmodule
