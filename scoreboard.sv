class scoreboard extends uvm_component;
  `uvm_component_utils(scoreboard)

  uvm_analysis_imp #(transaction, scoreboard) recv;

  function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
    recv = new("recv", this);
  endfunction

  // Called when monitor sends a transaction
  function void write(transaction tr);
    bit expected;

    case (tr.sel)
      2'b00: expected = tr.in[0];
      2'b01: expected = tr.in[1];
      2'b10: expected = tr.in[2];
      2'b11: expected = tr.in[3];
      default: expected = 1'b0;
    endcase

    if (tr.y !== expected)
      `uvm_error("SCO",
                 $sformatf("Mismatch: in=%0b sel=%0b y=%0b exp=%0b",
                           tr.in, tr.sel, tr.y, expected))
    else
      `uvm_info("SCO",
                $sformatf("PASS: in=%0b sel=%0b y=%0b",
                          tr.in, tr.sel, tr.y),
                UVM_LOW)
  endfunction
endclass
