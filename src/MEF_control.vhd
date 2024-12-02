library IEEE;
use IEEE.std_logic_1164.all;

entity MEF_control is
  port (
    reset, hab_pc, clk : in  std_logic;
    
    esc_pc, branch, sel_dir, esc_men, esc_instr, esc_red : out std_logic;
    sal_inmediato : out std_logic_vector (2 downto 0);
    modo_alu, sel_op1, sel_op2, sel_y : out std_logic_vector (1 downto 0)
  );
end MEF_control; 

architecture arch of MEF_control is
begin
  Y <= A and B;
end arch;
