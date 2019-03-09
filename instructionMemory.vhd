library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instructionMemory is
    Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
           opcode : out  STD_LOGIC_VECTOR (4 downto 0);
           Registo_1 : out  STD_LOGIC_VECTOR (2 downto 0);
           Registo_2 : out  STD_LOGIC_VECTOR (2 downto 0);
           Constante : out  STD_LOGIC_VECTOR (7 downto 0));
end instructionMemory;

architecture Behavioral of instructionMemory is

begin
    process (Endereco)
    begin
        
        case (Endereco) is

            when "00000000" => opcode <= "00000"; Registo_1 <= "000"; Registo_2 <= "XXX"; Constante <= "XXXXXXXX"; -- LDP R0; 1
            when "00000001" => opcode <= "00010"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000110"; -- LD R1, 6; 2
            when "00000010" => opcode <= "00100"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000001"; -- ST [1], R1; 3
            when "00000011" => opcode <= "00010"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "01100100"; -- LD R1, 100; 4
            when "00000100" => opcode <= "00100"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000010"; -- ST [2], R1; 5
            when "00000101" => opcode <= "00010"; Registo_1 <= "001"; Registo_2 <= "XXX"; Constante <= "00000000"; -- LD R1, 0; 6
            when "00000110" => opcode <= "00010"; Registo_1 <= "010"; Registo_2 <= "XXX"; Constante <= "00000001"; -- LD R2, 1; 7
            when "00000111" => opcode <= "01101"; Registo_1 <= "000"; Registo_2 <= "001"; Constante <= "XXXXXXXX"; -- CMP R0, R1; 8
            when "00001000" => opcode <= "10000"; Registo_1 <= "XXX"; Registo_2 <= "XXX"; Constante <= "00010000"; -- JLE 16; 9
            when "00001001" => opcode <= "00011"; Registo_1 <= "011"; Registo_2 <= "XXX"; Constante <= "00000001"; -- LD R3, [1]; 10
            when "00001010" => opcode <= "00010"; Registo_1 <= "100"; Registo_2 <= "XXX"; Constante <= "00000000"; -- LD R4, 0; 11
            when "00001011" => opcode <= "00101"; Registo_1 <= "100"; Registo_2 <= "000"; Constante <= "XXXXXXXX"; -- ADD R4, R0; 12
            when "00001100" => opcode <= "00110"; Registo_1 <= "011"; Registo_2 <= "010"; Constante <= "XXXXXXXX"; -- SUB R3, R2; 13
            when "00001101" => opcode <= "01101"; Registo_1 <= "011"; Registo_2 <= "001"; Constante <= "XXXXXXXX"; -- CMP R3, R1; 14
            when "00001110" => opcode <= "01110"; Registo_1 <= "XXX"; Registo_2 <= "XXX"; Constante <= "00010010"; -- JE 18; 15
            when "00001111" => opcode <= "10011"; Registo_1 <= "XXX"; Registo_2 <= "XXX"; Constante <= "00001011"; -- JMP 11; 16
            when "00010000" => opcode <= "00011"; Registo_1 <= "100"; Registo_2 <= "XXX"; Constante <= "00000010"; -- LD R4, [2]; 17
            when "00010001" => opcode <= "00101"; Registo_1 <= "100"; Registo_2 <= "000"; Constante <= "XXXXXXXX"; -- ADD R4, R0; 18
            when "00010010" => opcode <= "00010"; Registo_1 <= "000"; Registo_2 <= "XXX"; Constante <= "10000001"; -- LD R0, -1; 19
            when "00010011" => opcode <= "01000"; Registo_1 <= "100"; Registo_2 <= "000"; Constante <= "XXXXXXXX"; -- NAND R4, R0; 20
            when "00010100" => opcode <= "00101"; Registo_1 <= "100"; Registo_2 <= "010"; Constante <= "XXXXXXXX"; -- ADD R4, R2; 21
            when "00010101" => opcode <= "00001"; Registo_1 <= "100"; Registo_2 <= "XXX"; Constante <= "XXXXXXXX"; -- STP R4; 22
            when "00010110" => opcode <= "10011"; Registo_1 <= "XXX"; Registo_2 <= "XXX"; Constante <= "00010110"; -- JMP 22; 23
            when others => opcode <= "XXXXX"; Registo_1 <= "XXX"; Registo_2 <= "XXX"; Constante <= "XXXXXXXX"; ------ NOP; 24

        end case;

    end process;

end Behavioral;

