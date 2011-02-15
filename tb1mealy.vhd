library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity tb1mealy is
port ( u    : OUT STD_LOGIC;
       q,qp : OUT STD_LOGIC_VECTOR(1 downto 0)
    );
end Entity;

Architecture tb1mealy_bhv of tb1mealy is
component mealy
    port( clk,reset : IN STD_LOGIC;
          x         : IN STD_LOGIC_VECTOR(1 downto 0);
          u         : OUT STD_LOGIC;
          q,qp      : OUT STD_LOGIC_VECTOR(1 downto 0)
        );
end component;

Signal clk   : STD_LOGIC := '0';
Signal reset : STD_LOGIC;
Signal x     : STD_LOGIC_VECTOR(1 downto 0);

begin
  u1  : mealy PORT MAP(clk, reset, x, u, q, qp);
  clk <= not clk after 100ns;
  reset <= '1', '0' after 425ns;
  
  x <= "00",
       "11" after 1250ns,
       "10" after 1450ns,
       "01" after 1850ns;
       
  
end Architecture;