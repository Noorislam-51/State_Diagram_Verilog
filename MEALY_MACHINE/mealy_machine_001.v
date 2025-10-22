module mealy_machine_001(det,inp,clk,reset);
  input clk,reset,inp;
  output reg det;
  parameter s0=2'b00,s1=2'b01,s2=2'b10;
  reg [1:0] pr_state,nxt_state;
//   sequantial 
  always@(posedge clk)
    if(reset)
      pr_state <= s0;
  	else 
      pr_state <= nxt_state;
//   combinational
  always @(*)
    case(pr_state)
      s0:begin 
        if (inp)
           nxt_state = s0;
        else nxt_state= s1;
          det=0;
      end
      // s1:if (inp) nxt_state = s0;
      //   else nxt_state= s2;
      s1:begin 
        if (inp)
           nxt_state = s0;
        else nxt_state= s2;
          det=0;
      end
      s2:begin 
        if (inp)begin
           nxt_state = s0;
           det=1;
        end
        else nxt_state= s2;   
      end
      default: begin
      nxt_state= s0;
      det=0;
      end
     endcase

endmodule 




