// Code your design here
//RTL for 8 bit alu
module alu_8bit(
  
  input logic [2:0] A,B,
  input logic [2:0] OPCODE,
  output logic [7:0] RESULT,
  output bit CARRY, ZERO,OVERFLOW,UNDERFLOW
  
  );
  
  always_comb begin
  		case(OPCODE)
   				 3'b000:begin
                        {CARRY,RESULT}=A+B;
                        OVERFLOW = (A[2] == B[2]) && (RESULT[7] != A[2]);
                     end
               	 3'b001: begin	
                        {CARRY,RESULT}=A-B;
                        UNDERFLOW = (A < B);

                        // Signed overflow detection
                        OVERFLOW = (A[2] != B[2]) && (RESULT[7] != A[2]);
                        end
                3'b010: RESULT=A*B;
                3'b011: RESULT=A/B;
                3'b100: RESULT=A >> 1;
                3'b101: RESULT=A << 1;
                3'b110: RESULT=B >> 1;
                3'b111: RESULT=B << 1;
    			default : RESULT=1'bx;
      endcase
  
      
 
    ZERO=(RESULT == 4'd0);

  
  end    
      endmodule

interface alu_intf;
  logic [2:0] A,B;
  logic [2:0] OPCODE;
  logic [7:0] RESULT;
  bit CARRY, ZERO,OVERFLOW,UNDERFLOW;
  
  
endinterface
