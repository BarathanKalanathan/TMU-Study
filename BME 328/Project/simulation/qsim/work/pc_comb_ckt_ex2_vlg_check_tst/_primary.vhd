library verilog;
use verilog.vl_types.all;
entity pc_comb_ckt_ex2_vlg_check_tst is
    port(
        dec_rc          : in     vl_logic;
        ld_r1           : in     vl_logic;
        ld_rc           : in     vl_logic;
        shl_acc         : in     vl_logic;
        shr_acc         : in     vl_logic;
        z               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end pc_comb_ckt_ex2_vlg_check_tst;
