class env extends uvm_env;
  `uvm_component_utils(env)
  
  scoreboard s;
  agent a;
  function new(input string inst="ENV",uvm_component c);
    super.new(inst,c);
  endfunction
  
  
  virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  s = scoreboard::type_id::create("s", this);
  a = agent::type_id::create("a", this);
endfunction

  

  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    a.m.send.connect(s.recv);
  endfunction
  
  
