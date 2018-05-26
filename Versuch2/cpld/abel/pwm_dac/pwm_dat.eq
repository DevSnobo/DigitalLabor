Magma 1.0.13.50

Design pwmdac created  Wed Dec 13 13:50:44 2000

Title:  Pulse width modulated Digital to Analog converter

 P-Terms   Fan-in  Fan-out  Type  Name (attributes)
---------  ------  -------  ----  -----------------
   5          5        1    PinX1  pwm.X1 
   1          2        1    PinX2  pwm.X2 
   1          8        1    Pin   load 
   1          1        1    Node  r7.D 
   1          1        1    Node  r7.C 
   1          1        1    Node  r6.D 
   1          1        1    Node  r6.C 
   1          1        1    Node  r5.D 
   1          1        1    Node  r5.C 
   1          1        1    Node  r4.D 
   1          1        1    Node  r4.C 
   1          1        1    Node  r3.D 
   1          1        1    Node  r3.C 
   1          1        1    Node  r2.D 
   1          1        1    Node  r2.C 
   1          1        1    Node  r1.D 
   1          1        1    Node  r1.C 
   1          1        1    Node  r0.D 
   1          1        1    Node  r0.C 
   1          1        1    Node  cntr1>q0.AR 
   1          1        1    Node  cntr1>q0.D 
   1          1        1    Node  cntr1>q0.C 
   1          1        1    Node  cntr1>q1.AR 
   2          2        1    Node  cntr1>q1.D 
   1          1        1    Node  cntr1>q1.C 
   1          1        1    Node  cntr1>q2.AR 
   3          3        1    Node  cntr1>q2.D 
   1          1        1    Node  cntr1>q2.C 
   1          1        1    Node  cntr1>q3.AR 
   4          4        1    Node  cntr1>q3.D 
   1          1        1    Node  cntr1>q3.C 
   1          4        1    NodeX1  cntr1>q4.D.X1 
   1          1        1    NodeX2  cntr1>q4.D.X2 
   1          1        1    Node  cntr1>q4.AR 
   1          1        1    Node  cntr1>q4.C 
   1          5        1    NodeX1  cntr1>q5.D.X1 
   1          1        1    NodeX2  cntr1>q5.D.X2 
   1          1        1    Node  cntr1>q5.AR 
   1          1        1    Node  cntr1>q5.C 
   1          6        1    NodeX1  cntr1>q6.D.X1 
   1          1        1    NodeX2  cntr1>q6.D.X2 
   1          1        1    Node  cntr1>q6.AR 
   1          1        1    Node  cntr1>q6.C 
   1          7        1    NodeX1  cntr1>q7.D.X1 
   1          1        1    NodeX2  cntr1>q7.D.X2 
   1          1        1    Node  cntr1>q7.AR 
   1          1        1    Node  cntr1>q7.C 
   9          8        1    NodeX1  CARRY@1.X1 
   1          2        1    NodeX2  CARRY@1.X2 
   5          5        1    NodeX1  CARRY@2.X1 
   1          2        1    NodeX2  CARRY@2.X2 
=========
  73                 P-Term Total: 73
                       Total Pins: 13
                      Total Nodes: 18
            Average P-Term/Output: 1


Equations:

