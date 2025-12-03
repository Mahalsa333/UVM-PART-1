class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp #(transaction,scoreboard) recv;
  
  transaction tr;
  
  function new(input string path="scoreboard",uvm_component parent = null);
    super.new(path,parent);
    recv=new("recv",this);
  endfunction
  
  
  virtual function void buils_phase(uvm_phase phase);
    super.build_phase(phase);
    tr=transaction::type_id::create("tr");
    endfunction
  
  virtual function void write(input transaction t);
    tr=t;
    `uvm_info("sco",$sformatf("DATA RCVD FROM MONITOR in:%0d, sel:%0d, and y=%0d",tr.in,tr.sel,tr.y),UVM_NONE);
    //golden algorithm
    
   function bit golden_mux(bit [3:0] in, bit [1:0] sel);
    case(sel)
      2'b00: return in[0];
      2'b01: return in[1];
      2'b10: return in[2];
      2'b11: return in[3];
      default: return 1'b0;
    endcase
  endfunction

  // Write method called by monitor
  function void write(mux_transaction tr);
    bit expected;
    expected = golden_mux(tr.in, tr.sel);
    
    
      if (expected !== tr.y)
      `uvm_error("MUX_SCB", $sformatf("Mismatch! sel=%b in=%b expected=%0b got=%0b",
          tr.sel, tr.in, expected, tr.y))
    else
      `uvm_info("MUX_SCB", "MATCH!", UVM_LOW);
  endfunction

endclass
    
