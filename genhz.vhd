library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity genhz is
  PORT(
    clk      : IN STD_LOGIC;
    hz1, hz2 : OUT STD_LOGIC);
end;

architecture genhz_bhv of genhz is
begin
  p0 : process(clk)
    variable counter :std_logic_vector (21 downto 0) := (others => '0');
  begin
    hz1 <= '0';
    hz2 <= '0';
    if clk'Event and clk = '1' then
        counter := counter + 1;
        if counter = 500000 then
            hz2 <= '1';
        elsif counter = 1000000 then
            hz1 <= '1';
            hz2 <= '1';
            counter := (others => '0');
        end if;
    end if;
  end process;
end architecture ;  

