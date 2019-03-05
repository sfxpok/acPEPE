library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registerBank is
    Port ( ESCR_R : in  STD_LOGIC;
           Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
           Registo_1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC);
end registerBank;

architecture Behavioral of registerBank is

begin
	process (ESCR_R, Dados_R, Registo_1, Registo_2, clk)

	variable R0 : STD_LOGIC_VECTOR (7 downto 0);
	variable R1 : STD_LOGIC_VECTOR (7 downto 0);
	variable R2 : STD_LOGIC_VECTOR (7 downto 0);
	variable R3 : STD_LOGIC_VECTOR (7 downto 0);
	variable R4 : STD_LOGIC_VECTOR (7 downto 0);
	variable R5 : STD_LOGIC_VECTOR (7 downto 0);

	begin

		if (ESCR_R = '1' and rising_edge(clk)) then
			case (Registo_1) is
				when "000" => R0 := Dados_R;
				when "001" => R1 := Dados_R;
				when "010" => R2 := Dados_R;
				when "011" => R3 := Dados_R;
				when "100" => R4 := Dados_R;
				when "101" => R5 := Dados_R;
				when others => R0 := "XXXXXXXX";
			end case;
		end if;

		case (Registo_1) is
			when "000" => Operando1 <= R0;
			when "001" => Operando1 <= R1;
			when "010" => Operando1 <= R2;
			when "011" => Operando1 <= R3;
			when "100" => Operando1 <= R4;
			when "101" => Operando1 <= R5;
			when others => Operando1 <= "XXXXXXXX";
		end case;

		case (Registo_2) is
			when "000" => Operando2 <= R0;
			when "001" => Operando2 <= R1;
			when "010" => Operando2 <= R2;
			when "011" => Operando2 <= R3;
			when "100" => Operando2 <= R4;
			when "101" => Operando2 <= R5;
			when others => Operando2 <= "XXXXXXXX";
		end case;
		
	end process;

end Behavioral;

