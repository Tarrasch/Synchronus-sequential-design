-- Fredrik Brosser 901230-4011
-- Arash Rouhani 901117-1213
-- Clock.vhd
-- LAB3 Syntes

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity clock is
  port( clk       :   in    std_logic;
  	     switches  :	  in    std_logic_vector(7 downto 0);
	      reset     :   in    std_logic;
	      display   :   out   std_logic_vector(7 downto 0)
  );
end Entity clock;

Architecture clock_bhv of clock is
        
-- Minut- och Sekundcounter
Component bcd59
  port (  clk 	: IN STD_LOGIC;
          reset	: IN STD_LOGIC;
          ce		: IN STD_LOGIC;
          count	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
          ceo		: OUT STD_LOGIC
    );
end component;

-- Timcounter
Component bcd23
 port(    clk, reset, ce : IN STD_LOGIC;
          count          : OUT STD_LOGIC_VECTOR(7 downto 0);
          ceo            : OUT STD_LOGIC
    );
end component;

-- Klockpulsgenerator
Component genhz
  port(
      clk      : IN STD_LOGIC;
      hz1, hz2 : OUT STD_LOGIC
    );
end component;

signal hz1 : STD_LOGIC;
signal hz2 : STD_LOGIC;
signal h,m,s : STD_LOGIC_VECTOR(7 downto 0);
signal ceo_h, ceo_m, ceo_s : STD_LOGIC;
signal ce_h, ce_m, ce_s : STD_LOGIC;

begin
  hz_gen  : genhz PORT MAP(clk, hz1, hz2);
  h_cnt  : bcd23 PORT MAP(hz1, reset, ce_h, h, ceo_h);
  m_cnt  : bcd59 PORT MAP(hz1, reset, ce_m, m, ceo_m);
  s_cnt  : bcd59 PORT MAP(hz1, reset, ce_s, s, ceo_s);
  
  ce_s <=  hz1   or (hz2 and switches(5));
  ce_m <=  ceo_s or (hz2 and switches(6));
  ce_h <=  ceo_m or (hz2 and switches(7));
  
displayProcess : process(switches(4), switches(3), switches(2)) 
begin
  if switches(4) = '1' then
    display <= h;
  elsif switches(3) = '1' then
    display <= m;
  else
    display <= s;
  end if;
end process;
  
-- outputta display till display  
  
end Architecture clock_bhv;
