library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use std.env.finish;

entity sim_CPU is
end sim_CPU;

architecture sim of sim_CPU is
  component CPU is
    port (

      reset : in  std_logic;
      clk : in  std_logic;
      dat_lectura : in  std_logic_vector (31 downto 0);

      dir : out std_logic (31 downto 2);
      dat_escritura : out std_logic (31 downto 0);
      hab_escritura : out std_logic

    );
  end component; -- CPU
  signal entradas : std_logic_vector (1 downto 0);
  signal salida : std_logic;
begin
  -- Dispositivo bajo prueba
  dut : CPU port map (A=>entradas(1),B=>entradas(0),Y=>salida);

  excitaciones: process
  begin
    for i in 0 to (2**entradas'length)-1 loop
      entradas <= std_logic_vector(to_unsigned(i,entradas'length));
      wait for 1 ns;
    end loop;
    wait for 1 ns; -- Espera extra antes de salir
    finish;
  end process; -- excitaciones
end sim;