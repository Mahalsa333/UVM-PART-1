`include "uvm_macros.svh"
import uvm_pkg::*;

class transaction extends uvm_sequence_item;
  rand bit [3:0] in;
  rand bit [1:0] sel;
  bit y;
  
  
  function new(input string path = "transaction");
    super.new(path);
    endfunction
    
  //we need to add field macros to the transcrtion  because we plan to use inbuilt  transaction core methods o0f ucm we need to use macros below
  
  `uvm_object_utils_begin(transaction);//class
  `uvm_field_int(in,UVM_DEFAULT)
  `uvm_field_int(sel,UVM_DEFAULT)
  `uvm_object_utils_end
  
endclass


