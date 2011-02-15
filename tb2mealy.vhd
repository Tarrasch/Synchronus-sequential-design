library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity tb2mealy is
port ( testok : OUT STD_LOGIC := 'H');
end Entity;

Architecture tb2mealy_bhv of tb2mealy is
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
  Signal u     : STD_LOGIC;
  Signal q,qp  : STD_LOGIC_VECTOR(1 downto 0);
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
    wait for 425 ns;
    wait for 225 ns;

    if q /= "01" then
      testok <= '0';
      report "Error at time 650";
    end if;
    
    x <=  "00";
    wait for 200 ns;

    if q /= "11" then
      testok <= '0';
      report "Error at time 850";
    end if;

    x <=  "00";
    wait for 200 ns;

    if q /= "11" then
      testok <= '0';
      report "Error at time 1050";
    end if;

    x <=  "00";
    wait for 200 ns;

    if q /= "11" then
      testok <= '0';
      report "Error at time 1250";
    end if;

    x <=  "11";
    wait for 200 ns;

    if q /= "10" then
      testok <= '0';
      report "Error at time 1450";
    end if;

    x <=  "10";
    wait for 10 ns;

    if u /= '0' then
      testok <= '0';
      report "Error 'u' at time 1460";
    end if;

    -- Now wait for clock pulse
    wait for 190 ns;

    if q /= "00" or u /= '1' then
      testok <= '0';
      report "Error at time 1650";
    end if;

    x <=  "01";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 1850";
    end if;

    x <=  "01";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    x <=  "01";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 2450";
    end if;

    x <=  "00";
    wait for 400 ns;

    -- Note: we will go through 01 before coming to 11
    if q /= "11" then
      testok <= '0';
      report "Error at time 2850";
    end if;

    x <=  "01";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 3050";
    end if;

    x <=  "01";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 3250";
    end if;

    x <=  "00";
    wait for 200 ns;

    if q /= "01" then
      testok <= '0';
      report "Error at time 3450";
    end if;

    x <=  "11";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 3650";
    end if;

    x <=  "00";
    wait for 200 ns;

    if q /= "01" then
      testok <= '0';
      report "Error at time 3850";
    end if;

    x <=  "11";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 4050";
    end if;

    x <=  "00";
    wait for 200 ns;

    if q /= "01" then
      testok <= '0';
      report "Error at time 4250";
    end if;

    x <=  "11";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 4450";
    end if;

    x <=  "01";
    wait for 200 ns;

    if q /= "00" then
      testok <= '0';
      report "Error at time 4650";
    end if;

    x <=  "00";
    wait for 1200 ns;

    if q /= "11" then
      testok <= '0';
      report "Error at time 5850";
    end if;

    x <=  "00";
    wait for 200 ns;

    if q /= "11" then
      testok <= '0';
      report "Error at time 6050";
    end if;

    x <=  "11"; 
    wait for 200 ns;

    if q /= "10" then
      testok <= '0';
      report "Error at time 6250";
    end if;

    x <=  "10";
    wait for 10 ns;

    if u /= '0' then
      testok <= '0';
      report "Error 'u' at time 6260";
    end if;

    wait for 1190 ns;
    
    if q /= "00" or u /='1'
    then
      testok <= '0';
      report "Error at time 7450";
    end if;

    wait;
  end process;
  
  
end Architecture;
