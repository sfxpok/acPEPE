library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity programCounter is
    Port ( clk : in  STD_LOGIC;
           Endereco : out  STD_LOGIC_VECTOR (7 downto 0);
           ESCR_PC : in  STD_LOGIC;
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Reset : in  STD_LOGIC);
end programCounter;

architecture Behavioral of programCounter is

begin
	process (clk)
	variable enderecoActual : STD_LOGIC_VECTOR (7 downto 0);
	
	begin
		if (rising_edge(clk)) then
		
			if (ESCR_PC = '0') then
				enderecoActual := enderecoActual + 1;
			else
				enderecoActual := Constante;
			end if;
			
			if (Reset = '1') then
				enderecoActual := "00000000";
			end if;
			
			Endereco <= enderecoActual;
			
		end if;
			
	end process;

end Behavioral;

