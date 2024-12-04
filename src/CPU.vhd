library IEEE;
use IEEE.std_logic_1164.all;

entity CPU is
  port (
    A : in  std_logic;
    B : in  std_logic;
    Y : out std_logic
  );
end CPU;

architecture arch of CPU is
begin
  Y <= A and B;
end arch;
