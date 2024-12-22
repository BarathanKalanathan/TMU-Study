library verilog;
use verilog.vl_types.all;
entity lab_7_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        Input           : in     vl_logic_vector(7 downto 0);
        resetn          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lab_7_vlg_sample_tst;
