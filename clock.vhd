library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity clock is
  port( clk       :   in    std_logic;
  	     switches  :	  in    std_logic_vector(2 downto 0);
	      reset     :   in    std_logic;
  );
end Entity clock;

Architecture clock_bhv of clock is
        
Component bcd59
  port (  clk 	: IN STD_LOGIC;
          reset	: IN STD_LOGIC;
          ce		: IN STD_LOGIC;
          count	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          ceo		: OUT STD_LOGIC);
    );
end component;

Component bcd23
  port (  clk      : 

begin
  h_gen  : counter PORT MAP(clk, reset, lbsdet, lbsc);
  h_cnt  : counter PORT MAP(clk, fc, reset, pbdet, lbdet, lbsdet);
  m_cnt  : counter PORT MAP(clk, reset, switches(1),  pbc, ceo);
  s_cnt  : counter PORT MAP(clk, reset, lbdet,  lbc);
  
  
end Architecture clock_bhv;
