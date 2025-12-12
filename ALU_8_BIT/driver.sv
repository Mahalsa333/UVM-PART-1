class driver extends uvm_driver #(transaction);
  `uvm_component(driver)
  
  function new(input string inst = "DRV" ,uvm_component = null);
    super.new(path,parent);
  endfunction
  
  transaction tc;
  virtual alu_intf a_if;//a_if is the handle for interface
  
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tc=transaction::type_id::create("tc");
    
    if(!uvm_config_db #(virtual alu_if)::get(this,"","a_if",a_if))
      `uvm_error("DRV ","Unable to access uvm_config_db");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(tc);
      a_if.A<=tc.A;//if we use non blockin then because its giving stimuli are applied on the correct positive clock edge, especially for sequential circuits  wheras if we use blocking assignment operrator would not wait for the valid cloack edge, which could cause unexpected 

//trumb rule
      //use non-blocking assignments(<=) when you assiging to the interface
      
      a_if.B<=tc.B;
      a_if.OPCODE<=tc.OPCODE;
      `uvm_info("DRV",$sformatf("Trigger DUT A:%0d,B:%0d,OPCODE:%0d",tc.A,tc.B,tc.OPCODE),UVM_NONE);
      seq_item_port.item_done();
      #10;
      
    end
  endtask
endclass
