-- Inlamningsuppgift 1.4
-- Fredrik Brosser
-- 901230-4011 
-- Chalmers D2
-- Linux/PC/Chalmers

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY bcd59 IS
    PORT(
    clk 	: IN STD_LOGIC;
    reset	: IN STD_LOGIC;
    ce		: IN STD_LOGIC;
    count	: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ceo		: OUT STD_LOGIC);
END bcd59;

ARCHITECTURE bcd59_bhv OF bcd59 IS
begin
  P0 : Process(clk)
  constant zero : std_logic_vector(3 downto 0) := (others=>'0');
  variable low_bits : std_logic_vector(3 downto 0) := zero;
  variable high_bits : std_logic_vector(3 downto 0) := zero;
  begin
    if clk'Event and clk = '1' then
      if reset = '1' then 
        low_bits := zero;
        high_bits := zero;
        ceo <= '0';
      elsif ce = '1' then
        if low_bits = 9 then
          low_bits := zero;
          high_bits := high_bits + 1;
        else
          low_bits := low_bits + 1;
        end if; -- low bits
        
        if high_bits > 5 then
          high_bits := zero;
        end if; -- high bits 
      end if; -- ce
      
      if low_bits = 9 and high_bits = 5 then
        ceo <= '1';
      else
        ceo <= '0';
      end if; -- ceo
      
    end if; -- clk
    count <= high_bits & low_bits;
  end process;
END ARCHITECTURE bcd59_bhv;
