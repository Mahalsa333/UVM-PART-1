`include "uvm_macros.svh"
import uvm_pkg::*;

class sequence_random extends uvm_sequence #(transaction)
  `uvm_object_utils(sequence_random)

  transaction t;
  integer i;

  function new(input string path="sequence_random");
    super.new(path);
  endfunction

  virtual task body();

    t=transaction::type_id::create("t");
    repeat(10)
      begin
        start_item(t);

        t.randomize();

        `uvm_info("GEN",$sformatf("data send to driver in :%0d, sel:%0d",t.in,t.sel),UVM_NONE);

        finish_item(t);

      end
  endtask

endclass
