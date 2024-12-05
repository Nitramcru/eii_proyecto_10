library IEEE;
use IEEE.std_logic_1164.all;

entity ALU is
  port (
    A, B : in  std_logic_vector (31 downto 0);
    Sel : in  std_logic_vector (3 downto 0);
    Y : out std_logic_vector (31 downto 0);
    Z : out std_logic
  );
end ALU;

architecture arch of ALU is
  Component fn_cero is
    Port (
    A: in std_logic_vector (31 downto 0);
    Z: out std_logic
    );
    end component;

  Component fn_and is
    Port (
    A, B: in std_logic_vector (31 downto 0);
    Y: out std_logic_vector (31 downto 0)
    );
    end component;

  Component fn_Suma_resta is
	  Port (
    A,B: in std_logic_vector (31 downto 0); 
    resta: in std_logic;
    Y : out std_logic_vector (31 downto 0)
    );
    end component;

  Component fn_desp_der is
    Port (
    A: in std_logic_vector (31 downto 0);
    B: in std_logic_vector (4 downto 0);
    con_signo: in std_logic;
    Y: out std_logic_vector (31 downto 0)
    );
    end component;

    y_and, y_or, y_xor, y_suma_resta: std_logic_vector (31 downto 0);
    y_menor, y_desp_izq, y_desp_der, y_Sel : std_logic_vector (31 downto 0);
    resta, menor_con_signo, desp_con_signo: std_logic;
    
begin
  
  U1: fn_suma_resta port map (
	    A=>A, B=>B, resta => resta, Y=>Y_suma_resta);

  U2: fn_desp_izq port map( 
      A=>A, B=B(4 downto 0), Y=>Y_desp_izq );

  U3: fn_menor port map(
    A=>A, B=>B, con_signo => menor_con_signo, Y=>Y_menor (0)); 
    Y_menor (31 downto 1) <= (other => '0');

  U4: fn_desp_der port map (A=>A, B=>B (4 downto 0) 
	    con_signo=> desp_con_signo, Y => Y_con_signo);

  U5: fn_xor port map (A=>A, B=>B, Y => Y_xor); 

  U6: fn_or port map (A=>A, B=>B, Y => Y_or); 

  U7: fn_and port map (A=>A, B=>B, Y => Y_and);

  with sel select
  y_sel <= y_suma_resta when "0000" | "0001";
           y_desp_izq   when "0010" | "0011";
           y_menor      when "0100" | "0101" | "0110" | "0111";
           y_desp_der   when "1010" | "1011";	
	         y_xor        when "1000" | "1001";	
	         y_or         when "1100" | "1101";	
           y_and        when others; -- 1110 1111	



  U8: fn_cero port map (A=> Y_sel, z=>z);
      resta => sel (0) ;
      menor_con_signo <= not sel (1);
      desp_con_signo <= sel (0);

 

end arch;
