library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_Funcion_desplaza_izq is
end sim_Funcion_desplaza_izq;

architecture sim of sim_Funcion_desplaza_izq is
  component Funcion_desplaza_izq is
    port (
      A         : in  std_logic_vector (31 downto 0);
      B         : in  std_logic_vector (4 downto 0);
      Y         : out std_logic_vector (31 downto 0)
    
    );
  end component; -- Funcion_desplaza_izq
  signal entradaA, salida : std_logic_vector (31 downto 0);
  signal salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : Funcion_desplaza_izq port map (A=>entradasA,B=>entradasB,Y=>salida);


  excitaciones: process
  variable aleatorio : aletorio_t;
  begin
    for i in 0 to 99 loop
      entradaA <= aleatorio.genera_vector(32);
      entradaB <= aleatorio.genera_vector(5);
      
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;
