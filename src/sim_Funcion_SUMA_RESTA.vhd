library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_Funcion_SUMA_RESTA is
end sim_Funcion_SUMA_RESTA;

architecture sim of sim_Funcion_SUMA_RESTA is
  component Funcion_SUMA_RESTA is
    port (
      entrada1 : in  std_logic_vector (31 downto 0);
      entrada2 : in  std_logic_vector (31 downto 0);
      Seleccion: in std_logic;
      salida : out std_logic_vector (31 downto 0)
    );
  end component; -- Funcion_SUMA_RESTA

  signal entrada1, entrada2, salida : std_logic_vector (31 downto 0);
  signal Seleccion : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : Funcion_SUMA_RESTA port map (entrada1=>entrada1, entrada2=> entrada2, Seleccion=>Seleccion, salida=>salida);

  estimulo: process
    variable aleatoria: aleatorio_t;
  begin
    
    for i in 0 to 99 loop
      entrada1 <= aleatoria.genera_vector (32);
      entrada2 <= aleatoria.genera_vector (32);
      
      Seleccion <= aleatoria.genera_bit;

      wait for 1 ns;
    
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
