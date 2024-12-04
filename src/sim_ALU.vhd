library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
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
  begin
    -- Caso 1: Suma de dos números
   
    

    -- Caso 2: AND entre A y B
    
    

    -- Caso 3: OR entre A y B
    

    -- Caso 4: Desplazamiento a la derecha
    

    -- Caso 5: Menor entre A y B
    

   
    wait for 10 ns;
    
    finish;
  end process; -- excitaciones
end sim;
