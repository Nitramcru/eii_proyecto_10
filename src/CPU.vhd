library IEEE;
use IEEE.std_logic_1164.all;

entity CPU is
  port (
    reset: in std_logic;
	  clk  : in std_logic;
	  dat_lectura : in std_logic_vector (31 downto 0);
	  dir: out std_logic_vector (31 downto 2);
	  dat_escritura : out std_logic_vector (31 downto 0);
	  hab_escritura: out std_logic
  );
end CPU;

architecture arch of CPU is
  Component alu is 
    Port (
        A, B : in std_logic_vector (31 downto 0); 
        sel  : in std_logic_vector (3 downto 0); 
        Y    : out std_logic_vector (31 downto 0); 
        Z    : out std_logic
        );
  end component;

  
  Component condicion_branch is
    port (
      funct3: in  std_logic_vector (2 downto 0);
      
      Z_branch : out std_logic
    );
  end component;
  
  Component Conjunto_registros is
    port (
    clk,hab_escritura: in std_logic;
    dir_escritura, dir_lectura_1 ,dir_lectura_2 :in std_logic_vector (4 downto 0);
    dat_escritura :in std_logic_vector (31 downto 0);
    dat_lectura_1, dat_lectura_2 :out std_logic_vector (31 downto 0)
    );
  end component;
   
  Component Control_alu is
    port (
      funct3   : in  std_logic_vector (2 downto 0);
      funct7_5 : in  std_logic;
      modo     : in  std_logic_vector (1 downto 0);
      fn_alu   : out std_logic_vector (3 downto 0)
    );
  end component;

  
  Component MEF_Control is
    port (
      reset, hab_pc, clk : in  std_logic;
      
      esc_pc, branch, sel_dir, esc_men, esc_instr, esc_red : out std_logic;
      sal_inmediato : out std_logic_vector (2 downto 0);
      modo_alu, sel_op1, sel_op2, sel_y : out std_logic_vector (1 downto 0)
    );
  end component;
  
  Component registro32 is
    port (
      clk : in  std_logic;
      D :   in  std_logic_vector (31 downto 0);
      hab:  in  std_logic;
      reset:  in  std_logic;
      Q :   out std_logic_vector (31 downto 0)
    );
  end component;
  
  Component valer_inmediato is
    port (
      instr : in  std_logic_vector (31 downto 7);
      sel : in  std_logic_vector (2 downto 0);
      inmediato : out std_logic_vector (31 downto 0)
    );
  end component;
  
  

-- Señales de control
signal esc_pc,branch,sel_dir,esc_mem, esc_instr, esc_reg: std_logic;
signal sel_inmediato : std_logic_vector (2 downto 0);
signal modo_alu, sel_op1, sel_op2, sel_Y: std_logic_vector (1 downto 0);


--Salidas de registros
signal pc, pc_instr, instr,Y_alu_r: std_logic_vector (31 downto 0);


--Señales del conjunto de registros (dut1 y dut 2) 
Signal rs1, rs2: std_logic_vector (31 downto 0);


--Otras señales
Signal inmediato: std_logic_vector (31 downto 0); 
Signal sel_alv: std_logic_vector (3 downto 0); 
signal z_branch, z, hab_pc : std_logic;
signal Y_alu, Y: std_logic_vector (31 downto 0);


begin
 .
 .
 .
end arch;
