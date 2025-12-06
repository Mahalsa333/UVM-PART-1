class sequence_00 extends uvm_sequence#(trasaction);
  `uvm_object_utils(sequence_00)
  
  transaction t;
  int ;
  
  function new(input string path ="sequence_00");
    super.new(path);
  endfunction
  
  virtual task body();
    t=transaction::type_id::create("t");
    repeat(10)
      begin
        start_item(t);
        
        t.randomize();
        
        
        `uvm_info("GEN",$sformatf("data send to driver in A:%0d,B:%0d,OPCODE=%0d,RESULT:=%0d",t.A,t.B,t.OPCODE,t.RESULT),UVM_NONE);

        finish_item(t);

      end
  endtask

endclass
