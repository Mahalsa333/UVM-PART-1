`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
  rand logic [2:0] A,B;
  rand logic [2:0] OPCODE;
  rand bit [7:0] RESULT;
  `uvm_object_utils(transaction);
  
  function new(input string path="transaction");
    super.new(path);
  endfunction
  `uvm_object_utils_begin(transaction);
   	`uvm_field_utils_int(A,UVM_DEFAULT);
 	`uvm_field_utils_int(B,UVM_DEFAULT);
  	`uvm_field_utils_int(OPCODE,UVM_DEFAULT);
  	`uvm_field_utils_int(RESULT,UVM_DEFAULT);
  `uvm_object_utils_end
  
  
endclass
