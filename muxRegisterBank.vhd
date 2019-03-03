----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:19 03/03/2019 
-- Design Name: 
-- Module Name:    muxRegisterBank - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxRegisterBank is
    Port ( Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_M : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           Resultado : in  STD_LOGIC_VECTOR (7 downto 0);
           Dados_R : out  STD_LOGIC_VECTOR (7 downto 0);
           SEL_R : in  STD_LOGIC_VECTOR (1 downto 0));
end muxRegisterBank;

architecture Behavioral of muxRegisterBank is

begin

	process (Constante, Dados_M, Dados_IN, Resultado, SEL_R)
		begin
			case SEL_R is
				when "00" => Dados_R <= Constante;
				when "01" => Dados_R <= Dados_M;
				when "10" => Dados_R <= Dados_IN;
				when "11" => Dados_R <= Resultado;
				when others => Dados_R <= Constante;
			end case;
		end process;

end Behavioral;

