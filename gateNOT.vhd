library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateNOT is
    Port ( A : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end gateNOT;

architecture Behavioral of gateNOT is

begin
    process(A)
    begin

        Z <= not A;

    end process;

end Behavioral;

