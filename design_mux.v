module mux_4_1(
  input  [3:0] in,      // 4 inputs: in[0]..in[3]
  input  [1:0] sel,     // 2-bit select
  output reg  y         // reg because assigned in always block
);

  always @(*) begin
    case (sel)
      2'b00: y = in[0];
      2'b01: y = in[1];
      2'b10: y = in[2];
      2'b11: y = in[3];
      default: y = 1'b0;   // or 1'bx if you want "unknown"
    endcase
  end
//test
endmodule


