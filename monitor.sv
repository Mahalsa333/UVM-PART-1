class moniotor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  
  uvm_anlysis_port #(transaction) send;
  
  function new(input string path = "monitor" , uvm_component parent = null);
    super.new(path,parent);
    send=new("send",this)
  endfunction
  
  transaction t;
  virtual mux_if m_if;
  
  virtual function void buils_phase(uvm_phase phase);
    super.build_phase(phase);
    t= transaction::type_id::create("t");
    
    if(!uvm_config_db #(virtual mux_if)::get(this,"","mux_if",mux_if))

      `uvm_error("MON","UABLE TO ACCESS UVM_CONFIG_DB");
  endfunction
  
  virtual task run_phase(uvm_phase phase)
    forever begin
      #10;
      t.in=m_if.in;
      t.sel=m_if.sel;
      t.y=m_if.y;
      `uvm_info("MON",$sformatf("Data send to scoreboard in: %0d, sel:%0d, y=%0d",t.in,t.y,t.sel),UVM_NONE);
      
      send.write(t);
    end
  endtask
endclass

