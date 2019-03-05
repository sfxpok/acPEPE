library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparisonRegister is
    Port ( R_FLAG : out  STD_LOGIC_VECTOR (4 downto 0);
           COMP_FLAG : in  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           ESCR_F : in  STD_LOGIC);
end comparisonRegister;

architecture Behavioral of comparisonRegister is

begin
    process (COMP_FLAG, clk, ESCR_F)
    begin
        if (ESCR_F = '1' and rising_edge(clk)) then
            R_FLAG <= COMP_FLAG;
        end if;

    end process;
    
end Behavioral;

