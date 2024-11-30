library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_FuncionAND is
end sim_FuncionAND;

architecture sim of sim_FuncionAND is
  component FuncionAND is
    port (
      entrada1 : in  std_logic_vector (31 downto 0);
      entrada2 : in  std_logic_vector (31 downto 0);
      salida : out std_logic_vector (31 downto 0)
    );
  end component; -- FuncionAND
  signal entrada1 : std_logic_vector (31 downto 0);
  signal entrada2 : std_logic_vector (31 downto 0);
  signal salida : std_logic_vector (31 downto 0);
begin
  -- Dispositivo bajo prueba
  dut : FuncionAND port map (entrada1=>entrada1, entrada2=>entrada2, salida=>salida);

  estimulo: process
    variable aleatoria: aleatorio_t;
  begin
    entrada1 <= (others =>'0');
    entrada2 <= (others =>'0');
    
    wait for 1 ns;

    for i in 0 to 99 loop
      entrada1 <= aleatoria.genera_vector(32);
      entrada2 <= aleatoria.genera_vector(32);
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;