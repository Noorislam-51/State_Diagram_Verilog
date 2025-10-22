

module moore_machine_001(det,inp,clk,reset);
  input clk,reset,inp;
  output reg det;
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg [1:0] pr_state,nxt_state;
//   sequantial 
  always@(posedge clk)
    if(reset)
      pr_state <= s0;
  	else 
      pr_state <= nxt_state;
// Combinational block: next state logic
always @(*) begin
    case(pr_state)
        s0: if(inp) nxt_state = s0; else nxt_state = s1;
        s1: if(inp) nxt_state = s0; else nxt_state = s2;
        s2: if(inp) nxt_state = s3; else nxt_state = s2;
        s3: if(inp) nxt_state = s0; else nxt_state = s1;
        default: nxt_state = s0;
    endcase
end

// Combinational block: output logic (Moore)
always @(*) begin
    case(pr_state)
        s0: det = 0;
        s1: det = 0;
        s2: det = 0;  // Moore output depends only on state
        s3: det = 1;
        default: det = 0;
    endcase
end
endmodule 






