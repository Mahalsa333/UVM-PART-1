class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)//registering into factory
  
  uvm_analysis_port #(transaction) send;
  
  function new(input string inst ="monitor", uvm_component parent = null);
    super.new(path,parent);
    send=new("send",this);
  endfunction
  
  
  transaction t;
  virtual alu_if a_if;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    t=transaction::type_id::create("t");
    if(!uvm_config_db #(virtual alu_if)::get(this,"","a_if",aif))
      `uvm_error("MON","Um=nable to access uvm_config_db",UVM_NONE);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      #10;
      t.A=a_if.A;
      t.B=a_if.B;
      t.OPCODE=a_if.OPCODE;
      `uvm_info("MON",$sformatf("DATA send to scoreboard A:%0d B=%0d and OPCODE:%0d",t.A,t.B,t.OPCODE),UVM_NONE);
      send.write(t);
    end
  endtask
endclass
