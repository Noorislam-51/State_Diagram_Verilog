`timescale 1ns/1ns
`include "mealy_machine_001.v"
module mealy_machine_001_tb;
reg inp, clk,reset;
wire det;
 mealy_machine_001 mealy_machine_001_1 (
    .det(det),
    .inp(inp),
    .clk(clk),
    .reset(reset)
  );
always #5 clk =~clk;
  initial begin 
  $dumpfile("mealy_machine_001.vcd");
  $dumpvars(0,mealy_machine_001_tb);
    $monitor("Time=%0t | reset = %b |inp=%b | det=%b | state=%b", $time,reset, inp, det, mealy_machine_001_1.pr_state);
  clk= 0;
  reset=1;
  inp = 0;
      // Release reset after 10sec reset = 0
    #10 reset = 0;
   // Sequence: 0 0 1 0 0 1 1
   #10 inp = 0;
   #10 inp = 0;
   #10 inp = 1;
   #10 inp = 0;
   #10 inp = 0;
   #10 inp = 1;
   #10 inp = 1;
   #10 $finish;
   end
   endmodule

   