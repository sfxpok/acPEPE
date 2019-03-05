library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM;

architecture Behavioral of RAM is

begin

	process(clk)
	type memory is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	variable memoryData : memory;
	
	begin
	
		if (WR = '0') then
			Dados_M <= memoryData(TO_INTEGER(unsigned(Constante)));
		else
			if (rising_edge(clk)) then
				memoryData(TO_INTEGER(unsigned(Constante))) := Operando1;
			end if;
		end if;
		
	end process;

end Behavioral;

