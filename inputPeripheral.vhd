library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inputPeripheral is
    Port ( PIN : in  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_P : in  STD_LOGIC;
           Dados_IN : out  STD_LOGIC_VECTOR (7 downto 0));
end inputPeripheral;

architecture Behavioral of inputPeripheral is

begin

	process (ESCR_P, PIN)
		begin
			if (ESCR_P = '0') then
				Dados_IN <= PIN;
			end if;
		end process;
		
end Behavioral;

