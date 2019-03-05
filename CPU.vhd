library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity CPU is
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
end CPU;

architecture Struct of CPU is

    component inputPeripheral is
        Port ( PIN : in  STD_LOGIC_VECTOR (7 downto 0);
               ESCR_P : in  STD_LOGIC;
               Dados_IN : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component outputPeripheral is
        Port ( POUT : out  STD_LOGIC_VECTOR (7 downto 0);
               ESCR_P : in  STD_LOGIC;
               clk : in  STD_LOGIC;
               Operando1 : in  STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component muxRegisterBank is
        Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
               Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
               Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
               Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
               Dados_R : out  STD_LOGIC_VECTOR (7 downto 0);
               SEL_R : in  STD_LOGIC_VECTOR (1 downto 0));
    end component;

    component registerBank is
        Port ( ESCR_R : in  STD_LOGIC;
               Dados_R : in  STD_LOGIC_VECTOR (7 downto 0);
               Registo_1 : in  STD_LOGIC_VECTOR (2 downto 0);
               Registo_2 : in  STD_LOGIC_VECTOR (2 downto 0);
               Operando1 : out  STD_LOGIC_VECTOR (7 downto 0);
               Operando2 : out  STD_LOGIC_VECTOR (7 downto 0);
               clk : in  STD_LOGIC);
    end component;

    component ALU is
        Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
               Operando2 : in  STD_LOGIC_VECTOR (7 downto 0);
               SEL_ALU : in  STD_LOGIC_VECTOR (3 downto 0);
               Resultado : out  STD_LOGIC_VECTOR (7 downto 0);
               COMP_FLAG : out  STD_LOGIC_VECTOR (4 downto 0));
    end component;

    component comparisonRegister is
        Port ( R_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
               COMP_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
               clk : in  STD_LOGIC;
               ESCR_F : in  STD_LOGIC);
    end component;

    component comparisonMUX is
        Port ( R_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
               S_FLAG : out  STD_LOGIC;
               SEL_F : in  STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component programCounter is
        Port ( clk : in  STD_LOGIC;
               Endereco : out  STD_LOGIC_VECTOR (7 downto 0);
               ESCR_PC : in  STD_LOGIC;
               Constante : in  STD_LOGIC_VECTOR (7 downto 0);
               Reset : in  STD_LOGIC);
    end component;

    component muxProgramCounter is
        Port ( ESCR_PC : out  STD_LOGIC;
               SEL_PC : in  STD_LOGIC_VECTOR (2 downto 0);
               S_FLAG : in STD_LOGIC;
               Operando1NOR : in STD_LOGIC;
               Operando1MaiorPeso : in STD_LOGIC);
    end component;

    component decodeROM is
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
    end component;

    component gateNOR is
        Port ( Operando1 : in STD_LOGIC_VECTOR (7 downto 0);
               Z : out  STD_LOGIC);
    end component;

    component gateNOT is
        Port ( A : in  STD_LOGIC;
               Z : out  STD_LOGIC);
    end component;

    ---

    signal Operando1, Operando2, Resultado, Dados_IN, Dados_R : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal COMP_FLAG, R_FLAG : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    signal SEL_ALU : STD_LOGIC_VECTOR (3 downto 0) := "0000";
	signal SEL_PC, SEL_F : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal SEL_R : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal ESCR_PC, ESCR_R, ESCR_F, ESCR_P, S_FLAG, Operando1NOR, ESCR_PNOT : STD_LOGIC := '0';

    ---

begin

    A1: inputPeripheral port map (PIN, ESCR_PNOT, Dados_IN);
    A2: outputPeripheral port map (POUT, ESCR_P, clk, Operando1);

    B1: muxRegisterBank port map (Constante, Dados_M, Dados_IN, Resultado, Dados_R, SEL_R);
    B2: registerBank port map (ESCR_R, Dados_R, Registo_1, Registo_2, Operando1, Operando2, clk);

    C1: ALU port map (Operando1, Operando2, SEL_ALU, Resultado, COMP_FLAG);

    D1: comparisonRegister port map (R_FLAG, COMP_FLAG, clk, ESCR_F);
    D2: comparisonMUX port map (R_FLAG, S_FLAG, SEL_F);

    E1: programCounter port map (clk, Endereco, ESCR_PC, Constante, Reset);
    E2: muxProgramCounter port map (ESCR_PC, SEL_PC, S_FLAG, Operando1NOR, Operando1(7));

    F1: decodeROM port map (opcode, SEL_PC, SEL_F, ESCR_F, SEL_ALU, ESCR_R, SEL_R, ESCR_P, WR, Registo_1, Registo_2);

    G1: gateNOT port map (ESCR_P, ESCR_PNOT);
    G2: gateNOR port map (Operando1, Operando1NOR);

    Operando1Output <= Operando1;

end Struct;

