--
-- File            :   nf_instr_mem.vhd
-- Autor           :   Vlasov D.V.
-- Data            :   2019.04.19
-- Language        :   VHDL
-- Description     :   This is instruction memory module
-- Copyright(c)    :   2019 Vlasov D.V.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library nf;
use nf.nf_mem_pkg.all;

entity nf_instr_mem is
    generic
    (
        addr_w  : integer := 6;                         -- actual address memory width
        depth   : integer := 2 ** 6;                    -- depth of memory array
        init    : boolean := False;                     -- init memory?
        i_mem   : mem_t                                 -- init memory
    );
    port 
    (
        addr    : in    std_logic_vector(31 downto 0);  -- instruction address
        instr   : out   std_logic_vector(31 downto 0)   -- instruction data
    );
end nf_instr_mem;

architecture rtl of nf_instr_mem is
    -- creating instruction memory
    signal  mem : mem_t(depth-1 downto 0)(31 downto 0) := (mem_i( init , i_mem , depth ));
begin
    -- finding instruction value
    instr <= mem(to_integer(unsigned(addr(addr_w-1 downto 0))));

end rtl; -- nf_instr_mem
