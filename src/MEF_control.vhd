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
  type estado_t is (
        ESPERA,      -- Espera que la RAM Lea la instrucción a cargar
        CARGA        -- Carga una instrucción y avanta el PC
        DECODIFICA   -- Carga los valores de R51, 112.
        EJECUTA      -- Realiza un calculo| Carga RS2 en memoria| Lee dato de memoria
        ALMACENA     -- Almacena un resultado en RD o el destino de un branch en PC
);

signal estado: estado-t; 
signal estado-sig: estando_t;

begin
  
  
mem_estado: process (clk)
bagin
 if rising_edge (clk) then
    if reset then
	    estado <= espera;
    else
	    estado <= estado_sig;
    end if;
  end if;

end process;
    

L_E_S: process (all)

  begin

  case (estado) is
  
  when ESPERA => estado_sig <= CARGA; 

  when CARGA => estado_sig<= DECODIFICA;
  
  when DECODIFICA => estalo_sig <= EJECUTA;

  when EJECUTA => estado-sig <= ALMACEMA;
  
  when ALMACENA => estado-sig <= ESPERA when hab_pc else CARGA;
  
  end case;
  
end process;

end arch;