library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxProgramCounter is
    Port ( ESCR_PC : out  STD_LOGIC;
           SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
		   S_FLAG : in STD_LOGIC;
		   Operando1NOR : in STD_LOGIC;
		   Operando1MaiorPeso : in STD_LOGIC);
end muxProgramCounter;

architecture Behavioral of muxProgramCounter is

begin
	process (SEL_PC, S_FLAG, Operando1NOR, Operando1MaiorPeso)
	begin
	
		case (SEL_PC) is
			when "000" => ESCR_PC <= '0';
			when "001" => ESCR_PC <= '1';
			when "010" => ESCR_PC <= S_FLAG;
			when "011" => ESCR_PC <= Operando1NOR;
			when "100" => ESCR_PC <= Operando1MaiorPeso;
			when others => ESCR_PC  <= 'X';
		end case;
	
	end process;

end Behavioral;

