module mux_tb();
  mux_if m_if();
  
  mux_4_1 dut(.in(m_if.in),.sel(m_if.sel),.y(m_if.y));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
  
  initial begin
    uvm_config_db#(virtual mux_if)::set(null,"uvm_test_top.e.a*","m_if",m_if);
    run_test("test");
  end
  
endmodule
