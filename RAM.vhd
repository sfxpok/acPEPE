----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:09 03/04/2019 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (7 downto 0);
           Constante : in  STD_LOGIC_VECTOR (7 downto 0);
           WR : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Dados_M : out  STD_LOGIC_VECTOR (7 downto 0));
end RAM;

architecture Behavioral of RAM is

begin

	process(Operando1, Constante, WR, clk)
	type memory is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	variable memoryData : memory;
	
	begin
	
		if (WR = '0') then
			Dados_M <= memoryData(TO_INTEGER(unsigned(Constante)));
		else
			if (rising_edge(clk)) then
				memoryData(TO_INTEGER(unsigned(Constante))) := Operando1;
			end if;
		end if;
		
	end process;

end Behavioral;

