library verilog;
use verilog.vl_types.all;
entity pc_comb_ckt_ex1 is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        rc              : in     vl_logic_vector(7 downto 0);
        z               : out    vl_logic_vector(3 downto 0);
        ld_r1           : out    vl_logic;
        ld_rc           : out    vl_logic;
        dec_rc          : out    vl_logic;
        shl_acc         : out    vl_logic;
        shr_acc         : out    vl_logic
    );
end pc_comb_ckt_ex1;
