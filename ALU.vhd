library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity ALU is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (3 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (7 downto 0);
           COMP_FLAG : out  STD_LOGIC_VECTOR (4 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process (Operando1, Operando2, SEL_ALU)
	variable varCOMP0, varCOMP1, varCOMP2, varCOMP3, varCOMP4 : STD_LOGIC;
		begin
			case (SEL_ALU) is
				when "0000" => Resultado <= Operando1 + Operando2;
				when "0001" => Resultado <= Operando1 - Operando2;
				when "0010" => Resultado <= Operando1 and Operando2;
				when "0011" => Resultado <= Operando1 nand Operando2;
				when "0100" => Resultado <= Operando1 or Operando2;
				when "0101" => Resultado <= Operando1 nor Operando2;
				when "0110" => Resultado <= Operando1 xor Operando2;
				when "0111" => Resultado <= Operando1 xnor Operando2;
				
				when "1000" => 
				if (Operando1 = Operando2) then
					varCOMP0 := '1'; else varCOMP0 := '0'; end if;
				if (Operando1 < Operando2) then
					varCOMP1 := '1'; else varCOMP1 := '0'; end if;
				if (Operando1 <= Operando2) then
					varCOMP2 := '1'; else varCOMP2 := '0'; end if;
				if (Operando1 >= Operando2) then
					varCOMP3 := '1'; else varCOMP3 := '0'; end if;
				if (Operando1 > Operando2) then
					varCOMP4 := '1'; else varCOMP4 := '0'; end if;

				when others => Resultado <= "XXXXXXXX"; COMP_FLAG <= "XXXXX";

			end case;

			COMP_FLAG <= (varCOMP4 & varCOMP3 & varCOMP2 & varCOMP1 & varCOMP0);
		end process;

end Behavioral;