pwm.X1 = (!r6.Q & CARRY@2
     # !r6.Q & cntr1>q6.Q
     # CARRY@2 & cntr1>q6.Q
     # !r7.Q & cntr1>q7.Q
     # r7.Q & !cntr1>q7.Q);

pwm.X2 = (r7.Q & !cntr1>q7.Q);

load = (!cntr1>q0.Q & cntr1>q1.Q & !cntr1>q2.Q & cntr1>q3.Q & cntr1>q4.Q & cntr1>q5.Q & cntr1>q6.Q & cntr1>q7.Q);

r7.D = (d7);

r7.C = (rclk);

r6.D = (d6);

r6.C = (rclk);

r5.D = (d5);

r5.C = (rclk);

r4.D = (d4);

r4.C = (rclk);

r3.D = (d3);

r3.C = (rclk);

r2.D = (d2);

r2.C = (rclk);

r1.D = (d1);

r1.C = (rclk);

r0.D = (d0);

r0.C = (rclk);

cntr1>q0.AR = (clr);

cntr1>q0.D = (!cntr1>q0.Q);

cntr1>q0.C = (clk);

cntr1>q1.AR = (clr);

cntr1>q1.D = (!cntr1>q0.Q & cntr1>q1.Q
     # cntr1>q0.Q & !cntr1>q1.Q);

cntr1>q1.C = (clk);

cntr1>q2.AR = (clr);

cntr1>q2.D = (!cntr1>q0.Q & cntr1>q2.Q
     # !cntr1>q1.Q & cntr1>q2.Q
     # cntr1>q0.Q & cntr1>q1.Q & !cntr1>q2.Q);

cntr1>q2.C = (clk);

cntr1>q3.AR = (clr);

cntr1>q3.D = (!cntr1>q0.Q & cntr1>q3.Q
     # !cntr1>q1.Q & cntr1>q3.Q
     # !cntr1>q2.Q & cntr1>q3.Q
     # cntr1>q0.Q & cntr1>q1.Q & cntr1>q2.Q & !cntr1>q3.Q);

cntr1>q3.C = (clk);

cntr1>q4.D.X1 = (cntr1>q0.Q & cntr1>q1.Q & cntr1>q2.Q & cntr1>q3.Q);

cntr1>q4.D.X2 = (cntr1>q4.Q);

cntr1>q4.AR = (clr);

cntr1>q4.C = (clk);

cntr1>q5.D.X1 = (cntr1>q0.Q & cntr1>q1.Q & cntr1>q2.Q & cntr1>q3.Q & cntr1>q4.Q);

cntr1>q5.D.X2 = (cntr1>q5.Q);

cntr1>q5.AR = (clr);

cntr1>q5.C = (clk);

cntr1>q6.D.X1 = (cntr1>q0.Q & cntr1>q1.Q & cntr1>q2.Q & cntr1>q3.Q & cntr1>q4.Q & cntr1>q5.Q);

cntr1>q6.D.X2 = (cntr1>q6.Q);

cntr1>q6.AR = (clr);

cntr1>q6.C = (clk);

cntr1>q7.D.X1 = (cntr1>q0.Q & cntr1>q1.Q & cntr1>q2.Q & cntr1>q3.Q & cntr1>q4.Q & cntr1>q5.Q & cntr1>q6.Q);

cntr1>q7.D.X2 = (cntr1>q7.Q);

cntr1>q7.AR = (clr);

cntr1>q7.C = (clk);

CARRY@1.X1 = (!r2.Q & cntr1>q2.Q
     # !r3.Q & cntr1>q3.Q
     # r3.Q & !cntr1>q3.Q
     # !r1.Q & !r2.Q & cntr1>q1.Q
     # !r1.Q & cntr1>q1.Q & cntr1>q2.Q
     # !r1.Q & !r0.Q & !r2.Q & cntr1>q0.Q
     # !r0.Q & !r2.Q & cntr1>q0.Q & cntr1>q1.Q
     # !r1.Q & !r0.Q & cntr1>q0.Q & cntr1>q2.Q
     # !r0.Q & cntr1>q0.Q & cntr1>q1.Q & cntr1>q2.Q);

CARRY@1.X2 = (r3.Q & !cntr1>q3.Q);

CARRY@2.X1 = (!r4.Q & CARRY@1
     # !r4.Q & cntr1>q4.Q
     # CARRY@1 & cntr1>q4.Q
     # !r5.Q & cntr1>q5.Q
     # r5.Q & !cntr1>q5.Q);

CARRY@2.X2 = (r5.Q & !cntr1>q5.Q);


Reverse-Polarity Equations:

