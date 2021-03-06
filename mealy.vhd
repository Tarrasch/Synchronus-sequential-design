library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;



entity mealy is
  PORT(
    clk, reset : IN STD_LOGIC;
    x          : IN STD_LOGIC_VECTOR(1 downto 0);
    u          : OUT STD_LOGIC;
    q, qp      : OUT STD_LOGIC_VECTOR(1 downto 0)
);
end entity; 


architecture mealy_bhv of mealy is
    signal qn, qpn : STD_LOGIC_VECTOR(1 downto 0);
begin
  clocked : process(clk)
  begin
    if clk'Event and clk = '1' then -- only take action when rising edge
        if reset = '1' then
            qn <= "00";
        else
            qn <= qpn;
        end if;
    end if; -- end clock-if
  end process;

  --comb : process(qn, x)
  --begin
      qpn(0) <= x(0) nor x(1);
      qpn(1) <= ((qn(0) and (not x(1))) and (not x(0))) or (qn(1) and qn(0) and x(1) and x(0));
      u <= not (qn(1) and (not qn(0)) and x(1) and (not x(0)));
  --end process;

  qp <= qpn;
  q <= qn;
end architecture ;  
    

