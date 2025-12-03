class driver extends uvm_driver #(transaction)
  `uvm_object_utils(driver)
  
  function new(input string path = "driver" , uvm_component parent = null);
    super.new(path,parent)
  endfunction
  
  transaction tc;
  virtual mux_if m_if;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tc = transction::type_id::create("tc");
    
    if(!uvm_config_db #(virtual m_if)::get(this,"","mux_if",m_if))
      `uvm_error("DRV","UABLE TO GET ACCESS OF UVM_CONFIG_DB");
  endfunction
  
  
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      
      seq_item_port.get_next_item(tc);
      m_if.in<=tc.in;
      m_if.sel<=tc.sel;
      m_if.y<=tc.y;
      
      `uvm_info("DRV",$sformatf("Trigger DUT in:%0d, sel:%0d",tc.in,tc.sel), UVM_NONE);
      seq_item_port.item_done();
      #10;
    end
    
  endtask
endclass
