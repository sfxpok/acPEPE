library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodeROM is
    Port ( opcode : in  STD_LOGIC_VECTOR (4 downto 0);
           SEL_PC : out  STD_LOGIC_VECTOR (2 downto 0);
           SEL_F : out  STD_LOGIC_VECTOR (2 downto 0);
           ESCR_F : out  STD_LOGIC;
           SEL_ALU : out  STD_LOGIC_VECTOR (3 downto 0);
           ESCR_R : out  STD_LOGIC;
           SEL_R : out  STD_LOGIC_VECTOR (1 downto 0);
           ESCR_P : out  STD_LOGIC;
           WR : out  STD_LOGIC;
           Registo_1 : in  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : in  STD_LOGIC_VECTOR (2 downto 0));
end decodeROM;

architecture Behavioral of decodeROM is

begin
    process (opcode)
    begin

        case (opcode) is

            -- Periféricos
            when "00000" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "10"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- LDP Ri
            when "00001" => SEL_ALU <= "XXXX"; ESCR_P <= '1'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- STP Ri

            -- Leitura e Escrita
            when "00010" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "00"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- LD Ri, constante
            when "00011" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "01"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- LD Ri, [constante]
            when "00100" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '1'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- ST [constante], Ri

            -- Lógica e Aritmética
            when "00101" => SEL_ALU <= "0000"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- ADD Ri, Rj
            when "00110" => SEL_ALU <= "0001"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- SUB Ri, Rj
            when "00111" => SEL_ALU <= "0010"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- AND Ri, Rj
            when "01000" => SEL_ALU <= "0011"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- NAND Ri, Rj
            when "01001" => SEL_ALU <= "0100"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- OR Ri, Rj
            when "01010" => SEL_ALU <= "0101"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- NOR Ri, Rj
            when "01011" => SEL_ALU <= "0110"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- XOR Ri, Rj
            when "01100" => SEL_ALU <= "0111"; ESCR_P <= '0'; SEL_R <= "11"; ESCR_R <= '1'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- XNOR Ri, Rj
            when "01101" => SEL_ALU <= "1000"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '1'; SEL_F <= "XXX"; -- CMP Ri, Rj

            -- Salto
            when "01110" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "010"; ESCR_F <= '0'; SEL_F <= "000"; -- JE constante
            when "01111" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "010"; ESCR_F <= '0'; SEL_F <= "001"; -- JL constante
            when "10000" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "010"; ESCR_F <= '0'; SEL_F <= "010"; -- JLE constante
            when "10001" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "010"; ESCR_F <= '0'; SEL_F <= "011"; -- JGE constante 
            when "10010" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "010"; ESCR_F <= '0'; SEL_F <= "100"; -- JG constante
            when "10011" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "001"; ESCR_F <= '0'; SEL_F <= "XXX"; -- JMP constante
            when "10100" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "011"; ESCR_F <= '0'; SEL_F <= "XXX"; -- JZ Ri, constante
            when "10101" => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "100"; ESCR_F <= '0'; SEL_F <= "XXX"; -- JN Ri, constante

            -- Outros
            when others => SEL_ALU <= "XXXX"; ESCR_P <= '0'; SEL_R <= "XX"; ESCR_R <= '0'; WR <= '0'; SEL_PC <= "000"; ESCR_F <= '0'; SEL_F <= "XXX"; -- NOP

		end case;

	end process;

end Behavioral;

