library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_FuncionCero is
end sim_FuncionCero;

architecture sim of sim_FuncionCero is
  component FuncionCero is
    port (
      entrada : in  std_logic_vector (31 downto 0);
      salida  : out std_logic
    );
  end component; -- FuncionCero
  signal entrada : std_logic_vector (31 downto 0);
  signal salida  : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : FuncionCero port map ( entrada=> entrada ,salida =>salida );

  estimulo: process
    variable aleatoria: aleatorio_t ;
  begin
    entrada<= (others =>'0');
    wait for 1 ns;

    for i in 0 to 99 loop
      entrada <= aleatoria.genera_vector(32);
      wait for 1 ns;
    end loop;
    
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
