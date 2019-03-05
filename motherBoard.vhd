library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity motherBoard is
    Port ( PIN : in STD_LOGIC_VECTOR (7 downto 0);
           POUT : out STD_LOGIC_VECTOR (7 downto 0);
           Reset : in STD_LOGIC;
           clk : in STD_LOGIC);
end motherBoard;

architecture Struct of motherBoard is

    component RAM is
        Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
               Constante : in  STD_LOGIC_VECTOR (7 downto 0);
               WR : in  STD_LOGIC;
               clk : in  STD_LOGIC;
               Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component instructionMemory is
        Port ( Endereco : in  STD_LOGIC_VECTOR (7 downto 0);
               opcode : out  STD_LOGIC_VECTOR (4 downto 0);
               Registo_1 : out  STD_LOGIC_VECTOR (2 downto 0);
               Registo_2 : out  STD_LOGIC_VECTOR (2 downto 0);
               Constante : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component CPU is
        Port ( PIN : in STD_LOGIC_VECTOR (7 downto 0);
               POUT : out STD_LOGIC_VECTOR (7 downto 0);
               Reset : in STD_LOGIC;
               Endereco : out STD_LOGIC_VECTOR (7 downto 0);
               opcode : in STD_LOGIC_VECTOR (4 downto 0);
               Registo_1 : in STD_LOGIC_VECTOR (2 downto 0);
               Registo_2 : in STD_LOGIC_VECTOR (2 downto 0);
               Constante : in STD_LOGIC_VECTOR (7 downto 0);
               Operando1Output : out STD_LOGIC_VECTOR (7 downto 0);
               WR : out STD_LOGIC;
               Dados_M : in STD_LOGIC_VECTOR (7 downto 0);
               clk : in STD_LOGIC);
    end component;

    ---

    signal Operando1, Dados_M, Constante, Operando1Output, Endereco : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal opcode : STD_LOGIC_VECTOR (4 downto 0) := "00000";
	signal Registo_1, Registo_2 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal WR : STD_LOGIC;

    ---
    
begin

    A1: CPU port map (PIN, POUT, Reset, Endereco, opcode, Registo_1, Registo_2, Constante, Operando1, WR, Dados_M, clk);

    B1: RAM port map (Operando1, Constante, WR, clk, Dados_M);
    B2: instructionMemory port map (Endereco, opcode, Registo_1, Registo_2, Constante);

end Struct;

