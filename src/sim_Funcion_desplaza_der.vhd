library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;
use work.util_sim.all;

entity sim_Funcion_desplaza_der is
end sim_Funcion_desplaza_der;

architecture sim of sim_Funcion_desplaza_der is
  component Funcion_desplaza_der is
    port (
      A         : in  std_logic_vector (31 downto 0);
      B         : in  std_logic_vector (4 downto 0);
      con_signo : in std_logic;
      Y         : out std_logic_vector (31 downto 0)
    );
  end component; -- Funcion_desplaza_der
  signal entradaA, salida : std_logic_vector (31 downto 0);
  signal entradaB : std_logic_vector (2 downto 0);
  signal con_signo : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : Funcion_desplaza_der port map (A=>entradaA,B=>entradaB,con_signo=>con_signo,Y=>salida);

  excitaciones: process
  variable aleatorio : aletorio_t;
  begin
    for i in 0 to 99 loop
      entradaA <= aleatorio.genera_vector(32);
      entradaB <= aleatorio.genera_vector(5);
      con_signo <= aleatorio.genera_bit;
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;