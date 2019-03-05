library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity outputPeripheral is
    Port ( POUT : out  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Operando1 : in  STD_LOGIC_VECTOR (7 downto 0));
end outputPeripheral;

architecture Behavioral of outputPeripheral is

begin

	process (ESCR_P, clk, Operando1)
		begin
			if (ESCR_P = '1' and rising_edge(clk)) then
				POUT <= Operando1;
			end if;
		end process;

end Behavioral;

