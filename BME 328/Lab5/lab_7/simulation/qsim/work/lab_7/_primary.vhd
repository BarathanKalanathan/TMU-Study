library verilog;
use verilog.vl_types.all;
entity lab_7 is
    port(
        output          : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        Input           : in     vl_logic_vector(7 downto 0);
        resetn          : in     vl_logic
    );
end lab_7;
