
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity bcd23 is
  PORT(
    clk, reset, ce : IN STD_LOGIC;
    count          : OUT STD_LOGIC_VECTOR(7 downto 0);
    ceo            : OUT STD_LOGIC);
end bcd23;



architecture mybcd23 of bcd23 is
begin
  p0 : process(clk)
    variable low  :std_logic_vector (3 downto 0) := "0000";
    variable high :std_logic_vector (3 downto 0) := "0000";
  begin
    
    if clk'Event and clk = '1' then
      -- only take action when rising edge

      if reset = '1' then
        -- reset is on
        low  := (others => '0');
        high := (others => '0');
      elsif ce = '1' then
        -- reset is off and count is on

        -- nu ska vi uppdatera po cnt
        if low = "1001" then
          -- low = 9?
          low  := "0000";
          high := high + 1;
        elsif high = "0010" and low = "0011" then
          low  := "0000";
          high := "0000";
        else
          -- annars counta som vanligt
          low  := low + 1;
        end if;

        -- nu ska vi uppdatera count enable out
        if high = "0010" and low = "0011" then
          ceo <= '1';
        else
          ceo <= '0';
        end if;


      end if;
    end if;
  count <= high & low;
  end process;
end architecture mybcd23;  
