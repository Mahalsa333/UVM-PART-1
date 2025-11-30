// Code your testbench here
// or browse Examples
`include "uvm_macros.svh"
import uvm_pkg::*;
class sequence_00 extends uvm_sequence #(transaction)
  `uvm_object_utils(sequence_00)
  
  transaction t;
  integer i;
  
  function new(input string path="sequence_00");
    super.new(path);
  endfunction
  
  virtual task body();
    t= transacxtion::type_id::create("t2");
    repeat(4)
      begin
        start.item(t);
        assert(t2.randomize() with {sel == 2'b00;})
          else `uvm_error("SEL==0","RANDOMIZATION FAILED")
            `uvm_info("SEL_00",sformat("in=%b sel=%b",t2.in,t2.sel),UVM_MEDIUM)
            
            finish_item(t2);
      end
  endtask
endclass

