library verilog;
use verilog.vl_types.all;
entity pc_comb_ckt_ex2 is
    port(
        clock           : in     vl_logic;
        resetn          : in     vl_logic;
        RC              : in     vl_logic_vector(7 downto 0);
        z               : out    vl_logic_vector(3 downto 0);
        dec_rc          : out    vl_logic;
        ld_r1           : out    vl_logic;
        ld_rc           : out    vl_logic;
        shl_acc         : out    vl_logic;
        shr_acc         : out    vl_logic
    );
end pc_comb_ckt_ex2;
