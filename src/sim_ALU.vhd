library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.util_sim.all;
use std.env.finish;

entity sim_ALU is
end sim_ALU;

architecture sim of sim_ALU is
  component ALU is
    port (
      A, B : in  std_logic_vector (31 downto 0);
      Sel : in  std_logic_vector (3 downto 0);
      Y : out std_logic_vector (31 downto 0);
      Z : out std_logic
    );
  end component; -- ALU


  signal A_tb, B_tb : std_logic_vector (31 downto 0);
  signal Sel_tb     : std_logic_vector (3 downto 0);
  signal Y_tb       : std_logic_vector (31 downto 0);
  signal Z_tb       : std_logic;

begin
  -- Dispositivo bajo prueba
  dut : ALU
  port map (
    A   => A_tb,
    B   => B_tb,
    Sel => Sel_tb,
    Y   => Y_tb,
    Z   => Z_tb
  );

  
  excitaciones: process

  variable aleatorio : aleatorio_t;
  
  begin

    -- Caso 1: Suma de dos números
    A_tb <= aleatorio.genera_vector_en_rango(-100,100, 32) ; 
    B_tb <= aleatorio.genera_vector_en_rango(-100,100, 32) ; 

    Sel_tb <= "0000" ;

    wait for 1 ns;
    

    -- Caso 2: AND entre A y B
    A_tb <= aleatorio.genera_vector_en_rango(-100,100, 32) ; 
    B_tb <= aleatorio.genera_vector_en_rango(-100,100, 32) ; 

    Sel_tb <= "0001" ;
    
    -- Caso 3: OR entre A y B
    
    -- Caso 4: Desplazamiento a la derecha
    

    -- Caso 5: Menor entre A y B
    


      
    finish;


  end process; -- excitaciones
end sim;
