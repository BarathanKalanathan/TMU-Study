library verilog;
use verilog.vl_types.all;
entity pc_comb_ckt_ex2_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        RC              : in     vl_logic_vector(7 downto 0);
        resetn          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end pc_comb_ckt_ex2_vlg_sample_tst;
