----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:43:56 03/04/2019 
-- Design Name: 
-- Module Name:    muxProgramCounter - Behavioral 
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

