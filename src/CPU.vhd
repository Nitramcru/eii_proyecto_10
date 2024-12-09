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

signal op1, op2: std_logic_vector (31 downto 0);

begin
  hab_pc <= esc_pc or (branch and (Z xnor Z_branch));

  R_pc: registro 32 port map (
          clk=> clk,
          reset=> reset,
          hab => hab_pc,
          D=> Y,
          Q=> рс
      );
  
  dir <= PC when sel_dir='0' else Y;
  
  hab_escritura <= esc_mem;
  dat_escritura <= rs2;
  
  R_pc_instr: registro32 port map ( 
      clk => clk, 
      reset => '0', 
      hab => esc_instr,
      D => pc,
      Q => pc_instr
  );

  R_instr: registro 32 port map(
      clk => clk,
      reset => '0',
      hab => esc_instr,
      D => dat_lectura, 
      Q=> instr
  );

  U_Control: MEF_control port map(

      clk           => clk,
      reset         => reset,
      hab_pc        => hab_pc,
      op            => instr(6 downto 0),
      esc_pc        => esc_pc,
      branch        => branch,
      sel_dir       => sel_dir,
      esc_mem       => esc_mem,
      esc_instr     => esc_instr,
      esc_reg       => esc_reg,
      sel_inmediato => sel_inmediato,
      modo_alu      => modo_alu,
      sel_op1       => sel_op1,
      sel_op2       => sel_op2,
      sel_Y         => sel_Y
  );


u_registros: conjunto_registros port map (
	clk=>clk
	dir-1 => instr (19 downto 15),
	dir_2 => instr (24 downto 20),
	dir_escritura => instr (11 downto 7),
	hab_escritura => esc_reg,
	dat_escritura => Y,
	dat-1=> rs1,
	dat_2=> rs2
	);

U_inmediato: valor_inmediato port map (
		instr => instr (31 downto 7),
		sel => sel_inmediato,
		inmediato => inmediato
);


u_sel_alu: control_alu port_map (
	funct3 => instr (14 downto 12),
	funct7_5 =>  instr(30),
	modo => modo_alu,
	fn_alu=> sel_alu
);


U_Z_branch: condicion_branch port map(
	    funct3 => instr(14 downto 12),
	    z_branch => Z_branch
);


mux_op1: with sel_op1 select
	op1 <= pc when "00",
	       pc_instr when "01",
	       rs1  when others; --10


-- end mux_op1

mux_op2: with sel_op2 select
  op1 <= rs2 when "00",
  inmediato when "01",
  32x"4" when others; -- 10

--end mux_op2

u_alv: al
port map (
A
=>
Op 1,
B
→
0121
Sel
⇒
sel-alv,
Y_alv,
Y
Z
R-y-alvor: registro 32 port map
clk clk, reser '0', '1',
yol,
D
→ Y.alv,
→ Y-aw.r
);
mux_y: with
sel. Y select
YE dat - lectura when "00",
Y-ah
when "01",
Y-alu-r
when others;
--
10
-- end mux-y
end arch;
u_alv: al
port map (
A
=>
Op 1,
B
→
0121
Sel
⇒
sel-alv,
Y_alv,
Y
Z
R-y-alvor: registro 32 port map
clk clk, reser '0', '1',
yol,
D
→ Y.alv,
→ Y-aw.r
);
mux_y: with
sel. Y select
YE dat - lectura when "00",
Y-ah
when "01",
Y-alu-r
when others;
--
10
-- end mux-y
end arch;
u_alv: al
port map (
A
=>
Op 1,
B
→
0121
Sel
⇒
sel-alv,
Y_alv,
Y
Z
R-y-alvor: registro 32 port map
clk clk, reser '0', '1',
yol,
D
→ Y.alv,
→ Y-aw.r
);
mux_y: with
sel. Y select
YE dat - lectura when "00",
Y-ah
when "01",
Y-alu-r
when others;
--
10
-- end mux-y
end arch;

u_alv: alu port map (
	A => op1,
	B => op2,
	sel =>sel_alu,
	Y =>Y_alv,
	Z=> Z
);

R_y_alu_r: registro 32 port map(
	clk => clk, 
	reset => '0',
 	rob =>'1',
	D => Y_alu,
	q => Y_alu_r
);


mux_y: with sel_Y select
  Y <= dat_lectura when "00",
             Y_alu when "01",
           Y_alu_r when others;--10
-- end mux_y
end arch;


end arch;
