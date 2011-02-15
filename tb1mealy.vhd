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
  Signal reset : STD_LOGIC := '1';
  Signal x     : STD_LOGIC_VECTOR(1 downto 0);

begin
  u1  : mealy PORT MAP(
    clk => clk, 
    reset => reset,
    x => x,
    u => u,
    q => q,
    qp => qp
  );
    
  clk <= not clk after 100 ns;
  reset <= '1', '0' after 425 ns;
  
  process
  begin

    x <= "00";
    wait for  425 ns;
    wait for 225 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "11";
    wait for 200 ns;

    x <=  "10";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "00";
    wait for 400 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "11";
    wait for 200 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "11";
    wait for 200 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "11";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "00";
    wait for 1200 ns;

    x <=  "00";
    wait for 200 ns;

    x <=  "11"; 
    wait for 200 ns;

    x <=  "10";
    wait for 1200 ns;
    
    wait;
  end process;
  
  
end Architecture;